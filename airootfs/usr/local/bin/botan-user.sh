#!/bin/bash
# Kullanıcıyı oluştur (Fish shell ile ve gerekli gruplarla)
useradd -m -p "" -g users -G wheel,audio,video,storage,optical,power -s /usr/bin/fish liveuser

# Şifreyi boş ayarla (No password)
passwd -d liveuser

# Ana dizin izinlerini ayarla
chown -R liveuser:users /home/liveuser
rm -- "$0" &
