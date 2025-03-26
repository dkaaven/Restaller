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
    cp ~/.bashrc ~/.bashrc.backup
    cat go.sh >> ~/.bashrc
    source ~/.bachrc
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
    cat $ROOT_DIR/assets/fabric.sh >> ~/.bashrc
    source ~/.bachrc

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