#!/bin/bash

while true; do
	if [[ `volume | cut -d" " -f1` == "off"  ]]
	then
		echo -e "%{c}%{F#ff7200}\ue910 $(volume | cut -d' ' -f2)%"
	else
		echo -e "%{c}%{F-}\ue910 $(volume | cut -d' ' -f2)%"
	fi
	sleep .5;
done
