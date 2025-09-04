# Steam Setup Script for Arch Linux

This repository contains a Bash script that automates the installation and setup of Steam on Arch Linux. The script follows the official Arch Wiki guide: [Steam - ArchWiki](https://wiki.archlinux.org/title/Steam).

The goal is to simplify the installation process for users who want to use Steam without manually configuring dependencies and settings.

## Features

- Enables the multilib repository if not already enabled.
- Installs the Steam package.
- Installs common dependencies required by Steam (fonts, 32-bit libraries, PipeWire, XDG Desktop Portal, Vulkan drivers).

### **upcoming** features:

- Guides the user on setting up locale and kernel parameters.
- Optionally creates a desktop icon for Steam that works across most desktop environments.

## Prerequisites

- Arch Linux or an Arch-based distribution.
- `sudo` privileges.
- Internet connection.