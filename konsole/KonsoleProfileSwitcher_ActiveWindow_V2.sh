#!/bin/bash
DefaultProfile="Otto-Blur"
NewProfile="No Blur"
KonsoleBus="org.kde.konsole-$(xprop -id `xdotool getwindowfocus` | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$' )"
KonsoleWindows=$(qdbus $KonsoleBus | grep -i windows/)


for i in $KonsoleWindows; do

CurrentSession=$( qdbus $KonsoleBus $i org.kde.konsole.Window.currentSession)
qdbus $KonsoleBus /Sessions/$CurrentSession org.kde.konsole.Session.setProfile "$NewProfile"

done


#command to execute
nvim $@
#command to execute


for i in $KonsoleWindows; do

CurrentSession=$( qdbus $KonsoleBus $i org.kde.konsole.Window.currentSession)
qdbus $KonsoleBus /Sessions/$CurrentSession org.kde.konsole.Session.setProfile "$DefaultProfile"

done
