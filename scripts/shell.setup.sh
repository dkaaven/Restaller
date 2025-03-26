#!/bin/bash
# Install bat and xclip with aliases
if [ -z "$ROOT_DIR" ]; then
    ROOT_DIR=".."
fi

source $ROOT_DIR/assets/functions.sh

# Install bat (improvement of cat)
sudo apt install -y bat
if [ ! -d "~/.local/bin" ];then
mkdir -p ~/.local/bin
fi
ln -s /usr/bin/batcat ~/.local/bin/bat

# Install xclip
sudo apt install -y xclip
add_to_shell_rc 'alias xcopy="xclip -i"'
add_to_shell_rc 'alias xpaste="xclip -o"'

read -n 1 -s -r -p "Press any key to continue"

