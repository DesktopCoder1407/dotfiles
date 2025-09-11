#!/bin/bash

# GPU name
name=$(lspci | grep -i "vga" | grep -o "\[.*\]")

# GPU temp
temp=$(sensors | awk '/junction/ {print $2}' | tr -d '+')
if [ -z "$temp" ]; then
    temp="N/A"
fi

# Print gpu info (json)
echo "{\"text\":\"${temp}\", \"tooltip\":\"${name}\n  Temperature: ${temp}\"}"
