#!/bin/zsh
DefaultProfile="Otto-Blur"
NewProfile="No Blur"
for n in $(qdbus | grep -i konsole); do


KonsoleBus=$n
for i in $(qdbus $KonsoleBus | grep -i "sessions/"); do
SessionNumber=$i

qdbus $KonsoleBus $SessionNumber org.kde.konsole.Session.setProfile "$NewProfile"


done

done



#command to execute
taskwarrior-tui $@
#command to execute



for n in $(qdbus | grep -i konsole); do

KonsoleBus=$n
for i in $(qdbus $KonsoleBus | grep -i "sessions/"); do
SessionNumber=$i

qdbus $KonsoleBus $SessionNumber org.kde.konsole.Session.setProfile "$DefaultProfile"


done

done


