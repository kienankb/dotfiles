#!/bin/bash

sudo pacman -S - < ./install/packages		# install everything we want from pacman
sudo pip install -r ./install/pip-packages	# install everything we want from pip
rm ~/.bashrc					# stow will fail otherwise
stow -t ~/ home/				# drop dotfiles into place
