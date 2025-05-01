#!/bin/bash
# Make Ubuntu right
# https://github.com/polkaulfield/ubuntu-debullshit
gum confirm --Title "Run Debullshit to remove Snap and install flatpak and Gnome." && sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/polkaulfield/ubuntu-debullshit/main/ubuntu-debullshit.sh)" && restaller_message "Your computer needs a reboot" && restart=true