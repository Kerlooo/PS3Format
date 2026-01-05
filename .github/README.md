# PS3Format

A simple and user-friendly bash script designed to format USB drives to FAT32 format from the terminal. This tool enables anyone to easily prepare USB devices for compatibility with PlayStation 3 consoles.

## Overview

PS3Format provides a straightforward command-line interface for formatting USB drives. The tool handles all the technical aspects of partitioning and formatting, making it accessible to users of all skill levels.

## Purpose

This tool was created to simplify the process of preparing USB drives for PlayStation 3 use. By formatting a USB drive to FAT32 (MBR partition table), your device will be recognized and compatible with PS3 systems.

## Features

- Simple and interactive terminal interface
- Automatic device detection with lsblk
- Safety confirmations to prevent accidental data loss
- Proper partition table setup (MBR)
- FAT32 filesystem formatting
- Automatic volume labeling

## Installation & Dependencies

This tool requires `dosfstools` and `util-linux`. We have included a helper script to automatically install them for you.

### Automatic Installation

1. Make the script executable:
   ```bash
   chmod +x install_dependencies.sh
   ```
2. Run the installer:
   ```bash
   sudo ./install_dependencies.sh
   ```

### Manual Installation

If the automatic installer does not work for your distribution, you can install the necessary packages manually.

**Debian/Ubuntu:**
```bash
sudo apt-get update
sudo apt-get install dosfstools util-linux
```

**Fedora:**
```bash
sudo dnf install dosfstools util-linux
```

**Arch Linux:**
```bash
sudo pacman -S dosfstools util-linux
```

**OpenSUSE:**
```bash
sudo zypper install dosfstools util-linux
```

## Usage

1. Clone the repository:
   ```bash
   git clone https://www.github.com/Kerlooo/PS3Format.git
   ```

2. Enter the repository folder:
   ```bash
   cd PS3Format/scripts
   ```

3. Enable execute privileges:
   ```bash
   chmod +x PS3Format.sh
   ```

4. Run the script:
   ```bash
   ./PS3Format.sh
   ```

5. Review the available block devices displayed on your screen.

6. Enter the target USB device name (e.g., sdb).

7. Confirm the selection - the device will be completely erased.

8. Type 'YES' to proceed with formatting.

9. Wait for the process to complete.

## Warning

This tool will completely erase all data on the selected USB device. Ensure you have selected the correct device before confirming the operation. Data loss is permanent and cannot be recovered.

## License

This guide is distributed under the **Creative Commons Attribution 4.0 International (CC BY 4.0)** license.

You are free to:
- **Share** — copy and redistribute the material in any medium or format.
- **Adapt** — remix, transform, and build upon the material for any purpose, even commercially.

Under the following terms:
- **Attribution** — You must give appropriate credit, provide a link to the license, and indicate if changes were made.

For more details, see the [LICENSE](LICENSE) file or visit [creativecommons.org](https://creativecommons.org/licenses/by/4.0/).


