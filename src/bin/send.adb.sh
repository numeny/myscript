#!/bin/bash
if [ $# -ne 1 ];then
  echo "[usage] $0 [u|d|l|r|e]"
  exit 0;
fi
export keycode=
if [[ $1 = "u" ]];then
keycode=19
elif [[ $1 = "d" ]];then
keycode=20
elif [[ $1 = "l" ]];then
keycode=21
elif [[ $1 = "r" ]];then
keycode=22
elif [[ $1 = "e" ]];then
keycode=23
elif [[ $1 = "b" ]];then
keycode=4
else
keycode=$1
fi
echo "param=$1 keycode=$keycode"
adb shell input keyevent $keycode
