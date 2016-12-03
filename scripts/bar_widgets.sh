#!/bin/bash
while true; do
	# volume
	if [[ `volume | cut -d" " -f1` == "off"  ]]
	then
		VOL="%{F$BAR_FG_ALT}vol $(volume | cut -d' ' -f2)%%{F-}"
	else
		VOL="%{F-}vol $(volume | cut -d' ' -f2)%"
	fi

	# disk space
	DISK="dsk $(df -h --output="pcent" $1 | cut -d$'\n' -f2 | column -t)"

	# power
	if [[ $(battery | cut -d' ' -f1) == "Discharging" ]]; then
		PWR="pwr $(battery | cut -d' ' -f2)%"
	else
		PWR="%{F$BAR_FG_ALT}pwr $(battery | cut -d' ' -f2)%%{F-}"
	fi

	# date/time
	DT="$(date +'%m.%d')  $(date +'%H:%M')"

	echo "%{c}$DT%{r}$VOL | $DISK | $PWR"

	# delay
	sleep .5;
done
