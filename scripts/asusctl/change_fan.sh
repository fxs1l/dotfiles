#!/bin/bash 
profile=$(< ~/.scripts/asusctl/profile)
if [ $(($profile)) -eq 2 ];
then
	#notify-send "Power Saver mode" -t 1000
	echo "0" > ~/.scripts/asusctl/profile
	#powerprofilesctl set power-saver
	#./home/fxs1l/.scripts/asusctl/quiet.sh 
	sh ~/.scripts/asusctl/quiet.sh	
fi
if [ $(($profile)) -eq 0 ];
then
	#notify-send "Balanced mode" -t 1000
	echo "1" > ~/.scripts/asusctl/profile
	#powerprofilesctl set balanced
	sh ~/.scripts/asusctl/balanced.sh 
fi
if [ $(($profile)) -eq 1 ];
then
	#notify-send "Performance mode" -t 1000
	echo "2" > ~/.scripts/asusctl/profile
	#powerprofilesctl set performance
	sh ~/.scripts/asusctl/performance.sh
fi



