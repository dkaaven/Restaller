#!/bin/bash
# Battle.net using Lutris
if [ -z "$ROOT_DIR" ]; then
    ROOT_DIR="../.."
fi

source $ROOT_DIR/assets/functions.sh
if ! command -v lutris;then
    source scripts/games/lutris.sh
fi

echo ""
echo "You need to open lutris once to setup"
read -p "Have you opened Lutris yet (y/n)" confirm

# Install Battle.net
if "$confirm" == "y";then
xdg-open lutris:battlenet-standard;
else
echo "Open lutris and re-run the script."
fi

read -n 1 -s -r -p "Press any key to continue"