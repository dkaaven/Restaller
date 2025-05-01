#!/bin/bash

function add_to_shell_rc () {
    local name="$1"
    local string="$2"

    # ---------- BASH ----------
    if command -v bash >/dev/null 2>&1; then
        local bash_config_dir="$HOME/.config/bash"
        local bash_file="$bash_config_dir/${name}.bash"

        mkdir -p "$bash_config_dir"

        if ! grep -Fq "$string" "$bash_file" 2>/dev/null; then
            echo "$string" >> "$bash_file"
            echo "$name added to bash"
        fi

        # Ensure it's sourced in .bashrc
        if ! grep -q "source ~/.config/bash/${name}.bash" "$HOME/.bashrc"; then
            echo "source ~/.config/bash/${name}.bash" >> "$HOME/.bashrc"
        fi
    fi

    # ---------- ZSH ----------
    if command -v zsh >/dev/null 2>&1; then
        local zsh_config_dir="$HOME/.config/zsh"
        local zsh_file="$zsh_config_dir/${name}.zsh"

        mkdir -p "$zsh_config_dir"

        if ! grep -Fq "$string" "$zsh_file" 2>/dev/null; then
            echo "$string" >> "$zsh_file"
            echo "$name added to zsh"
        fi

        # Ensure it's sourced in .zshrc
        if ! grep -q "source ~/.config/zsh/${name}.zsh" "$HOME/.zshrc"; then
            echo "source ~/.config/zsh/${name}.zsh" >> "$HOME/.zshrc"
        fi
    fi
}

install_app() {
    apps=("$@")

    for app in "${apps[@]}"; do
        gum spin --title "Installing $app..." -- bash -c "sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq $app"
    done
    export restaller_apps="Installed apps: $@"
}



# function add_ppt () {
#     name=$1
#     url=$2
# TODO: Find a better way to add gpg, need to add deb url

#     if [[ "$url" == *gpg ]];then
#         if [ ! -e "/usr/share/keyrings/$name-archive-keyring.asc" ];then
#             # Get GPG signature key
#             sudo wget $URL -O /usr/share/keyrings/$name-archive-keyring.asc
#             # Add to repository
#             echo "deb [ signed-by=/usr/share/keyrings/$name-archive-keyring.asc ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs $name main" | sudo tee /etc/apt/sources.list.d/$name.list
#             sudo apt update
#         fi
#     else
#         echo "Error: Not a correct URL for keyring, need to end with gpg."
#     fi

# }
