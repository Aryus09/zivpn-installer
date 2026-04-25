#!/bin/bash

clear
echo "🚀 INSTALL UDPGW + ZIVPN"

# STOP BIAR GAK TEXT BUSY
pkill -f udp-update 2>/dev/null
rm -f /usr/local/bin/udp-update

# DETEKSI ARCH
ARCH=$(uname -m)

if [[ "$ARCH" == "x86_64" ]]; then
    FILE="udp-update-amd64"
elif [[ "$ARCH" == "aarch64" ]]; then
    FILE="udp-update-arm64"
else
    FILE="udp-update-arm"
fi

echo "📦 Downloading: $FILE"

# DOWNLOAD BENAR (PAKAI $FILE)
wget -q https://raw.githubusercontent.com/Aryus09/zivpn-installer/main/$FILE -O /usr/local/bin/udp-update

# CEK DOWNLOAD
if [ ! -s /usr/local/bin/udp-update ]; then
    echo "❌ Gagal download binary!"
    exit 1
fi

chmod +x /usr/local/bin/udp-update

echo "🚀 Menjalankan UDP..."
/usr/local/bin/udp-update

if [ $? -ne 0 ]; then
    echo "❌ UDPGW gagal jalan"
    exit 1
fi

echo "✅ UDPGW DONE"
