xsetroot -cursor_name left_ptr
xrandr --output DP-4 --auto --primary
xrandr --output DP-2 --auto --right-of DP-4
xrandr --output LVDS1 --auto --primary
xrandr --output HDMI1 --auto --right-of LVDS1
eval $(cat ~/.config/.fehbg)
# for fixing touchpad scroll direction
synclient VertScrollDelta=-101
synclient HorizScrollDelta=-101
dropbox start
exec bspwm
