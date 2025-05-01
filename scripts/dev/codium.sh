#!/bin/bash
# Codium is a Telemetry-free version of Visual Studio Code

if [ ! -e "/usr/share/keyrings/vscodium-archive-keyring.asc" ];then
    # Get GPG signature key
    sudo wget https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg -O /usr/share/keyrings/vscodium-archive-keyring.asc
    # Add to repository
    echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.asc ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
    sudo apt update
fi

install_app codium

add_to_shell_rc "alias" 'alias code=codium'

export restaller_message="Codium installed"

read -n 1 -s -r -p "Press any key to continue"