#!/bin/bash

# Install dependencies
sudo apt install -y curl git

# Install gum (charm.sh)
dpkg -l gum &>/dev/null
if [ $? = '0' ];then
    echo "Gum installed"
elif [ $? = '1' ];then
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
    echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
    sudo apt update && sudo apt install gum
fi

# Clone installer
git clone https://github.com/dkaaven/restaller
cd restaller

read -p "Choose (S)tandard or (B)eta: " installer
if [ $installer = "s" ];then
    bash install.sh
elif [ $installer = "b" ];then
    bash install-beta.sh
else
    echo "Choose (s)tandard or (b)eta..."
fi

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