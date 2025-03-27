#!/bin/bash
# Battle.net using Lutris

# https://github.com/lutris/docs/blob/master/WineDependencies.md

# Enable 32 bit and download dependencies
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386 lutris

echo ""
echo "You need to open lutris once to setup"
read -p "Have you opened Lutris yet (y/n)" confirm

# Install Battle.net
if "$confirm" == "y";then
xdg-open lutris:battlenet-standard;
else
echo "Open lutris and re-run the script."
fi

read -n 1 -s -r -p "Press any key to continue"