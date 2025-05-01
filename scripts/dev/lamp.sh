#!/bin/bash
# Installing a LAMP Stack

lamp_apps=()
gum choose --Title "Choose database" "Postgresql Mysql"

for app in $lamp_apps{
    bash -c "source $ROOT_DIR/lamp.$app.sh"
    restaller_apps+="$app"
}

export restaller_apps="$"
export restaller_message="Podman installed"

read -n 1 -s -r -p "Press any key to continue"