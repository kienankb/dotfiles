xsetroot -cursor_name left_ptr
xrandr --output LVDS1 --auto --primary
xrandr --output HDMI1 --auto --right-of LVDS1
eval $(cat ~/.config/.fehbg)
# for fixing touchpad scroll direction
synclient VertScrollDelta=-101
synclient HorizScrollDelta=-101
dropbox start
exec bspwm
