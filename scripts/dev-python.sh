#!/bin/bash
# Python with UV

sudo apt install -y python
sudo apt install -y pip

# Install UV
curl -LsSf https://astral.sh/uv/install.sh | sh

#add to bashrc
if  grep -q "uv generate-shell" ~/.bashrc;then
echo "UV already added to .bashrc";
else
echo 'eval "$(uv generate-shell-completion bash)"' >> ~/.bashrc
echo 'eval "$(uvx --generate-shell-completion bash)"' >> ~/.bashrc
fi

#Add to zshrc
if [ -e ~/.zshrc ];then
    if  grep -q "uv generate-shell" ~/.zshrc;then
        echo "UV already added to .zshrc";
    else
        echo 'eval "$(uv generate-shell-completion zsh)"' >> ~/.zshrc
        echo 'eval "$(uvx --generate-shell-completion zsh)"' >> ~/.zshrc
    fi
else
    echo ".zshrc does not exist"
fi