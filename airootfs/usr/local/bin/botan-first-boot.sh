#!/bin/bash

# GÜVENLİK: Eğer Live ortamdaysak (USB), bu scripti çalıştırma!
if [ -d "/run/archiso" ]; then
    echo "⚠️ Bu script sadece kurulu sistemde çalışabilir."
    exit 0
fi

echo "🚀 Kernel imajları oluşturuluyor..."
sudo mkinitcpio -P

# Kendini ve varsa sistemd servisini yok et
echo "🧹 Temizlik yapılıyor..."
rm -- "$0" &
