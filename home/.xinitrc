xsetroot -cursor_name left_ptr

# Monitor setup on fancy new laptop
if [ $(hostname) = miranda ]; then
	xrandr --output eDP1 --auto --primary
fi

# Monitor setup for desktop
if [ $(hostname) = ophelia ]; then
	xrandr --output HDMI-0 --off
	xrandr --output DP-4 --auto --primary
	xrandr --output DP-0 --auto --left-of DP-4
fi

# Set the wallpaper
eval $(cat ~/.config/.fehbg)

# For fixing touchpad scroll direction
if [ $(hostname) = miranda ]; then
	synclient VertScrollDelta=-250
	synclient HorizScrollDelta=-250
	synclient TapButton1=1
	synclient TapButton2=3
	synclient TapButton3=2
	synclient PalmDetect=1
fi

# Start programs that need it
exec bspwm
