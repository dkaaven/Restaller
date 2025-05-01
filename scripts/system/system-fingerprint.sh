#!/bin/bash
# Fingerprint reader software for linux
if ! grep -q "^auth.*pam_fprintd\.so" /etc/pam.d/common-auth; then
    sudo apt install -y fprintd libpam-fprintd
    sudo pam-auth-update --enable fprintd
    echo ""
    echo "Log out to enable"
    echo ""
    export restaller_message="Fingerprint reader installed and enabled."
else
    export restaller_message="Fingerprint already installed"
fi

read -n 1 -s -r -p "Press any key to continue"