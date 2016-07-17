#!/bin/bash

LIBS="xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxft-dev libX11-xcb-dev libxcb-xtest0-dev"
BASICS="gcc apt-file xorg fonts-inconsolata"

git config --global user.name "Kienan Knight-Boehm"
git config --global user.email "kienan@kienankb.com"
git config --global push.default simple

echo "Updating sources..."
sudo apt-get update
echo "Installing needed libraries..."
sudo apt-get install -y $LIBS
echo "Installing needed packages..."
sudo apt-get install -y $BASICS

echo "Cloning everything we need..."
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
git clone https://github.com/baskerville/xdo.git
git clone https://github.com/baskerville/sutils.git
git clone https://github.com/baskerville/xtitle.git
git clone https://github.com/krypt-n/bar.git

echo "Building & installing bspwm and sxhkd..."
cd bspwm
make && sudo make install
cd ../sxhkd
make && sudo make install
cd ../xdo
make && sudo make install
cd ../sutils
make && sudo make install
cd ../xtitle
make && sudo make install
cd ../bar
make && sudo make install
cd ..

echo "Placing config files and scripts..."
# bspwm, sxhkd configs
mkdir -p ~/.config/bspwm ~/.config/sxhkd
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
# all the scripts you could ever want
mkdir -p ~/.scripts
cp configs/scripts/* ~/.scripts
chmod +x ~/.scripts/panel ~/.scripts/panel_bar