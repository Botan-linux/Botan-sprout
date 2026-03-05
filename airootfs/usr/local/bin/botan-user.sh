#!/bin/bash
set -euo pipefail

USERNAME="liveuser"

# Kullanıcıyı oluştur (Fish shell ile ve gerekli gruplarla).
if ! id -u "$USERNAME" >/dev/null 2>&1; then
    useradd -m -p "" -g users -G wheel,audio,video,storage,optical,power -s /usr/bin/fish "$USERNAME"
fi

# Şifreyi boş ayarla (No password).
passwd -d "$USERNAME"

# Ana dizin izinlerini ayarla.
chown -R "$USERNAME":users "/home/$USERNAME"
rm -- "$0" &
