#!/bin/bash
# Podman is an open source alternative to Docker

# Install Podman

sudo apt install -y podman

# Start Podman VM
podman machine init
podman machine start

# Set alias in bashrc and reload
echo "# Run Podman instead of Docker" >> ~/.bashrc
echo "alias docker=podman" >> ~/.bashrc 
echo "alias docker-container='podman container'" >> ~/.bashrc 
source ~/.bashrc

if [ ! -e "~/.zshrc" ];then
    echo "" >> ~/.config/zsh/alias.zsh 
    echo "# Run Podman instead of Docker" >> ~/.config/zsh/alias.zsh 
    echo "alias docker=podman" >> ~/.config/zsh/alias.zsh
    echo "alias docker-container='podman container'" >> ~/.config/zsh/alias.zsh 
fi

read -n 1 -s -r -p "Press any key to continue"