#!/bin/bash

# Maximize refresh rate when connected to AC power adapter
xrandr --output eDP-1 --mode 2560x1440 --rate 165

# Use asusctl balanced fan profile and ryzenadj balanced preset for HS-series APUs
state=$(cat /sys/class/power_supply/*/status)

sh /home/fxs1l/.scripts/asusctl/balanced.sh

brightnessctl -c backlight  s 80%
# Hyprland config
hyprctl --batch "\
	keyword monitor eDP-1,2560x1440@165,auto,1.25;\
        keyword animations:enabled 1;\
        keyword decoration:drop_shadow 1;\
        keyword decoration:blur:enabled 1;"
hyprctl reload
