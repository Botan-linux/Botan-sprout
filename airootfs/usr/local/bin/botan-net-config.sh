#!/bin/bash
set -euo pipefail
umask 022

# Botan Linux Netinstall Hazırlayıcı (Kendi Kendini Silen Versiyon)
CONF_DIR="/usr/share/calamares/modules/netinstall"
YAML_FILE="$CONF_DIR/netinstall.yaml"
CONF_FILE="$CONF_DIR/netinstall.conf"

echo "🌱 Botan Linux Netinstall yapılandırılıyor..."

# 1. Root Kontrolü
if [ "$EUID" -ne 0 ]; then
  echo "❌ Hata: Lütfen bu betiği sudo ile çalıştırın."
  exit 1
fi

# 2. Klasör Hazırlığı
mkdir -p "$CONF_DIR"

# 3. Eski/Çakışan dosyaları temizle
rm -f "$CONF_FILE" "$YAML_FILE"

# 4. netinstall.conf Oluşturma
cat << 'EOF' > "$CONF_FILE"
---
groupsUrl: "file:///usr/share/calamares/modules/netinstall/netinstall.yaml"
required: false
label:
    sidebar: "Masaüstü"
    title: "Masaüstü Ortamı Seçimi"
EOF

# 5. netinstall.yaml Oluşturma
cat << 'EOF' > "$YAML_FILE"
---
- name: "Botan Desktop Environments"
  description: "Lütfen kurmak istediğiniz masaüstü ortamını seçiniz."
  critical: true
  groups:
    - name: "XFCE Edition"
      description: "Hafif ve Hızlı"
      packages:
        - xfce4
        - xfce4-goodies
        - lightdm
        - lightdm-gtk-greeter

    - name: "KDE Plasma"
      description: "Modern ve Şık"
      packages:
        - plasma-desktop
        - sddm
        - dolphin
        - konsole

    - name: "GNOME"
      description: "Sade ve Akıcı"
      packages:
        - gnome
        - gnome-extra
        - gdm

    - name: "Botan Essential Tools"
      description: "Temel araçlar (Önerilir)"
      selected: true
      packages:
        - firefox
        - git
        - base-devel
        - fastfetch
EOF

# 6. İzinleri Ayarla
chmod 644 "$CONF_FILE" "$YAML_FILE"

# 7. Doğrulama ve Kendi Kendini Silme
if [ -s "$YAML_FILE" ]; then
    echo "✅ Botan Netinstall başarıyla yapılandırıldı!"
    echo "📍 Konum: $CONF_DIR"
    echo "♻️ İşlem tamamlandı, script kendisini siliyor..."
    rm -- "$0"
else
    echo "❌ Hata: Dosyalar oluşturulamadı! Script silinmedi."
    exit 1
fi
