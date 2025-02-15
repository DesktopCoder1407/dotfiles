#!/bin/bash

get_device_name() {
    local device_info=$(bluetoothctl info "$1")

    device_name=$(echo "$device_info" | grep "Name:" | awk '{for (i=2; i<=NF; i++) printf $i " "}')
    device_icon=$(echo "$device_info" | grep "Icon:" | awk '{print $2}')

    case "$device_icon" in
        "input-gaming") echo -n "󰖺 " ;;
        "input-keyboard") echo -n "󰌌 " ;;
        *) echo -n "󰂱 " ;;
    esac

    echo "$device_name"
}

show_display() {
    bluetooth_status=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')
    scan_status=$(bluetoothctl show | grep "Discovering:" | awk '{print $2}')

    if [[ $bluetooth_status == "yes" ]]; then
        [[ $scan_status == "yes" ]] && echo -e "Refresh  " || echo -e "Scan for Devices 󰂰 "
        echo -e "Disable Bluetooth"
        bluetoothctl devices | while read -r line; do
            device_mac=$(echo "$line" | awk '{print $2}')
            echo -e "$(get_device_name "$device_mac")"
        done
    else
        echo -e "Enable Bluetooth"
    fi
}

case "$@" in
    "Enable Bluetooth"*) 
        notify-send "Bluetooth Enabled"
        bluetoothctl power on > /dev/null
        sleep 1
        ;;
    "Disable Bluetooth")
        notify-send "Bluetooth Disabled"
        bluetoothctl power off > /dev/null
        exit 0
        ;;
    "Scan for Devices"*)
        notify-send "Bluetooth Scanning..."
        bluetoothctl scan on
        sleep 1
        ;;
    "Refresh"*)
        ;;
    "")
        ;;
    *)
        device_name="${@#* }"
        device_name="${device_name%" "}"
        notify-send "Connecting to $device_name..."

        device_mac=$(bluetoothctl devices | grep "$device_name" | awk '{print $2}')
        bluetoothctl connect "$device_mac" &
        sleep 3
        connected=$(bluetoothctl info "$device_mac" | grep "Connected:" | awk '{print $2}')

        if [[ $connected == "yes" ]]; then
            notify-send "Connected to $device_name."
        else
            notify-send "Failed to connect to $device_name."
        fi
        exit 0
        ;;
esac

show_display
