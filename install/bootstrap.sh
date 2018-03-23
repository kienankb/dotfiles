#!/bin/bash

sudo pacman -S - < ./install/packages		# install everything we want from pacman
sudo pip install -r ./install/pip-packages	# install everything we want from pip
mkdir -p ~/projects/tools			# set up aur directory
cd ~/projects/tools
while read PKG; do
	git clone $PKG
done < install/cloneables
cd -
rm ~/.bashrc					# stow will fail otherwise
stow -t ~/ home/				# drop dotfiles into place
echo "Things you still have to do:"
echo "1. Build & install all the things you cloned"
echo "2. Install sublime-text"
echo "3. Set up your ssh keys"
