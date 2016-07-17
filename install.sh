#!/bin/bash

LIBS="xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev"
BASICS="gcc apt-file"

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