#!/bin/bash

# CPU model
model=$(lscpu | awk -v ORS=" " '/Model name/ {for (i=3; i<=NF; i++) print $i}')

# CPU utilization
utilization=$(top -bn1 | awk '/^%Cpu/ {print 100 - $8}')

# CPU temp
temp=$(sensors | awk '/Tctl/ {print $2}' | tr -d '+')
if [ -z "$temp" ]; then
    temp="N/A"
fi

# Print cpu info (json)
echo "{\"text\":\"${temp}\", \"tooltip\":\"${model}\n  Temperature: ${temp}\n  Utilization: ${utilization}%\"}"
