#!/bin/bash
# Minecraft Java edition and OpenSource JDK

sudo apt install default-jdk
wget https://launcher.mojang.com/download/Minecraft.deb
sudo apt install ./Minecraft.deb -y 
rm Minecraft.deb
minecraft-launcher

restaller_message="Minecraft is installing in background"