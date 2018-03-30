#!/bin/bash
if [ $# -gt 0 ];then
adb pull /sdcard/$1
fi
if [ $# -gt 1 ];then
adb pull /sdcard/$2
fi
if [ $# -gt 2 ];then
adb pull /sdcard/$3
fi
if [ $# -gt 3 ];then
adb pull /sdcard/$4
fi
if [ $# -gt 4 ];then
adb pull /sdcard/$5
fi
