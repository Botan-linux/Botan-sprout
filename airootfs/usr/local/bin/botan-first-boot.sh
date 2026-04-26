#!/bin/bash
set -euo pipefail

# GÜVENLİK: Eğer Live ortamdaysak (USB), bu scripti çalıştırma!
if [ -d "/run/archiso" ]; then
    echo "⚠️ Bu script sadece kurulu sistemde çalışabilir."
    exit 0
fi

echo "🚀 Kernel imajları oluşturuluyor..."
mkinitcpio -P

echo "✅ İlk açılış çekirdek hazırlığı tamamlandı."
