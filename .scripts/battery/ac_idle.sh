#!/bin/bash
# script to run when idling to conserve power consumption

sh /home/fxs1l/.scripts/asusctl/quiet.sh
brightnessctl -c backlight  s 50%