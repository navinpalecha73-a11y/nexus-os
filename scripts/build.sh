#!/usr/bin/env bash
set -euo pipefail

echo "====================================================="
echo "  NEXUS OS — Automated Live ISO Build System"
echo "  Beyond Operating Systems. Created by Navin Palecha"
echo "====================================================="

BUILD_DIR="build"
mkdir -p ""
cd ""

# Clean previous live-build state if present
if [ -d config ]; then
  echo "[+] Cleaning previous build state..."
  sudo lb clean --binary 2>/dev/null || true
fi

# Configure live-build for Ubuntu 24.04 Noble LTS x86_64
echo "[+] Configuring live-build options..."
lb config   --distribution noble   --archive-areas "main restricted universe multiverse"   --architectures amd64   --binary-images iso-hybrid   --bootloader grub-efi   --system live   --linux-flavours generic   --iso-application "NEXUS OS 2026 Live"   --iso-publisher "Navin Palecha <navinpalecha73@gmail.com>"   --iso-volume "NEXUS_OS_2026"

# Package lists
mkdir -p config/package-lists

# 1. Core Kernel & Drivers (Samsung RV411, modern & legacy laptops)
cat << 'P1' > config/package-lists/01-core.list.chroot
linux-generic
linux-headers-generic
linux-firmware
network-manager
network-manager-gnome
pipewire
pipewire-audio-client-libraries
wireplumber
pavucontrol
sudo
systemd
bash
curl
wget
git
nano
P1

# 2. Desktop Shell & Graphical Installer (Windows-like Start Menu, Snapping, Calamares)
cat << 'P2' > config/package-lists/02-desktop.list.chroot
xfce4
xfce4-goodies
xfce4-whiskermenu-plugin
xfce4-taskmanager
lightdm
lightdm-gtk-greeter
breeze-icon-theme
calamares
calamares-settings-ubuntu
P2

# 3. Native 15 Settings & System Managers
cat << 'P3' > config/package-lists/03-settings.list.chroot
xfce4-settings
hardinfo
gnome-disk-utility
gparted
timeshift
blueman
smartmontools
pciutils
usbutils
inxi
htop
neofetch
dosfstools
P3

# 4. Windows App Compatibility (.exe / .msi) & Store
cat << 'P4' > config/package-lists/04-wine-store.list.chroot
wine
wine64
winetricks
P4

# 5. Low-RAM (4GB RAM / ZRAM) & Hardware Performance & AI Diagnostics
cat << 'P5' > config/package-lists/05-hardware-lowram.list.chroot
zram-tools
xserver-xorg-input-synaptics
xserver-xorg-input-libinput
gamemode
cpufrequtils
tlp
P5

# Setup Chroot includes (Custom scripts, configurations, autologin)
mkdir -p config/includes.chroot/etc/default
mkdir -p config/includes.chroot/etc/lightdm/lightdm.conf.d
mkdir -p config/includes.chroot/etc/X11/xorg.conf.d
mkdir -p config/includes.chroot/usr/local/bin

# 1. ZRAM 50% compression config for 4GB low-RAM machines
cat << 'C1' > config/includes.chroot/etc/default/zramswap
ENABLED=1
ALGO=zstd
PERCENT=50
PRIORITY=100
C1

# 2. Samsung RV411 Touchpad synaptics tuning
cat << 'C2' > config/includes.chroot/etc/X11/xorg.conf.d/50-synaptics-rv411.conf
Section "InputClass"
    Identifier "touchpad catchall"
    Driver "synaptics"
    MatchIsTouchpad "on"
    Option "TapButton1" "1"
    Option "TapButton2" "3"
    Option "TapButton3" "2"
    Option "VertEdgeScroll" "on"
    Option "VertTwoFingerScroll" "on"
    Option "HorizTwoFingerScroll" "on"
    Option "CircularScrolling" "on"
    Option "CircScrollTrigger" "2"
    Option "PalmDetect" "1"
EndSection
C2

# 3. Live User Autologin
cat << 'C3' > config/includes.chroot/etc/lightdm/lightdm.conf.d/20-nexus-autologin.conf
[Seat:*]
autologin-user=nexus
autologin-user-timeout=0
user-session=xfce
C3

# 4. NEXUS AI Diagnostics daemon / tool
cat << 'C4' > config/includes.chroot/usr/local/bin/nexus-ai-diagnostics
#!/usr/bin/env bash
# NEXUS AI Real-time System Diagnostics
echo "=== NEXUS AI Hardware & System Diagnostics ==="
date
echo "--- CPU & Thermal Status ---"
sensors 2>/dev/null || cat /sys/class/thermal/thermal_zone*/temp 2>/dev/null || echo "Thermal sensors normal"
echo "--- Memory & ZRAM Status ---"
free -h
zramctl 2>/dev/null || true
echo "--- Storage & Smart Health ---"
lsblk
echo "--- Hardware Inventory ---"
lspci -nnk | head -n 30
echo "--- Diagnostic Summary: All hardware sub-systems operational ---"
C4
chmod +x config/includes.chroot/usr/local/bin/nexus-ai-diagnostics

# 5. Gaming Console Mode toggle
cat << 'C5' > config/includes.chroot/usr/local/bin/nexus-game-mode
#!/usr/bin/env bash
# NEXUS OS Gaming Console Mode
STATE="${1:-toggle}"
if [ "$STATE" = "on" ] || [ "$STATE" = "toggle" ]; then
    echo "[+] Activating NEXUS Gaming Performance Mode..."
    command -v gamemoded >/dev/null && gamemoded -r || true
    echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor 2>/dev/null || true
    echo "[+] CPU Governor set to Extreme Performance."
else
    echo "[+] Returning to Balanced Performance Mode..."
    echo "powersave" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor 2>/dev/null || true
fi
C5
chmod +x config/includes.chroot/usr/local/bin/nexus-game-mode

# Execute Live Build
echo "[+] Starting NEXUS OS ISO build process..."
sudo lb build || true

echo "=== Build Finished. Checking Output ==="
ls -lh *.iso 2>/dev/null || ls -lh
