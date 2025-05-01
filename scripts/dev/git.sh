#!/bin/bash
# Git with --global settings

if [ -z "$ROOT_DIR" ]; then
    ROOT_DIR=".."
fi

source $ROOT_DIR/config.sh

sudo apt install -y git gh
echo "Select Github.com"
echo "Select SSH"
echo "Select Y to use credentials"
gh auth login

if [ $GIT_USER_NAME="" ]; then
    read -p "Git user name; " GIT_USER_NAME
fi
if [ $GIT_EMAIL="" ]; then
    read -p "Git user email; " GIT_EMAIL
fi
git config --global user.name $GIT_USER_NAME
git config --global useremail $GIT_EMAIL

# TODO: Add read to config as well.


git config --global init.defaultBranch main
git config --global core.editor $GIT_EDITOR
git config --global push.default simple
git config --global core.ignorecase false

export restaller_message="Git installed"

read -n 1 -s -r -p "Press any key to continue"