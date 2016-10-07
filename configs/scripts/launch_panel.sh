#!/bin/bash

FORMAT="FiraMono:size=9:antialias=true"
PANEL_HEIGHT=20
if [ `hostname` == "friday" ]
then
	PANEL_WIDTH=1580
elif [ `hostname` == "tuesday" ]
then
	PANEL_WIDTH=1900
fi
PANEL_GEO=$PANEL_WIDTHx$PANEL_HEIGHT+10+5

panel.sh | lemonbar -g $PANEL_GEO -f $FORMAT