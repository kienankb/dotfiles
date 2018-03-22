#!/bin/bash

sudo pacman -S - < ./install/packages
stow -t ~/ home/
