#!/bin/bash

. bar_vars.sh

if [[ `hostname` == "friday" ]]; then
	bspc subscribe			| python ~/.scripts/bar_dm.py | lemonbar -p -d -B#00000000 -F$PANEL_TEXT_COLOR -a 1 -g 75x20+0+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" &
	bar_datetime.sh			| lemonbar -p -d -B$PANEL_BKGND_COLOR -F$PANEL_TEXT_COLOR -a 1 -g 175x20+75+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" &
	bar_battery.sh			| lemonbar -p -d -B$PANEL_BKGND_COLOR -F$PANEL_TEXT_COLOR -a 1 -g 50x20+250+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" &
	bar_disk.sh /dev/sda6	| lemonbar -p -d -B$PANEL_BKGND_COLOR -F$PANEL_TEXT_COLOR -a 1 -g 50x20+300+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" &
	bar_volume.sh			| lemonbar -p -d -B$PANEL_BKGND_COLOR -F$PANEL_TEXT_COLOR -a 1 -g 50x20+350+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" &
	bar_shortcuts.sh		| lemonbar -p -d -B$PANEL_BKGND_COLOR -F$PANEL_TEXT_COLOR -a 3 -g 50x20+400+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" | bash &
	bar_power.sh			| lemonbar -p -d -B$PANEL_BKGND_COLOR -F$PANEL_TEXT_COLOR -a 2 -g 50x20+450+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" | sudo bash &
elif [[ `hostname` == "tuesday" ]]; then
	bspc subscribe			| python ~/.scripts/bar_dm.py | lemonbar -p -d -B#00000000 -F$PANEL_TEXT_COLOR -a 1 -g 150x20+0+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" &
	bar_datetime.sh			| lemonbar -p -d -B$PANEL_BKGND_COLOR -F$PANEL_TEXT_COLOR -a 1 -g 200x20+150+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" &
	bar_disk.sh /dev/sdb1	| lemonbar -p -d -B$PANEL_BKGND_COLOR -F$PANEL_TEXT_COLOR -a 1 -g 50x20+350+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" &
	bar_volume.sh			| lemonbar -p -d -B$PANEL_BKGND_COLOR -F$PANEL_TEXT_COLOR -a 1 -g 50x20+400+5 -f "FiraMono:size=9:antialias=true" -f "icomoon:size=10" &
fi
