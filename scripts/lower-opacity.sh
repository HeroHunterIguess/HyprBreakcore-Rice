#!/bin/bash

CONFIG="/home/herohunter/.config/hypr/hyprland.conf"

sed -i 's/^\$Opacity[[:space:]]*=[[:space:]]*.*/\$Opacity = 0.9/' "$CONFIG"
sed -i 's/^\$Opacity2[[:space:]]*=[[:space:]]*.*/\$Opacity2 = 0.8/' "$CONFIG"

hyprctl reload
