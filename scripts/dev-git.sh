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

git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_EMAIL

git config --global init.defaultBranch main
git config --global core.editor $GIT_EDITOR
git config --global push.default simple
git config --global core.ignorecase false