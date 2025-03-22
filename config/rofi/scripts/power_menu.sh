#!/bin/bash

ENTRIES="󰍁 Lock\n󰤄 Suspend\n󰍃 Logout\n󰜉 Reboot\n󰐥 Shutdown"
rofi_command="rofi -dmenu"

chosen_item=$(echo -e "$ENTRIES" | rofi_command)
notify-send ${chosen_item}

exit

case $1 in
    *Lock)
        loginctl lock-session
        exit 0
        ;;
    *Logout)
        hyprctl dispatch exit
        exit 0
        ;;
    *Suspend)
        notify-send -a "Power Menu" "Suspend not set up."
        exit 0
        ;;
    *Reboot)
        shutdown -r now
        exit 0
        ;;
    *Shutdown)
        shutdown now
        exit 0
        ;;
esac

display_entries
