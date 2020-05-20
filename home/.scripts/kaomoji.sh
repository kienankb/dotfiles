#!/usr/bin/env bash
# Modded version of the kaomoji rofi script from:
#   https://gitlab.com/ceda_ei/kaomoji-rofi

selection=$(rofi -i -dmenu $@ < $(dirname $0)/kaomoji.txt)
kaomoji=$(echo $selection | sed "s|$(echo -e "\ufeff").*||")
echo -n "$kaomoji" | xclip -selection clipboard
