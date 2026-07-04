#!/bin/bash

killall -q polybar

MONITOR=DP-0 polybar --reload main &
MONITOR=HDMI-0 polybar -c ~/.config/polybar/secondMonitor.ini main-secondary &

MONITOR=DP-0 polybar -c ~/.config/polybar/bottom.ini bottom &
MONITOR=HDMI-0 polybar -c ~/.config/polybar/bottom.ini bottom &
