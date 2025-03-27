#!/bin/bash
# Fabric by Daniel Miessler (Dependencies: Go)
if [ -z "$ROOT_DIR" ]; then
    ROOT_DIR=".."
fi


## Install Go
if [ ! -e "/usr/bin/go" ]; then
    sudo add-apt-repository -y ppa:longsleep/golang-backports
    sudo apt update
    sudo apt install -y golang-go
    # Golang environment variables
    if grep -q "/usr/local/go" ~/.bashrc; then
        echo "Go already added to .bashrc";else
        cp -b ~/.bashrc ~/.bashrc.backup
        cat go.sh >> ~/.bashrc
        source ~/.bachrc
    fi
else
    echo "Go is already installed"
fi
if [ -e ~/.zshrc ];then
    cat $ROOT_DIR/assets/go.zsh >> ~/.config/zsh/go.zsh
    if grep -q "/go.zsh" ~/.zshrc; then
        echo "Go already added to .zshrc";else
        echo "source ~/.config/zsh/fabric.zsh" >> ~/.zshrc
        echo "Go added to .zshrc"
    fi
fi


if [ ! -e "~/go/bin/fabric" ];then
    # Install Fabric
    curl -L https://github.com/danielmiessler/fabric/releases/latest/download/fabric-linux-amd64 > fabric && chmod +x fabric && ./fabric --version
    go install github.com/danielmiessler/fabric@latest
    if grep -q "~/.config/fabric/patterns/" ~/.bashrc; then
        echo "Fabric already added to .bashrc";else   
        cat $ROOT_DIR/assets/fabric.sh >> ~/.bashrc
        source ~/.bachrc
    fi

    if [ -e ~/.zshrc ];then
  
        cp $ROOT_DIR/assets/fabric.zsh ~/.config/zsh/fabric.zsh
        if grep -q "fabric.zsh" ~/.zshrc; then
            echo "Fabric already added to .zshrc";else
            echo "source ~/.config/zsh/fabric.zsh" >> ~/.zshrc
            echo "Fabric added to .zshrc"
        fi

    fi

    fabric --setup

fi

read -n 1 -s -r -p "Press any key to continue"