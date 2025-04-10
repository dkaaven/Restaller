#!/bin/bash
# Dracula from draculatheme.com

#Config part
THEMENAME="Dracula"
VSCODE="dracula-theme.theme-dracula"


if [ -z "$ROOT_DIR" ]; then
    ROOT_DIR=""
fi


#TODO: Check which desktop environment

# VS Code
code --install-extension $VSCODE

# Starship
if grep -q "[palettes.dracula]" ~/.config/starship.toml ; then
    echo "$THEMENAME already in starship.toml" ;
else
    cat "$ROOT_DIR/dracula/starship.theme.toml" >> ~/.config/starship.toml ;
    echo "$THEMENAME theme added to starship.toml"
fi

## TODO: Fix this

if grep -q "palettes = \"dracula\"" ~/.config/starship.toml ; then
    echo "Theme already set to $THEMENAME" ;
else
    echo "Change to \"palettes = dracula\" in starship.toml"
fi

read -n 1 -s -r -p "Press any key to continue"
