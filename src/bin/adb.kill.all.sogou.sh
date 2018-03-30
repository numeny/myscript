#!/bin/bash
FILE=/tmp/sogou.process.list
adb.ps.sh | awk '{print $2}' > $FILE
while read line
do
adb shell kill -9 $line
done < ${FILE}
rm $FILE -rf
