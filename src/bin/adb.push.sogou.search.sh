#!/bin/bash
ls -l SogouWebkitPluginImpl/build/outputs/apk/SogouWebkitPluginImpl-plugin-debug-unaligned.apk
mv SogouWebkitPluginImpl/build/outputs/apk/SogouWebkitPluginImpl-plugin-debug-unaligned.apk SogouWebkitPluginImpl/build/outputs/apk/plugin.apk
echo "adb pushing plugin.apk ..."
adb push SogouWebkitPluginImpl/build/outputs/apk/plugin.apk /sdcard/splugin/
echo "adb pushing config.json ..."
adb push ../config.json /sdcard/splugin/
adb shell ls -l /sdcard/splugin/plugin.apk
adb shell cat /sdcard/splugin/config.json
