#!/bin/bash

sudo pacman -S - < ./packages
stow -t ~/ ../home/
