#!/bin/bash

sudo pacman -S - < ./install/packages		# install everything we want from pacman
sudo pip install -r ./install/pip-packages	# install everything we want from pip
mkdir -p ~/projects/tools			# set up aur directory
cd ~/projects/tools
while read PKG; do
	git clone $PKG
done < ~/projects/dotfiles/install/cloneables
cd -
rm ~/.bashrc					# stow will fail otherwise
mkdir ~/.config
stow -t ~/ home/				# drop dotfiles into place
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu sublime-text
echo "Things you still have to do:"
echo "1. Build & install all the things you cloned"
echo "2. Install video drivers"
echo "3. Set up your ssh keys"
echo "4. Link st config & sublime configs after installing Package Control, DA UI"
