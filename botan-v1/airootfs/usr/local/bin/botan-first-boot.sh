#!/bin/bash
# Kernel imajlarını kullanıcı yerine otomatik oluşturur
sudo mkinitcpio -P
# Bu scriptin sadece bir kez çalışmasını istiyorsan kendini sildirebilirsin:
# rm -- "$0"
