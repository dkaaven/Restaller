#Gnome GTK
mkdir ~/.themes/
wget "https://github.com/dracula/gtk/archive/master.zip"
unzip master.zip -d ~/.themes/ 
gsettings set org.gnome.desktop.interface gtk-theme "$THEMENAME"
gsettings set org.gnome.desktop.wm.preferences theme "$THEMENAME"
rm master.zip

## Fix for gtk 4.0?
cp -r ~/.themes/gtk-master/assets ~/.config
if [ -e ~/.config/gtk-4.0/ ];then;else 
mkdir ~/.config/gtk-4.0/
fi
cp -r ~/.themes/gtk-master/gtk-4.0/gtk.css ~/.config/gtk-4.0/
cp -r ~/.themes/gtk-master/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/

#Gnome GTK Icons
mkdir ~/.icons/
wget "https://github.com/dracula/gtk/files/5214870/Dracula.zip" .
unzip Dracula.zip -d ~/.icons/
gsettings set org.gnome.desktop.interface icon-theme "$THEMENAME"
rm Dracula.zip
