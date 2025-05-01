#!/bin/bash
# Git with --global settings

install_app git gh

# Get Git variables
if [ "$GIT_USER_NAME" = "" ]; then
    GIT_USER_NAME=$(gum input --placeholder "What is your Git username?")
fi
if [ "$GIT_EMAIL" = "" ]; then
    GIT_EMAIL=$(gum input --placeholder "What is your Git email?")
fi
if [ "$GIT_EDITOR" = "" ];then
    GIT_USER_NAME=$(gum input --placeholder "What is your editor (ex. code)?")
fi

if [ ! "$GIT_USER_NAME" = "" ]; then
git config --global user.name $GIT_USER_NAME
fi

if [ ! "$GIT_EMAIL" = "" ]; then
    git config --global user.email $GIT_EMAIL
fi
if [ ! "$GIT_EDITOR" = "" ];then
    git config --global core.editor $GIT_EDITOR
fi
git config --global init.defaultBranch main
git config --global push.default simple
git config --global core.ignorecase false

gum style --margin "1" --padding "1 15" "1. Select Github.com
2. Select https
3. Select Y to use credentials"
gh auth login
if ! command -v lazygit; then
    gum confirm "Install lazygit" && source $ROOT_DIR/scripts/dev/git-lazygit.sh
fi

restaller_apps="git gh"
restaller_message="Git installed and configured."