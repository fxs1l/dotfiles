#!/bin/bash 
profile=$(< /home/fxs1l/.config/scripts/asusctl/profile)
if [ $(($profile)) -eq 2 ];
then
	#notify-send "Power Saver mode" -t 1000
	echo "0" > /home/fxs1l/.config/scripts/asusctl/profile
	#powerprofilesctl set power-saver
	asusctl profile -n
fi
if [ $(($profile)) -eq 0 ];
then
	#notify-send "Balanced mode" -t 1000
	echo "1" > /home/fxs1l/.config/scripts/asusctl/profile
	#powerprofilesctl set balanced
	asusctl profile -n
fi
if [ $(($profile)) -eq 1 ];
then
	#notify-send "Performance mode" -t 1000
	echo "2" > /home/fxs1l/.config/scripts/asusctl/profile
	#powerprofilesctl set performance
	asusctl profile -n
fi



