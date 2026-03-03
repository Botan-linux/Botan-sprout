#!/bin/bash

# Botan Linux Netinstall Yapılandırma Hazırlayıcı
CONF_DIR="/etc/calamares/modules"
YAML_FILE="$CONF_DIR/netinstall.yaml"
CONF_FILE="$CONF_DIR/netinstall.conf"

echo "🌱 Botan Linux Netinstall yapılandırılıyor..."

mkdir -p "$CONF_DIR"

# 1. netinstall.conf (Daha temiz ve standart yapı)
cat <<EOF > "$CONF_FILE"
---
groupsUrl: "/etc/calamares/modules/netinstall.yaml"
required: false
label:
    sidebar: "Masaüstü"
    title: "Masaüstü Ortamı Seçimi"
EOF

# 2. netinstall.yaml (Calamares'in sevdiği formatta)
cat <<EOF > "$YAML_FILE"
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

echo "✅ Netinstall dosyaları standartlara uygun hale getirildi."

# Kendini silme işlemi
rm -f "$0"
