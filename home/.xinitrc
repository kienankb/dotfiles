xsetroot -cursor_name left_ptr

# Monitor setup on laptop
if [ $(hostname) = friday ]; then
	xrandr --output LVDS1 --auto --primary
	xrandr --output HDMI1 --auto --right-of LVDS1
fi

# Monitor setup on desktop
if [ $(hostname) = tuesday ]; then
	xrandr --output DP-4 --auto --primary
fi

# Set the wallpaper
eval $(cat ~/.config/.fehbg)

# For fixing touchpad scroll direction
synclient VertScrollDelta=-101
synclient HorizScrollDelta=-101

# Start programs that nee dit
exec bspwm
