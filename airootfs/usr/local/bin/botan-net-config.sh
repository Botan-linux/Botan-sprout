#!/bin/bash

# Botan Linux Netinstall Hazırlayıcı (Kalıcı Versiyon)
CONF_DIR="/etc/calamares/modules"
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
groupsUrl: "file:///etc/calamares/modules/netinstall.yaml"
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
      description: "Hafif ve hızlı"
      packages:
        - xfce4
        - xfce4-goodies
        - lightdm
        - lightdm-gtk-greeter

    - name: "KDE Plasma (Önerilen)"
      description: "Modern ve şık varsayılan deneyim"
      selected: true
      packages:
        - plasma-desktop
        - sddm
        - dolphin
        - konsole

    - name: "GNOME"
      description: "Sade ve akıcı"
      packages:
        - gnome
        - gnome-extra
        - gdm

    - name: "Botan Essential Tools"
      description: "Temel araçlar (önerilir)"
      selected: true
      packages:
        - firefox
        - git
        - base-devel
        - fastfetch
EOF

# 6. İzinleri Ayarla
chmod 644 "$CONF_FILE" "$YAML_FILE"

# 7. Doğrulama
if [ -s "$YAML_FILE" ]; then
    echo "✅ Botan Netinstall başarıyla yapılandırıldı!"
    echo "📍 Konum: $CONF_DIR"
    echo "♻️ İşlem tamamlandı, script sistemde korunuyor (tekrar çalıştırılabilir)."
else
    echo "❌ Hata: Dosyalar oluşturulamadı! Script korunuyor."
    exit 1
fi
