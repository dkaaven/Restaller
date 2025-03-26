THEMENAME="Dracula"
PALETTENAME="dracula"


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
