#!/bin/bash

. bar_vars.sh

if [[ `cat /etc/hostname` == "friday" ]]; then

	#echo " " | \
	#	lemonbar -p -d -B$MAIN_BG -g 1600x25+0+0 &
	bar_widgets.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "$FONT_FACE:size=$FONT_SIZE:antialias=true" -g 1525x25+75+0 &
	bspc subscribe | python ~/.scripts/bar_dm.py $BAR_FG_ALT | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "$FONT_FACE:size=$FONT_SIZE:antialias=true" -g 75x25+0+0 &

elif [[ `cat /etc/hostname` == "tuesday" ]]; then

	echo " " | \
		lemonbar -p -d -B$MAIN_BG -g 1920x25+0+0 &
	bspc subscribe | python ~/.scripts/bar_dm.py | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "$FONT_FACE:size=$FONT_SIZE:antialias=true" -g 150x20+0+0 &
	bar_datetime.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "$FONT_FACE:size=$FONT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 150x25+1770+0 &
	bar_disk.sh /dev/sdb1 | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "$FONT_FACE:size=$FONT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 50x25+1720+0 &
	bar_volume.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "$FONT_FACE:size=$FONT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 50x25+1670+0 &
	bar_shortcuts.sh | \
		lemonbar -p -d -B$BAR_BG -F$BAR_FG -f "$FONT_FACE:size=$FONT_SIZE:antialias=true" -f "icomoon:size=$ICO_SIZE" -g 100x25+150+0 -a 4 | bash &

fi
