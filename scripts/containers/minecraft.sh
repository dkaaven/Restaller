#!/bin/bash
# Dockge  https://github.com/louislam/dockge

if [ -z "$ROOT_DIR" ]; then
    ROOT_DIR="../.."
fi
if ! command -v podman ]; then
    source "$ROOT_DIR/scripts/dev/podman.sh"
fi

mkdir $HOME/podman/minecraft_data
touch $HOME/podman/minecraft_data/eula.txt
echo "eula=true" >> $HOME/podman/minecraft_data/eula.txt

podman compose -f $ROOT_DIR/scripts/containers/compose.minecraft.yaml up --detach

# Update the hosts file
if grep -q "127.0.0.1:25565 minecraft.pod" /etc/hosts; then
    echo "Already in hosts"
else
    sudo bash -c "echo '127.0.0.1:25565 minecraft.pod' >> /etc/hosts"
    sudo systemctl restart systemd-hostnamed
fi

export restaller_message="Minecraft container installed."
read -n 1 -s -r -p "Press any key to continue"