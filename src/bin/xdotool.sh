#!/bin/bash
for((i=1;i>0;i++))
do
#echo $(expr $i \* 4);
sleep 1
echo "index=$i";
xdotool mousemove 1150 330
xdotool click 1
done
