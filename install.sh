#!/bin/bash

ARCH=$(uname -m)

if [[ "$ARCH" == "x86_64" ]]; then
    FILE="udp-update-amd64"
elif [[ "$ARCH" == "aarch64" ]]; then
    FILE="udp-update-arm64"
else
    FILE="udp-update-arm"
fi

wget -qO /usr/local/bin/udp-update https://raw.githubusercontent.com/Aryus09/zivpn-installer/main/$FILE

chmod +x /usr/local/bin/udp-update
/usr/local/bin/udp-update
