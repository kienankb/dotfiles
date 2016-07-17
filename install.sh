#!/bin/bash

LIBS="xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxft-dev libX11-xcb-dev libxcb-xtest0-dev libxinerama-dev"
BASICS="gcc apt-file xorg fonts-inconsolata htop colortest screenfetch screen tmux asciinema lolcat cowsay fortune feh"

rm install.log

echo ""
echo "==========================================="
echo "YO, Y'ALL BETTER BE RUNNING THIS FROM A TTY"
echo "==========================================="
echo ""

git config --global user.name "Kienan Knight-Boehm"
git config --global user.email "kienan@kienankb.com"
git config --global push.default simple
git config --global core.editor nano

echo "Updating sources..."
sudo apt-get update >> install.log
echo "Installing needed libraries..."
sudo apt-get install -y $LIBS >> install.log
echo "Installing needed packages..."
sudo apt-get install -y $BASICS >> install.log

echo "Cloning everything we need:"
echo "bspwm..."
git clone https://github.com/baskerville/bspwm.git >> install.log
echo "sxhkd..."
git clone https://github.com/baskerville/sxhkd.git >> install.log
echo "xdo..."
git clone https://github.com/baskerville/xdo.git >> install.log
echo "sutils..."
git clone https://github.com/baskerville/sutils.git >> install.log
echo "xtitle..."
git clone https://github.com/baskerville/xtitle.git >> install.log
echo "lemonbar with ACTUAL FONT SUPPORT YOU ANIMALS..."
git clone https://github.com/krypt-n/bar.git >> install.log
echo "dmenu..."
git clone http://git.suckless.org/dmenu >> install.log

echo "Building & installing bspwm and sxhkd..."
cd bspwm
make >> install.log
sudo make install >> install.log
cd ../sxhkd
make >> install.log
sudo make install >> install.log
cd ../xdo
make >> install.log
sudo make install >> install.log
cd ../sutils
make >> install.log
sudo make install >> install.log
cd ../xtitle
make >> install.log
sudo make install >> install.log
cd ../bar
make >> install.log
sudo make install >> install.log
cd ../dmenu
sudo make clean install >> install.log
cd ..

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

# all the scripts you could ever want
mkdir -p ~/.scripts
cp configs/scripts/* ~/.scripts
chmod +x ~/.scripts/panel ~/.scripts/panel_bar ~/.scripts/addkeys.sh

echo ""
echo "=============================================="
echo "THINGS YOU STILL NEED TO DO, YO:"
echo "=============================================="
echo "* install Chrome (chrome.sh)"
echo "* install Sublime (you're on your own)"
echo "* put any keys in .ssh with the .osk extension"