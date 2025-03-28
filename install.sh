#!/bin/bash
# Install script

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

# Get an array of all files in scripts
files=()
# for file in scripts/*.sh; do
#     [ -f "$file" ] && files+=("$file")
# done

# Get files from sub-directorieus
mapfile -O 1 -t files < <(find scripts/ -type f -name "*.sh" | sort)

# Display list with tagline (2nd line in script)
# Run a script file based on the selection
selection=""
while [[ ! "$selection" =~ [Qq] ]]; do 
    clear
    echo ""
    cat assets/script-logo.txt
    echo ""

    for i in "${!files[@]}"; do
        tag=$(sed -n '2p' "${files[$i]}")
        name=$(basename "${files[$i]}")
        name="${name%.sh}"
        printf "[%2d]   %-22s %s\n" "$i" "$name" "$tag"
    done

    read -p "Enter a number to install, or q to quit: " selection

    if [[ "$selection" =~ ^[0-9]+$ ]]; then
        index=$((selection))
        echo "You selected index: ${files[$index]}. "
        source "$ROOT_DIR/${files[$index]}"
    fi
done