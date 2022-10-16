#!/bin/bash

# Minimize refresh rate when using battery
xrandr --output eDP --mode 2560x1440 --rate 60
# Use balanced profile for asusctl
asusctl profile -P balanced
