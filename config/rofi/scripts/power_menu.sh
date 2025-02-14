#!/bin/bash

display_entries() {
    echo -e "󰍁 Lock\n󰤄 Suspend\n󰍃 Logout\n󰜉 Reboot\n󰐥 Shutdown"
}

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
