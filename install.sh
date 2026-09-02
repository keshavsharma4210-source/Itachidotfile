#!/bin/bash

# ==========================================
# ITACHI HYPRLAND DOTFILES
# Arch Linux Installer
# ==========================================

set -e

echo "=========================================="
echo "       ITACHI HYPRLAND INSTALLER"
echo "=========================================="

# ------------------------------------------
# Check for Arch Linux
# ------------------------------------------

if [ ! -f /etc/arch-release ]; then
    echo "Error: This installer is intended for Arch Linux."
    exit 1
fi

echo "[1/5] Arch Linux detected."

# ------------------------------------------
# Required packages
# ------------------------------------------

echo "[2/5] Installing dependencies..."

sudo pacman -Syu --needed \
    hyprland \
    waybar \
    kitty \
    rofi \
    mako \
    swww \
    grim \
    slurp \
    wl-clipboard \
    brightnessctl \
    playerctl \
    pavucontrol \
    network-manager-applet \
    pipewire \
    pipewire-pulse \
    wireplumber \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    qt5-wayland \
    qt6-wayland \
    polkit-kde-agent \
    ttf-jetbrains-mono-nerd \
    git

# ------------------------------------------
# Create config directory
# ------------------------------------------

echo "[3/5] Creating configuration directories..."

mkdir -p ~/.config

# ------------------------------------------
# Backup existing configurations
# ------------------------------------------

echo "[4/5] Backing up existing configurations..."

BACKUP="$HOME/.config/itachi-backup-$(date +%Y%m%d-%H%M%S)"

mkdir -p "$BACKUP"

for dir in hypr waybar kitty rofi mako; do
    if [ -d "$HOME/.config/$dir" ]; then
        cp -r "$HOME/.config/$dir" "$BACKUP/"
    fi
done

echo "Backup created at:"
echo "$BACKUP"

# ------------------------------------------
# Install dotfiles
# ------------------------------------------

echo "[5/5] Installing Itachi configuration..."

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cp -r "$REPO_DIR/hypr" "$HOME/.config/"
cp -r "$REPO_DIR/waybar" "$HOME/.config/"
cp -r "$REPO_DIR/kitty" "$HOME/.config/"
cp -r "$REPO_DIR/rofi" "$HOME/.config/"
cp -r "$REPO_DIR/mako" "$HOME/.config/"

# ------------------------------------------
# Done
# ------------------------------------------

echo ""
echo "=========================================="
echo "       ITACHI INSTALLATION COMPLETE"
echo "=========================================="
echo ""
echo "Your previous configurations were backed up."
echo ""
echo "Installed:"
echo "  Hyprland"
echo "  Waybar"
echo "  Kitty"
echo "  Rofi"
echo "  Mako"
echo "  swww"
echo "  Screenshot tools"
echo "  Clipboard tools"
echo "  Audio support"
echo "  Network applet"
echo "  JetBrains Mono Nerd Font"
echo ""
echo "Restart Hyprland to apply the configuration."
echo ""