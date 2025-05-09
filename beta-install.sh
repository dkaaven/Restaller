#!/bin/bash
# Install script (Beta), testing new functions ahead of time.

# This defines the root folder of the script
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export ROOT_DIR

# Check dependencies and run setup.sh if needed
dpkg -l gum &>/dev/null
if [ $? = '0' ];then
    echo "Gum installed"
elif [ $? = '1' ];then
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
    echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
    sudo apt update && sudo apt install gum
fi

source $ROOT_DIR/assets/gum-styles.sh


# Init variables
files=()
folders=()
selectfolder=""
currentfolder=""
selectscript=""

logo=$(cat assets/script-logo-beta.txt)


# Get all sub-directories scripts
folders=$(find scripts/ -mindepth 1 -maxdepth 1 -type d | sort)


while true; do
    # Display header
    clear
    gum style --border normal --margin "1" --padding "1 15" --border-foreground 212 "$logo"

    gum format --type="markdown" --theme="pink" "# $restaller_message"
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
