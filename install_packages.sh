#!/bin/bash

Packages="nginx curl wget"

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root."
    exit 1
fi

for pkg in $Packages; do
        if dpkg -s $pkg &> /dev/null; then
                echo "$pkg is already installed"
        else
                echo "$pkg is not installed. Installing $pkg...."
                apt install $pkg -y
                echo "$pkg installed successfully"
        fi
done
