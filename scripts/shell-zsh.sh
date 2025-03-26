#!/bin/bash
# Zshell with plugins and starship

if [ -z "$ROOT_DIR" ]; then
    ROOT_DIR=".."
fi

echo "Installing Zsh..."
sudo apt install -y zsh
echo "Zsh installed."

echo "Set Zsh as standard"
sudo chsh -s $(which zsh) $USER
echo "Zsh set as standard for $USER."

# Zsh plugins
if [ ! -d ~/.config/zsh/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
    else
    rm -rf ~/.config/zsh/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
fi

if grep -q "zsh-autosuggestions.zsh" ~/.zshrc; then
    echo "Autosuggestions already added to zshrc"
else
    echo "" >> ~/.zshrc
    echo "# Zsh Autosuggestions" >> ~/.zshrc
    echo "autoload -Uz compinit" >> ~/.zshrc
    echo "compinit" >> ~/.zshrc
    echo "source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
fi

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
echo "" >> ~/.zshrc
echo "# Zsh Syntex Highlighting" >> ~/.zshrc
echo "source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc


# Starship
if [ ! -e /usr/local/bin/starship ]; then
source $ROOT_DIR/scripts/starship.sh
else

if grep -q "starship" ~/.zshrc; then
    echo "Starship already configured"
    else
        echo "" >> ~/.zshrc
        echo "# Load starship" >> ~/.zshrc
        echo 'eval "$(starship init zsh)"' >> ~/.zshrc
        echo "" >> ~/.zshrc
        echo "Starship configured"
fi

read -n 1 -s -r -p "Press any key to continue"