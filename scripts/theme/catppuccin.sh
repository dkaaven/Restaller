#/!/bin/bash
# Catppuccin Theme from catppuccin.com

selection=""

while true; do
clear
cat <<"EOF"

Choose a theme palette:

[1] Frappe
[2] Latte
[3] Macchiato
[4] Mocha

EOF

read -p "Choose an option, or enter to return: " selection

    if [[ selection == "" ]]; then
        return
    elif [[ "$selection" =~ ^[1-4] ]]; then
        echo "you selected $selection"
        read -p ""
        return
    else
        echo "Invalid input. Please enter a number or press Enter."
        selection=""
    fi
done

THEMENAME="Catppuccin"
PALETTENAME="catppuccin"


#Gnome GTK
mkdir ~/.themes/
wget "https://github.com/dracula/gtk/archive/master.zip"
unzip master.zip -d ~/.themes/ 
gsettings set org.gnome.desktop.interface gtk-theme "$THEMENAME"
gsettings set org.gnome.desktop.wm.preferences theme "$THEMENAME"
rm master.zip

#Gnome GTK Icons
mkdir ~/.icons/
wget "https://github.com/dracula/gtk/files/5214870/Dracula.zip" .
unzip Dracula.zip -d ~/.icons/
gsettings set org.gnome.desktop.interface icon-theme "$THEMENAME"
rm Dracula.zip

# Starship
if grep -q $THEMEPALETTE "~/.config/starship.toml" ; then
    echo "$THEMENAME already in starship.toml" ;
else
    cat starship.theme.toml >> ~/.config/starship.toml ;
    echo "$THEMENAME theme added to starship.toml"
fi

if grep -q "palette = \"$PALETTENAME\"" ~/.config/starship.toml ; then
    echo "Theme already set to $THEMENAME" ;
else

    echo "$THEMENAME theme added to starship.toml"
fi

read -n 1 -s -r -p "Press any key to continue"