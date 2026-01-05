#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' 

echo "Checking dependencies for PS3Format.sh..."

if [ "$EUID" -ne 0 ]; then 
  echo -e "${RED}Please run this script as root (sudo).${NC}"
  exit 1
fi

install_deps() {
    MANAGER=$1
    shift
    COMMAND=$@
    
    echo -e "Package manager detected: ${GREEN}$MANAGER${NC}"
    echo "Installing: dosfstools util-linux..."
    $COMMAND
}

if command -v apt-get &> /dev/null; then
    install_deps "AWS/Debian/Ubuntu" "apt-get update && apt-get install -y dosfstools util-linux"
elif command -v dnf &> /dev/null; then
    install_deps "Fedora/RHEL" "dnf install -y dosfstools util-linux"
elif command -v pacman &> /dev/null; then
    install_deps "Arch Linux" "pacman -Sy --noconfirm dosfstools util-linux"
elif command -v zypper &> /dev/null; then
    install_deps "OpenSUSE" "zypper install -y dosfstools util-linux"
else
    echo -e "${RED}Error: No supported package manager found (apt, dnf, pacman, zypper).${NC}"
    echo "Please manually install packages: dosfstools, util-linux"
    exit 1
fi

echo
echo -e "${GREEN}Dependency installation completed!${NC}"
echo "You can now run PS3Format.sh."
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