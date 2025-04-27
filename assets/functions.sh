#!/bin/bash
function add_to_shell_rc () {
    # One command to add to all installed shells rc's.
    local name=$1
    local string=$2

    # Bash
    if grep -q "$string" $HOME/.bashrc; then
        echo "$name already added to .bashrc"
    else   
        cat $string >> ~/.bashrc
    fi

    # Zshell
    if [ -e /usr/bin/zsh ];then
        if $name="alias";then
            touch "$HOME/.config/zsh/$name.zsh"
            echo $string >> $HOME/.config/zsh/$name.zsh
            if grep -q "source ~/.config/zsh/alias.zsh" $HOME/.zshrc; then
            
            else
                echo "source ~/.config/zsh/alias.zsh" >> $HOME/.zshrc
            fi                
        elif [ -e $HOME/.config/zsh/$name.zsh ];then
            echo "$name already exists in zsh"
        else   
            touch "$HOME/.config/zsh/$name.zsh"
            echo $string >> $HOME/.config/zsh/$name.zsh
            echo "source ~/.config/zsh/$name.zsh" >> $HOME/.zshrc
        fi
    fi

    # Nushell
    if [ -e /usr/bin/nu ];then
        if [ -e $HOME/.config/nushell/$name.nu ];then
            echo "$name already exists in nushell"
        else   
            touch "$HOME/.config/nushell/$name.nu"
            echo $string >> $HOME/.config/nushell/$name.nu
            echo "source $HOME/.config/nushell/$name.sh" >> $HOME/.config/nushell/config.nu
        fi
    fi

}

#function add_to_repo () {
#}
