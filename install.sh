#!/bin/bash
# Install script

# This defines the root folder of the script
export ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get the functions script.
source ./assets/functions.sh

# Check dependencies and run setup.sh if needed
dpkg -l gum &>/dev/null
if [ $? != '0' ];then
    source ./setup.sh
fi
source $ROOT_DIR/assets/gum-styles.sh

# Init variables
files=()
folders=()
selectfolder=""
currentfolder=""
selectscript=""
restaller_apps=""
restaller_message=""

logo=$(cat $ROOT_DIR/assets/script-logo.txt)

# Get all sub-directories scripts
folders=$(find scripts/ -mindepth 1 -maxdepth 1 -type d | sort)


while true; do
    # Display header
    clear
    gum style --margin "1" --padding "1 15" "$logo"
    if [ ! "$restaller_apps" == "" ]; then
        gum format --type="markdown" "# $restaller_apps"
    fi
    if [ ! "$restaller_message" = "" ]; then
        gum format --type="markdown" "# $restaller_message"
    fi
    echo ""
    selectedfolder=$(echo "$folders" | sed 's|scripts/||' | gum choose --header "Select a category:")

    # Exit the loop if user presses Esc or Ctrl+C
    if [ $? -ne 0 ]; then
        echo "Exiting..."
        break
    fi

    if [ -n $selectedfolder ];then
        files=$(find "scripts/$selectedfolder/" -mindepth 1 -maxdepth 1 -type f -name "*.sh" \
        | sed "s|scripts/$selectedfolder/||" \
        | sed "s|.sh$||")
        selectedscript=$(echo "$files" | gum choose --header "Select a script:")
        if [ -n "$selectedscript" ]; then
            source scripts/$selectedfolder/$selectedscript.sh

            selectedfolder=""
        fi
    fi
done

unset restaller_apps
unset restaller_message

if [ "$restart" == true ]; then
    gum confirm "Reboot is needed, reboot now?" && reboot || gum format --type="markdown" "# Reboot is recommended to finish install"
fi

# Remove all exported variables for GUM
source ./assets/gum-reset.sh