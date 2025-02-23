#!/bin/bash

#swww img $(cat ~/.cache/wal/wal)
WALLPAPER_DIR="$HOME/.dotfiles/assets"

all_walls=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | awk '{print "Entry\0icon\x1fthumbnail://"$0}')
chosen_wall=$( echo -e "${all_walls}" | rofi -dmenu -show-icons -theme "fullscreen-preview")

echo $chosen_wall
