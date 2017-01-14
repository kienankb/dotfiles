#!/bin/bash

LIBS="xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxft-dev libX11-xcb-dev libxcb-xtest0-dev libxinerama-dev"
BASICS="gcc apt-file xorg fonts-inconsolata htop colortest screenfetch screen tmux asciinema lolcat cowsay fortune feh scrot xbacklight colordiff alsa-utils ncmpcpp mpd compton mc redshift i3lock imagemagick"

rm install.log

echo ""
echo "==========================================="
echo "YO, Y'ALL BETTER BE RUNNING THIS FROM A TTY"
echo "==========================================="
echo ""

echo "Updating sources..."
sudo apt-get update >> install.log
echo "Installing needed libraries..."
sudo apt-get install -y $LIBS >> install.log
echo "Installing needed packages..."
sudo apt-get install -y $BASICS >> install.log

echo ""
echo "=============================================="
echo "THINGS YOU STILL NEED TO DO, YO:"
echo "=============================================="
echo "* install Sublime (you're on your own)"
echo "* put any keys in .ssh with the .osk extension"
