#!/bin/bash
# Nushell, a modern shell



echo "Installing Nushell..."
curl -fsSL https://apt.fury.io/nushell/gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/fury-nushell.gpg
echo "deb https://apt.fury.io/nushell/ /" | sudo tee /etc/apt/sources.list.d/fury.list
sudo apt update
sudo apt install -y nushell

cp -b $ROOT_DIR/assets/config.nu ~/.config/nushell/config.nu

gum confirm "Set Nushell as standard shell for $USER?" --default="No" && sudo chsh -s $(which nu) $USER

# nupm - Nushell package manager
#TODO: Find out if this is enough
# $env.NUPM_HOME = ($env.XDG_DATA_HOME | path join "nupm")

export restaller_message="Nushell installed."

read -n 1 -s -r -p "Press any key to continue"