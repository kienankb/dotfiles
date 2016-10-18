#!/bin/bash

scrot ~/.lkscrn.png								# Take a temporary screenshot
convert -blur 10x10 ~/.lkscrn.png ~/.lkscrn.png	# -blur is fastest, -gaussian-blur looks nicer but is slower
i3lock -u -i ~/.lkscrn.png						# Remove the `-u` to display an indicator when entering a password
rm ~/.lkscrn.png								# NUKE DAT TEMP FILE
