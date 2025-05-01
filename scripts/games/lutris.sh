#!/bin/bash
# Lutris

# https://github.com/lutris/docs/blob/master/WineDependencies.md

# Enable 32 bit and download dependencies
sudo dpkg --add-architecture i386
sudo apt update
install_app wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386 lutris

xdg-open lutris

restaller_message="Lutris is installed."
read -n 1 -s -r -p "Press any key to continue"