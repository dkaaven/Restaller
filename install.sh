#!/bin/bash
# Install script

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export ROOT_DIR

# Check if config exist or copy from template.
if [ ! -e "config.sh" ];then
    if [ ! -e "config.sh.temp" ];then
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
for file in scripts/*.sh; do
    [ -f "$file" ] && files+=("$file")
done

# Display list with tagline (2nd line in script)
clear

cat <<'EOF'
   ____           _        _ _           
  |  _ \ ___  ___| |_ __ _| | | ___ _ __ 
  | |_) / _ \/ __| __/ _` | | |/ _ \ '__|
  |  _ <  __/\__ \ || (_| | | |  __/ |   
  |_| \_\___||___/\__\__,_|_|_|\___|_|   

         Shell Script Installer
       -------------------------
            By Daniel Kåven
               @dkaaven
       -------------------------

EOF

for i in "${!files[@]}"; do
    tag=$(sed -n '2p' "${files[$i]}")
    name=$(basename "${files[$i]}")
    name="${name%.sh}"
    printf "[%2d]   %-22s %s\n" "$((i + 1))" "$name" "$tag"
done


# Run a script file based on the selection
selection=""
while true;do
    read -p "Enter a number to install, or q to quit: " selection

    if [[ "$selection" == "q" || "$selection" == "Q" ]]; then
        echo "Quitting."
        break
    elif [[ "$selection" =~ ^[0-9]+$ ]]; then
        index=$((selection - 1))
        echo "You selected index: ${files[$index]}. "
        source "$ROOT_DIR/${files[$index]}"
    else
        echo "Invalid input. Please enter a number or 'q'."
    fi
done