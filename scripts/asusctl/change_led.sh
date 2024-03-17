#!/bin/bash 
ledmode=$(< /home/fxs1l/.scripts/asusctl/led-mode)
if [ $(($ledmode)) -eq 2 ];
then
	#notify-send "Led Mode" "Static" -t 1000
	echo "0" > /home/fxs1l/.scripts/asusctl/led-mode
    asusctl led-mode static
fi
if [ $(($ledmode)) -eq 0 ];
then
	#notify-send "Led Mode" "Breathe" -t 1000
	echo "1" > /home/fxs1l/.scripts/asusctl/led-mode
    asusctl led-mode breathe
fi
if [ $(($ledmode)) -eq 1 ];
then
	#notify-send "Led Mode" "Pulse" -t 1000
	echo "2" > /home/fxs1l/.scripts/asusctl/led-mode
	asusctl led-mode pulse
fi


