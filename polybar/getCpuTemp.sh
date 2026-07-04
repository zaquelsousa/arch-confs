#!/bin/sh

for h in /sys/class/hwmon/hwmon*; do
  name=$(cat "$h/name" 2>/dev/null)

  if [ "$name" = "k10temp" ]; then
    temp=$(cat "$h/temp1_input" 2>/dev/null)
    [ -n "$temp" ] && printf " CPU %.1f°C\n" "$(echo "$temp / 1000" | bc -l)"
    exit 0
  fi
done

echo " CPU N/A"
