#!/bin/bash

. bar_vars.sh

if [[ `cat /etc/hostname` == "friday" ]]; then

	echo " " | \
		lemonbar -p -d -B$MAIN_BG -g 1600x25+0+0 &
	bspc subscribe | python ~/.scripts/bar_dm.py | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -g 70x25+0+0 &
	bar_datetime.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 175x25+70+0 &
	bar_battery.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 50x25+245+0 &
	bar_disk.sh /dev/sda6 | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 50x25+295+0 &
	bar_volume.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 50x25+345+0 &
	bar_shortcuts.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "FiraMono:size=$TXT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 50x25+395+0 -a 3 | bash &

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
