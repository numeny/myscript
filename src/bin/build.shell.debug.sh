#/bin/bash
./build.sh
if [[ $? -eq 0 ]];then
ls -l ./BrowserActivity/build/outputs/apk/BrowserActivity-debug-unaligned.apk
adb.install.sh ./BrowserActivity/build/outputs/apk/BrowserActivity-debug-unaligned.apk
fi
