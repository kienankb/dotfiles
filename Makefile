LIBS=
BASICS=gcc

all: getpackages

getpackages:
	sudo apt-get update
	echo "Installing needed libraries..."
	sudo apt-get install $(LIBS) > /dev/null
	echo "Installing needed packages..."
	sudo apt-get install $(BASICS) > /dev/null