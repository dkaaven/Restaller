#!/bin/bash
# Codium is a Telemetry-free version of Visual Studio Code

if command -v apt >/dev/null 2>&1; then

# Get GPG signature key
sudo wget https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg -O /usr/share/keyrings/vscodium-archive-keyring.asc
# Add to repository
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.asc ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list

sudo apt update && sudo apt install -y codium

# Set code as alias for codium
echo "alias code=codium" >> ~/.bashrc

if [ -e ~/.zshrc ];then
echo "alias code=codium" >> ~/.config/zsh/alias.sh
fi

fi