#!/bin/bash

# Maximize refresh rate when connected to AC power adapter
xrandr --output eDP --mode 2560x1440 --rate 165

# Use asusctl balanced fan profile and ryzenadj balanced preset for HS-series APUs
sh /home/fxs1l/.scripts/asusctl/balanced.sh
