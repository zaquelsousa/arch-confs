#!/usr/bin/env bash
# ~/.config/polybar/onsink.sh

PLAYERCTL=$(which playerctl 2>/dev/null)
if [[ -z "$PLAYERCTL" ]]; then
    echo "playerctl nao encontrado"
    exit 0
fi

if ! playerctl -l &>/dev/null; then
    echo "Nada tocando"
    exit 0
fi

status=$(playerctl status 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)

if [[ -z "$title" ]]; then
    echo "Tocando..."
    exit 0
fi

text="${artist:0:22} - ${title:0:30}"
[[ ${#text} -gt 50 ]] && text="${text:0:47}..."

if [[ "$status" == "Playing" ]]; then
    icon=""
else
    icon=""
fi

echo "%{A1:playerctl play-pause:}$icon $text%{A}"
