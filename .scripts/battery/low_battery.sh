#!/bin/bash

level=$(cat /sys/class/power_supply/*/capacity)
notify-send -u critical -i battery-low -t 1000 "Battery Alert" "Battery level ($level%) is critically low"
