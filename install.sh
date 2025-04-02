#!/bin/bash
# Install script (Beta), testing new functions ahead of time.

# This defines the root folder of the script
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export ROOT_DIR

# Check if config exist or copy from template.
if [ ! -e "config.sh" ];then
    if [ -e "config.sh.temp" ];then
        cp config.sh.temp config.sh
        echo -e "Config file was created, please update it before you continue."
        read ""
        exit
    else
        touch config.sh
        echo -e "An empty Config file was created, Check variables needed."
        read ""
        exit
    fi
fi

# Init variables
files=()
folders=()
selectfolder=""
currentfolder=""
selectscript=""

# Get all sub-directories scripts
mapfile -O 1 -t folders < <(find scripts/ -mindepth 1 -maxdepth 1 -type d | sort)

while [[ ! "$selectfolder" =~ [Qq] ]]; do 
    clear
    echo ""
    cat assets/script-logo.txt
    echo ""
    if [[ $currentfolder == "" ]]; then
        for i in "${!folders[@]}"; do
            tag=$(sed -n '1p' "${folders[$i]}/README.md")
            name=$(basename "${folders[$i]}")
            printf "[%2d]   %-22s %s\n" "$i" "$name" "$tag"
        done

        read -p "Enter a number to install, or q to exit: " selectfolder
      
        if [[ "$selectfolder" =~ ^[0-9]+$ ]]; then
            index=$((selectfolder))
            currentfolder=$(basename "${folders[$index]}")
        fi

    else
        mapfile -t files < <(find scripts/$currentfolder -type f -name "*.sh" | sort)
        for i in "${!files[@]}"; do
            tag=$(sed -n '2p' "${files[$i]}")
            name=$(basename "${files[$i]}")
            name="${name%.sh}"
            printf "[%2d]   %-22s %s\n" "$((i + 1))" "$name" "$tag"
        done

        read -p "Enter a number to install, or Enter to return to main: " selectscript

        if [[ "$selectscript" == "" ]]; then
            currentfolder=""
        elif [[ "$selectscript" =~ ^[0-9]+$ ]]; then
            index=$((selectscript - 1))
            echo "You selected index: ${files[$index]}. "
            source "$ROOT_DIR/${files[$index]}"
        else
            echo "Invalid input. Please enter a number or press Enter."
        fi
    fi
done