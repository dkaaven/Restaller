#!/bin/bash
# Podman is an open source alternative to Docker

# Install Podman

sudo apt install -y podman podman-compose podman-docker qemu-utils qemu-system-x86 virtiofsd

# Install Podman Desktop using flathub
if [ command -v flatpak ]; then
    flatpak install flathub io.podman_desktop.PodmanDesktop
fi

# Fetch latest version og gvproxy from GitHub for amd64 arch
if [ ! -e "/usr/local/lib/podman/gvproxy" ];then
    curl -s https://api.github.com/repos/containers/gvisor-tap-vsock/releases/latest | awk 'BEGIN { FS = "\"\\s*:\\s*" } /browser_download_url/ && /linux-amd64/ {print $2}' | xargs wget -O gvproxy-linux-amd64
    chmod +x ./gvproxy-linux-amd64
    sudo mkdir -p /usr/local/lib/podman/
    sudo mv gvproxy-linux-amd64 /usr/local/lib/podman/gvproxy
fi

# Fix the paths and config.
touch $HOME/.config/containers/containers.conf
cat <<EOT >> $HOME/.config/containers/containers.conf         
[engine]
  helper_binaries_dir = [
    "/usr/local/lib/podman",
    "/usr/libexec/podman",
    "/usr/lib/podman",
    "/usr/libexec"
  ]

EOT

# Setup podman compose
systemctl --user enable --now podman.socket
systemctl --user enable podman.service
systemctl --user start podman.service

# Start Podman VM
podman machine init
podman machine set --rootful=true
podman machine start

# Set alias in bashrc and reload
echo "# Run Podman instead of Docker" >> ~/.bashrc
echo "alias docker=podman" >> ~/.bashrc 
echo "alias docker-container='podman container'" >> ~/.bashrc 
source ~/.bashrc

# TODO:
# old_string='# unqualified-search-registries = ["example.com"]'
# new_string='unqualified-search-registries = ["docker.io"]'
# sudo sed -i "s|$old_string|$new_string|g" /etc/containers/registries.conf

if [ ! -e "~/.zshrc" ];then
    echo "" >> ~/.config/zsh/alias.zsh 
    echo "# Run Podman instead of Docker" >> ~/.config/zsh/alias.zsh 
    echo "alias docker=podman" >> ~/.config/zsh/alias.zsh
    echo "alias docker-container='podman container'" >> ~/.config/zsh/alias.zsh 
fi

export restaller_message="Podman installed"

read -n 1 -s -r -p "Press any key to continue"