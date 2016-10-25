#!/bin/bash

. bar_vars.sh

if [[ `hostname` == "friday" ]]; then
bspc subscribe	| python ~/.scripts/bar_dm.py | lemonbar -p -d -B#00000000 -F$PANEL_TEXT_COLOR -a 1 -g 75x20+0+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" &
bar_datetime.sh	| lemonbar -p -d -B$PANEL_BKGND_COLOR -F$PANEL_TEXT_COLOR -a 1 -g 175x20+75+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" &
bar_battery.sh	| lemonbar -p -d -B$PANEL_BKGND_COLOR -F$PANEL_TEXT_COLOR -a 1 -g 50x20+250+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" &
bar_disk.sh		| lemonbar -p -d -B$PANEL_BKGND_COLOR -F$PANEL_TEXT_COLOR -a 1 -g 50x20+300+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" &
fi