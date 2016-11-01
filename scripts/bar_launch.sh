#!/bin/bash

. bar_vars.sh

if [[ `cat /etc/hostname` == "friday" ]]; then

	echo " " | \
		lemonbar -p -d -B$MAIN_BG -g 1600x25+0+0 &
	bspc subscribe | python ~/.scripts/bar_dm.py | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -g 75x25+0+0 &
	bar_datetime.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 125x25+1475+0 &
	bar_battery.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 50x25+1425+0 &
	bar_disk.sh /dev/sda6 | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 50x25+1375+0 &
	bar_volume.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 50x25+1325+0 &
	bar_shortcuts.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 75x25+75+0 -a 3 | bash &

elif [[ `cat /etc/hostname` == "tuesday" ]]; then

	echo " " | \
		lemonbar -p -d -B$MAIN_BG -g 1920x25+0+0 &
	bspc subscribe | python ~/.scripts/bar_dm.py | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -g 145x20+5+5 &
	bar_datetime.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 200x25+150+5 &
	bar_disk.sh /dev/sdb1 | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 50x25+350+5 &
	bar_volume.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 50x25+400+5 &
	bar_shortcuts.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 50x25+395+0 -a 3 | bash &

fi
