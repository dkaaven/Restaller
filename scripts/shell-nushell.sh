#!/bin/bash
# Nushell, a modern shell

if [ -z "$ROOT_DIR" ]; then
    ROOT_DIR=".."
fi

echo "Installing Nushell..."
curl -fsSL https://apt.fury.io/nushell/gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/fury-nushell.gpg
echo "deb https://apt.fury.io/nushell/ /" | sudo tee /etc/apt/sources.list.d/fury.list
sudo apt update
sudo apt install -y nushell
echo "Nushell installed."

cp -b $ROOT_DIR/assets/config.nu ~/.config/nushell/config.nu

read -p "Set Nushell as standard shell for $USER (y/n)" confirm

if [ "$confirm" == "y" ] ;then
    echo "Set Nushell as standard"
    sudo chsh -s $(which nu) $USER
    echo "Nushell set as standard for $USER."
fi


# nupm - Nushell package manager
#TODO: Find out if this is enough
# $env.NUPM_HOME = ($env.XDG_DATA_HOME | path join "nupm")

read -n 1 -s -r -p "Press any key to continue"