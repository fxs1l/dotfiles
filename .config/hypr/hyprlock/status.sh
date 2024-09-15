#!/usr/bin/env bash

############ Variables ############
enable_battery=false
battery_charging=false
capacity=0
battery_icon=
####### Check availability ########
for battery in /sys/class/power_supply/*BAT*; do
  if [[ -f "$battery/uevent" ]]; then
    enable_battery=true
    if [[ $(cat /sys/class/power_supply/*/status | head -1) == "Charging" ]]; then
      battery_charging=true
    fi
    # Get battery capacity
    capacity=$(cat /sys/class/power_supply/*/capacity | head -n 1)

    # Check if capacity is less than 25
    if [ $capacity -lt 25 ]; then
        # echo "Battery capacity is less than 25%"
        battery_icon=
    elif [ $capacity -lt 60 ]; then
        # echo "Battery capacity is between 25% and 60%"
        battery_icon=
    elif [ $capacity -lt 100 ]; then
        # echo "Battery capacity is between 60% and 100%"
        battery_icon=
    else
        # echo "Battery capacity is at 100%"
        battery_icon=
    fi

    break
  fi
done



############# Output #############
if [[ $enable_battery == true ]]; then
  if [[ $battery_charging == true ]]; then
    battery_icon=󰂄
  fi
  echo -n "$battery_icon  "
  echo -n " $(cat /sys/class/power_supply/*/capacity | head -1)"%
  if [[ $battery_charging == false ]]; then
    echo -n " remaining"
  fi
fi

# echo ''

# song_info=$(playerctl metadata --format '󰎆  {{title}} - {{artist}}')

# echo -e "\t$song_info" 

