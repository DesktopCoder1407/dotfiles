#!/bin/bash

# VPN Name
name=$(ip link | grep "POINT" | grep -o ": .*:")
name=${name:2:-1}

# Power on/off VPN
if [[ $1 == "--toggle" ]]; then
	pswd=$(echo -e "SETDESC Toggle VPN\nSETPROMPT [sudo] password for $USER:\nGETPIN\n" | pinentry | grep D)
	pswd=${pswd#D }
	if [[ $name ]]; then
		$(echo $pswd | sudo -S wg-quick down $name)
	else
		chosen_vpn=$(echo $pswd | sudo -S ls /etc/wireguard/ | rofi -dmenu)
		wg-quick up /etc/wireguard/$chosen_vpn
	fi
	exit
fi

# Print vpn info (json)
if [[ $name ]]; then
	echo "{\"text\":\" ${name}\", \"tooltip\":\"VPN Active:\n${name}\"}"
else
	echo "{\"text\":\"\", \"tooltip\":\"No Active VPN\"}"
fi
