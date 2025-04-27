#!/bin/bash

sudo dpkg --add-architecture i386 ; sudo apt update
sudo apt install steam-installer -y

xdg-open steam-installer

restaller_message="Steam installing in background."