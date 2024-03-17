#!/bin/bash

# Minimize refresh rate when using battery
xrandr --output eDP --mode 2560x1440 --rate 60

# Use asusctl quiet fan profile and ryzenadj eco preset for HS-series APUs
sh /home/fxs1l/.scripts/asusctl/quiet.sh

#notify-send "Using quiet mode"
