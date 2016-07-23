xrdb /home/kienan/.Xresources
xsetroot -cursor_name left_ptr
xrandr --output LVDS1 --auto --primary
xrandr --output HDMI1 --auto --right-of LVDS1
feh --bg-fill ~/.config/wallpapers/$BG
# for fixing touchpad scroll direction
synclient VertScrollDelta=-101
synclient HorizScrollDelta=-101
exec bspwm