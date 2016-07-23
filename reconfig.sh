#!/bin/bash

echo "Placing config files and scripts..."
# bspwm, sxhkd configs
mkdir -p ~/.config/bspwm ~/.config/sxhkd ~/.config/asciinema
cp configs/bspwmrc ~/.config/bspwm/
chmod +x ~/.config/bspwm/bspwmrc
cp configs/sxhkdrc ~/.config/sxhkd/
chmod +x ~/.config/sxhkd/sxhkdrc
# xinitrc
cp configs/.xinitrc ~/
chmod +x ~/.xinitrc
# panel fifo; if statement is mostly for testing
if ! grep -q "PANEL_FIFO" /etc/profile ; then
	echo "export PANEL_FIFO='/tmp/panel-fifo'" | sudo tee -a /etc/profile
fi
cp configs/.bashrc ~/
chmod +x ~/.bashrc
cp configs/.Xresources ~/
cp configs/.tmux.conf ~/
cp configs/.bash_aliases ~/
chmod +x ~/.bash_aliases
cp configs/.ssh.config ~/.ssh/config
cp configs/.asciinema.config ~/.config/asciinema/config
cp configs/compton.conf ~/.config/

# all the scripts you could ever want
mkdir -p ~/.scripts
cp configs/scripts/* ~/.scripts
chmod +x ~/.scripts/panel ~/.scripts/panel_bar ~/.scripts/addkeys.sh
