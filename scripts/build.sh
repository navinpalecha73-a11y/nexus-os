#!/usr/bin/env bash
set -euo pipefail

echo "=== NEXUS OS Build System ==="
echo "Target: Linux x86_64 Live ISO"
echo "Kernel: Linux 6.8+ LTS / Zen optimized"
echo "Author: Navin Palecha"

mkdir -p build
cd build

lb config   --distribution noble   --archive-areas "main restricted universe multiverse"   --architectures amd64   --binary-images iso-hybrid   --bootloader grub-efi   --system live   --linux-flavours generic

mkdir -p config/package-lists
cat << 'EOF' > config/package-lists/nexus-core.list.chroot
linux-generic
linux-headers-generic
linux-firmware
network-manager
pipewire
pipewire-audio-client-libraries
wireplumber
sudo
systemd
bash
curl
wget
git
nano
htop
neofetch
pciutils
usbutils
smartmontools
EOF

sudo lb build || true

echo "Build step finished. Files:"
ls -lh || true
