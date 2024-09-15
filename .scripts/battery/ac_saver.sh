#!/bin/bash

# Minimize refresh rate when using battery
xrandr --output eDP-1 --mode 2560x1440 --rate 60

# Use asusctl quiet fan profile and ryzenadj eco preset for HS-series APUs
sh /home/fxs1l/.scripts/asusctl/quiet.sh

brightnessctl -c backlight  s 80%
# Hyprland config
hyprctl --batch "\
	keyword monitor eDP-1,2560x1440@165,auto,1.25;\
        keyword animations:enabled 1;\
        keyword decoration:drop_shadow 1;\
        keyword decoration:blur:enabled 1;"
hyprctl reload
