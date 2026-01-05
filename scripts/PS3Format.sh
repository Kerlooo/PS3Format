#!/bin/bash

clear
set -euo pipefail

RED="\e[31m"
RESET="\e[0m"
BOLD="\e[1m"

echo
echo "===================================================="
echo "        USB FAT32 FORMATTER (DESTRUCTIVE TOOL)"
echo "===================================================="
echo

echo -e "${RED}${BOLD}WARNING:${RESET}"
echo -e "${RED}THE SELECTED DEVICE WILL BE COMPLETELY ERASED.${RESET}"
echo -e "${RED}ALL DATA ON THE DEVICE WILL BE PERMANENTLY LOST.${RESET}"
echo
echo -e "${RED}MAKE SURE YOU SELECT THE CORRECT USB DEVICE.${RESET}"
echo

echo "Available block devices:"
echo
lsblk -o NAME,SIZE,TYPE,MODEL
echo

read -rp "Enter the target device (example: sdb): " DEV_NAME
DEV="/dev/${DEV_NAME}"

if [[ ! -b "$DEV" ]]; then
    echo -e "${RED}ERROR: The specified device does not exist.${RESET}"
    exit 1
fi

echo
echo -e "${RED}Selected device: $DEV${RESET}"
echo
read -rp "Type 'YES' to confirm and continue: " CONFIRM

if [[ "$CONFIRM" != "YES" ]]; then
    echo -e "${RED}Operation aborted by user.${RESET}"
    exit 1
fi

echo
echo "Unmounting any mounted partitions..."
sudo umount "${DEV}"* 2>/dev/null || true

echo "Wiping existing filesystem signatures..."
sudo wipefs -a "$DEV"

echo "Creating MBR partition table and FAT32 partition..."
sudo fdisk "$DEV" <<EOF
o
n
p
1


t
c
w
EOF

PARTITION="${DEV}1"

echo "Waiting for kernel to re-read partition table..."
sleep 2

echo "Formatting partition as FAT32..."
sudo mkfs.fat -F32 "$PARTITION"

echo "Setting volume label to 'USB'..."
sudo fatlabel "$PARTITION" USB

echo
echo "===================================================="
echo "Operation completed successfully."
echo "The USB device is now formatted as FAT32 (MBR)."
echo "Volume label: USB"
echo "===================================================="
echo
echo "===================================================="
echo "                      CREDITS"
echo "===================================================="
echo "USB FAT32 Formatter Script"
echo "A simple and safe USB formatting tool"
echo ""
echo "Created by Kerlo (https://github.com/Kerlooo)"
echo "===================================================="
echo
