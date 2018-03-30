#/bin/bash
if [[ $# -eq 1 ]];then
cp /home/bdg/android-sdk/build-tools/23.0.2/aapt.bak /home/bdg/android-sdk/build-tools/23.0.2/aapt
cp /home/bdg/android-sdk/build-tools/23.0.2/lib/libc++.so.bak /home/bdg/android-sdk/build-tools/23.0.2/lib/libc++.so
else
cp /home/bdg/android-sdk/build-tools/23.0.2/aapt.sogou.search /home/bdg/android-sdk/build-tools/23.0.2/aapt
cp /home/bdg/android-sdk/build-tools/23.0.2/lib/libc++.so.sogou.search /home/bdg/android-sdk/build-tools/23.0.2/lib/libc++.so
fi
ls -l /home/bdg/android-sdk/build-tools/23.0.2/aapt*
ls -l /home/bdg/android-sdk/build-tools/23.0.2/lib/libc++.so*
