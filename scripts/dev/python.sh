#!/bin/bash
# Python with UV

if [ -z "$ROOT_DIR" ]; then
    ROOT_DIR="../.."
fi

source $ROOT_DIR/assets/functions.sh

sudo apt install -y python3 python3-pip

# Install UV
curl -LsSf https://astral.sh/uv/install.sh | sh

shell_text='
# Python UV
eval "$(uv generate-shell-completion bash)"
eval "$(uvx --generate-shell-completion bash)"'

add_to_shell_rc "UV" $shell_text 

read -n 1 -s -r -p "Press any key to continue"