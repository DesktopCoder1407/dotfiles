#!/bin/bash

WALLPAPER_DIR="${HOME}/.dotfiles/wallpapers"
rofi_command="rofi -dmenu -theme ${HOME}/.config/rofi/wallpaper_menu.rasi"

chosen_wall=$( find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.png" \) -exec basename {} \; | sort | while read -r i ; do echo -en "$i\x00icon\x1f""${WALLPAPER_DIR}"/"$i\n" ; done | $rofi_command)

# Exit if no wallpaper is chosen. Otherwise, get the full path.
[[ ${chosen_wall} == "" ]] && exit 
wall_path=${WALLPAPER_DIR}/${chosen_wall}

# Wallpaper & Color
swww img "${wall_path}" --transition-type any --transition-fps 60 --transition-duration .5
wal -i "${wall_path}" -qne -st

# Application Resetting
killall -SIGUSR2 waybar
