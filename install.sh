#!/bin/bash

LIBS="xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxft-dev libX11-xcb-dev libxcb-xtest0-dev libxinerama-dev"
BASICS="make gcc apt-file xorg fonts-inconsolata htop colortest screenfetch screen tmux asciinema lolcat cowsay fortune feh scrot xbacklight colordiff alsa-utils ncmpcpp mpd compton mc redshift i3lock imagemagick"

sudo apt update & sudo apt upgrade -y
echo "Installing needed libraries..."
sudo aptinstall -y $LIBS
echo "Installing needed packages..."
sudo apt install -y $BASICS
