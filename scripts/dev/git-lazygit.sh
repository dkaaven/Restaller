#!/bin/bash
# Lazygit - Terminal UI for Git

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
gum spin --title "Downloading lazygit..." -- bash -c "curl -Lo lazygit.tar.gz \"https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz\""
gum spin --title "Unpacking lazygit..." -- bash -c "tar xf lazygit.tar.gz lazygit"
gum spin --title "Installing lazygit..." -- bash -c "sudo install lazygit -D -t /usr/local/bin/"
gum spin --title "Cleaning up..." -- bash -c "rm lazygit && rm lazygit.tar.gz"

export restaller_apps="lazygit"
export restaller_message=""