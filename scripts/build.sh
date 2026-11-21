#!/usr/bin/env bash
set -euo pipefail

echo "=== NEXUS OS Build System ==="
echo "Target: Linux x86_64 Live ISO"
echo "Kernel: Linux 6.8+ LTS / Zen optimized"
echo "Author: Navin Palecha"

mkdir -p build
cd build

lb config   --distribution noble   --archive-areas "main restricted universe multiverse"   --architectures amd64   --binary-images iso-hybrid   --bootloader grub-efi   --image-name "nexus-os-2026-x86_64"   --system live   --linux-flavours generic

sudo lb build
echo "Build complete. Checking output ISO:"
ls -lh *.iso || true
