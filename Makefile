LIBS=xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev
BASICS=gcc apt-file

all: getpackages cloneeverything installeverything

getpackages:
	sudo apt-get update
	echo "Installing needed libraries..."
	sudo apt-get install $(LIBS) > /dev/null
	echo "Installing needed packages..."
	sudo apt-get install $(BASICS) > /dev/null

cloneeverything:
	mkdir clones
	cd clones
	git clone https://github.com/baskerville/bspwm.git
	git clone https://github.com/baskerville/sxhkd.git

installeverything:
	echo "Building & installing bspwm and sxhkd..."
	cd clones/bspwm
	make && sudo make install
	cd ../sxhkd
	make && sudo make install