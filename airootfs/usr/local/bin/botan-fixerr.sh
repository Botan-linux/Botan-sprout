#!/bin/bash

# Eğer hedef klasör yoksa oluştur
mkdir -p /etc/calamares/modules/

# Ana dizine (root) koyduğun yedeği gerçek yerine kopyala
if [ -f /root/netinstall.conf.yedek ]; then
    cp /root/netinstall.conf.yedek /etc/calamares/modules/netinstall.conf
    chmod 644 /etc/calamares/modules/netinstall.conf
fi
