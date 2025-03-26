#!/bin/bash
function add_to_shell_rc () {
    # One command to add to all installed shells rc's.
    local string=$1

    # Bash
    echo $string >> ~/.bashrc

    # Zsh
    if [ -e /usr/bin/zsh ];then
        echo $string >> ~/.zshrc
    fi

    #TODO: check if string exists, 
}
