#!/bin/bash

while true; do
	if [[ `volume | cut -d" " -f1` == "off"  ]]
	then
		echo -e "%{c}%{F#ff7200}\uea2a $(volume | cut -d' ' -f2)%"
	else
		echo -e "%{c}%{F-}\uea27 $(volume | cut -d' ' -f2)%"
	fi
	sleep .5;
done
