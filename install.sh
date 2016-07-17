#!/bin/bash

LIBS="xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev"
BASICS="gcc apt-file xorg"

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

echo "Building & installing bspwm and sxhkd..."
cd bspwm
make && sudo make install
cd ../sxhkd
make && sudo make install

cd ..

echo "Placing config files..."
mkdir ~/.config ~/.config/bspwm ~/.config/sxhkd
cp configs/bspwmrc ~/.config/bspwm/
chmod +x ~/.config/bspwm/bspwmrc
cp configs/sxhkdrc ~/.config/sxhkd/
chmod +x ~/.config/sxhkd/sxhkdrc
cp configs/.xinitrc ~/
chmod +x ~/.xinitrc