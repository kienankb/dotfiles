#!/bin/bash

sudo pacman -S - < ./install/packages		# install everything we want from pacman
sudo pip install -r ./install/pip-packages	# install everything we want from pip
mkdir -p ~/projects/aur				# set up aur directory
while read PKG; do
	git clone https://aur.archlinux.org/$PKG.git ~/projects/aur/$PKG
done < install/aur-packages
rm ~/.bashrc					# stow will fail otherwise
stow -t ~/ home/				# drop dotfiles into place
