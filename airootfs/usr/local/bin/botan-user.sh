#!/bin/bash
set -euo pipefail

LIVE_USER="liveuser"
LIVE_GROUP="users"
LIVE_SHELL="/usr/bin/fish"
LIVE_EXTRA_GROUPS="wheel,audio,video,storage,optical,power"

# Kullanıcı zaten varsa tekrar oluşturma; sadece izinleri ve shell'i düzelt.
if id -u "$LIVE_USER" >/dev/null 2>&1; then
  echo "ℹ️ $LIVE_USER zaten mevcut, kullanıcı oluşturma atlanıyor."
  usermod -s "$LIVE_SHELL" "$LIVE_USER"
else
  echo "👤 $LIVE_USER oluşturuluyor..."
  useradd -m -p "" -g "$LIVE_GROUP" -G "$LIVE_EXTRA_GROUPS" -s "$LIVE_SHELL" "$LIVE_USER"
fi

# Şifreyi boş bırak (live oturum için)
passwd -d "$LIVE_USER" >/dev/null

# Ana dizin izinlerini ayarla
chown -R "$LIVE_USER:$LIVE_GROUP" "/home/$LIVE_USER"

echo "✅ $LIVE_USER hazır."
