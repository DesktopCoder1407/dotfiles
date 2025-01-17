# Installation
 - `git clone --recursive https://github.com/DesktopCoder1407/dotfiles.git ~/.dotfiles`
 - `cd ~/.dotfiles`
 - `./setup`

# Update
 - To update, simply run `./setup` again.

# Uninstall
 - To uninstall, run `./setup --uninstall`.

# Configuration
 - Modification of files within this repository will modify the configuration files linked. To change what is installed, modify the setup script to not link specific directories.

# Fonts
Main Font : [Fira Code](https://github.com/ryanoasis/nerd-fonts/releases) `ttf-firacode-nerd`

# Apps
| App Type | Chosen App |
| --- | --- |
| Bootloader | `systemd-boot` |
| Display Manager | `greetd-tuigreet` |
| Window Manager | `hyprland` |
| Shell | `bash` |
| Audio | `pipewire` and `wireplumber` |
| Notification Daemon | `dunst` |
| Idle Daemon | `hypridle` |
| XDG Protocols | `xdg-desktop-portal-hyprland` |
| --- | --- |
| AUR Utility | [yay](https://github.com/Jguer/yay) |
| App Launcher | `rofi-wayland` |
| Lock Screen | `hyprlock` |
| Screenshot Utility | `grim` and `slurp` |
| Terminal | `kitty` |
| Text Editor | `vim` or `nvim` |
| Clipboard Utility | `cliphist` |
| Web Browser | `chromium` (blink, gtk) or `firefox` (gecko, gtk) |

# Recomended Apps
`acpi`, `brightnessctl`, `iwd`, `openssh`, `udiskie`

# Installer
`pacman -Syu base linux linux-firmware sudo git vim ttf-firacode-nerd`
