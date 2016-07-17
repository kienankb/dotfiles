xrdb /home/kienan/.Xresources
xsetroot -cursor_name left_ptr
feh --bg-scale /home/kienan/.wall.jpg
feh --bg-scale /home/kienan/.wall.png
# for fixing touchpad scroll direction
synclient VertScrollDelta=-101
synclient HorizScrollDelta=-101
exec bspwm
