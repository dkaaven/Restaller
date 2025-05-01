#!/bin/bash
# Starship and Jetbrains Mono Nerd Font

if [ -z "$ROOT_DIR" ]; then
    ROOT_DIR=".."
fi

# Nerd font
if [ ! -e ~/.local/share/fonts/JetBrainsMonoNerdFont-Regular.ttf ]; then
    echo "Installing Nerd-font: Jetbrain Mono..."
    wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip
    cd ~/.local/share/fonts
    unzip JetBrainsMono.zip
    rm JetBrainsMono.zip
    fc-cache -fv
    echo ""
    echo "Jetbrain Mono installed."
else
    echo "Jetbrain Mono already installed"
fi

# Starship
if [ ! -e /usr/local/bin/starship ]; then
    echo "Installing Starship..."
    curl -sS https://starship.rs/install.sh | sh
    echo ""
    echo "Starship installed."
    echo "Configuring Starship"

    if [ -e $ROOT_DIR/assets/starship.toml]; then
        cp $ROOT_DIR/.config/starship.toml ~/.config/starship.toml
    fi
else
    echo "Starship already installed"
fi

export restaller_message="Starship installed"

read -n 1 -s -r -p "Press any key to continue"
