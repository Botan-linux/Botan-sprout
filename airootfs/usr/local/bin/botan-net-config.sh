#!/bin/bash

# Botan Linux Netinstall Yapılandırma Hazırlayıcı
CONF_DIR="/etc/calamares/modules"
YAML_FILE="$CONF_DIR/netinstall.yaml"
CONF_FILE="$CONF_DIR/netinstall.conf"

echo "🌱 Botan Linux Netinstall yapılandırılıyor..."

# Klasörün varlığından emin ol (Hata vermemesi için)
mkdir -p "$CONF_DIR"

# 1. netinstall.conf Oluşturma
cat <<EOF > "$CONF_FILE"
---
groupsUrl: "file:///etc/calamares/modules/netinstall.yaml"
required: false
label:
    sidebar: "Masaüstü"
    title: "Masaüstü Ortamı Seçimi"
EOF

# 2. netinstall.yaml Oluşturma
cat <<EOF > "$YAML_FILE"
---
- name: "Botan Masaüstü Seçenekleri"
  description: "Lütfen kurmak istediğiniz masaüstü ortamını seçiniz."
  critical: true
  groups:
    - name: "XFCE (Hafif ve Hızlı)"
      description: "Düşük kaynak tüketen, stabil masaüstü."
      packages:
        - xfce4
        - xfce4-goodies
        - lightdm
        - lightdm-gtk-greeter

    - name: "KDE Plasma (Modern ve Şık)"
      description: "Yüksek özelleştirilebilir modern arayüz."
      packages:
        - plasma-desktop
        - sddm
        - dolphin
        - konsole

    - name: "GNOME (Sade ve Akıcı)"
      description: "Modern ve minimalist kullanıcı deneyimi."
      packages:
        - gnome
        - gnome-extra
        - gdm

    - name: "Botan Standart Araçlar"
      description: "Botan Linux için temel sistem araçları."
      hidden: false
      selected: true
      packages:
        - firefox
        - neofetch
        - git
        - base-devel
EOF

echo "✅ Netinstall dosyaları hazırlandı."

# Sadece kendi script dosyasını sil (Service dosyasını shellprocess silecek)
rm -f "$0"
