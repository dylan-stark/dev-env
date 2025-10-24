#!/bin/bash
MONITOR="HDMI-A-1"

CURRENT=$(hyprctl monitors | awk -v mon="$MONITOR" '
    $2 == mon {getline; print $1}' )

if [[ "$CURRENT" == 3840x2160* ]]; then
    echo "Switching resolution for M1 Air (1280x800@60)..."
    hyprctl keyword monitor "$MONITOR,1280x800@60,0x0,1"
elif [[ "$CURRENT" == 1280x800* ]]; then
    echo "Switching resolution for Samsung monitor on Mira (3840x2160@60)..."
    hyprctl keyword monitor "$MONITOR,3840x2160@60,0x0,1"
else
    echo "Current mode is $CURRENT — defaulting to Odyssey G9 native."
    hyprctl keyword monitor "$MONITOR,3840x2160@60,0x0,1"
fi

