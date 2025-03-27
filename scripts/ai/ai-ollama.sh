#!/bin/bash
# Install Ollama and download models (Dependent on and Podman)

if [ -z "$ROOT_DIR" ]; then
    ROOT_DIR=".."
fi

if [ ! -e "/usr/bin/ollama"]; then
    echo "Installing ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
    echo "Ollama installed."
fi

echo "Installing models..."
source $ROOT_DIR/config.sh
for model in "${ollama_models[@]}"; do
    ollama pull "$model"
done

# Check if podman is installed
if [ ! -e /usr/bin/podman ];then
source podman.sh
fi

podman run -d --network=host -v open-webui:/app/backend/data -e PORT=8080 -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main
xdg-open http://127.0.0.1:11434
read -n 1 -s -r -p "Press any key to continue"