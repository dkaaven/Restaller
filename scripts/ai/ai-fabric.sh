#!/bin/bash
# Fabric by Daniel Miessler (Dependencies: Go)

## Install Go
if [ ! -e "/usr/bin/go" ]; then
    sudo add-apt-repository -y ppa:longsleep/golang-backports
    sudo apt update
    sudo apt install -y golang-go
fi

shell_text='
# Golang environment variables
export GOROOT=/usr/local/go
export GOPATH=$HOME/go

# Update PATH to include GOPATH and GOROOT binaries
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH
'

add_to_shell_rc "go" $shell_text


if [ ! -e "~/go/bin/fabric" ];then
    # Install Fabric
    curl -L https://github.com/danielmiessler/fabric/releases/latest/download/fabric-linux-amd64 > fabric && chmod +x fabric && ./fabric --version
    go install github.com/danielmiessler/fabric@latest
fi

shell_text=$(< $ROOT_DIR/assets/fabric.sh)

add_to_shell_rc fabric $shell_text

fabric --setup


restaller_message="Fabric installed."
read -n 1 -s -r -p "Press any key to continue"