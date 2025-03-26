#!/bin/bash
# Fingerprint reader software for linux
if command -v apt >/dev/null 2>&1; then
echo "Installing fingerprint reader"
    sudo apt install -y fprintd libpam-fprintd
    sudo pam-auth-update --enable fprintd
    echo ""
    echo "Log out to enable"
    echo ""
else
    echo "APT is not installed"
fi