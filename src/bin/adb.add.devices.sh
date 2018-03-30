#!/bin/bash
#lsusb 查看, 然后将其加入/etc/udev/rules.d/51-android.rules
sudo chmod a+rx /etc/udev/rules.d/51-android.rules
sudo /etc/init.d/udev restart
sudo /home/bdg/android-sdk/platform-tools/adb kill-server
sudo /home/bdg/android-sdk/platform-tools/adb devices
