#!/bin/bash

while true; do
	if [[ $(battery | cut -d' ' -f1) == "Discharging" ]]; then
		echo -e "%{c}\ue9b5 $(battery | cut -d' ' -f2)%"
	else
		echo -e "%{c}\ue9b7 $(battery | cut -d' ' -f2)%"
	fi
	sleep 5;
done