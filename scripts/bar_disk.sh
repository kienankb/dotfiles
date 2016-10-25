#!/bin/bash

while true; do
	echo -e "%{c}\ue964 $(df -h --output="pcent" $1 | cut -d$'\n' -f2 | column -t)"
	sleep 60;
done
