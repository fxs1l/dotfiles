#!/bin/bash

# Maximize refresh rate when connected to AC power adapter
xrandr --output eDP --mode 2560x1440 --rate 165
# Use performance profile in asusctl
asusctl profile -P performance
