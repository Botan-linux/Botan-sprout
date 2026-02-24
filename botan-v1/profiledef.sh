#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="botan-sprout"
iso_label="BOTAN_SPROUT_1_0"
iso_publisher="Botan linux <https://botan-linux.github.io/Botan-sprout/>"
iso_application="Botan Linux Sprout Live/Installation Media"
iso_version="1.0"
install_dir="botan"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-ia32.grub.esp' 'uefi-x64.grub.esp')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-b' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/skel/Desktop/install-botan.desktop"]="0:0:755"
  ["/usr/local/bin/botan-first-boot.sh"]="0:0:755"
  ["/etc/systemd/system/botan-init.service"]="0:0:644"
  ["/etc/calamares/"]="0:0:755"
  ["/usr/share/calamares/branding/botan/"]="0:0:755"
  ["/usr/local/bin/botan-user.sh"]="0:0:755"
  ["/etc/sudoers.d/10-liveuser"]="0:0:440"
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
)
