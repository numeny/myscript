#!/bin/bash
adb forward tcp:5039 tcp:5039
if [[ $# -eq 0 ]];then
~/bin/arm-linux-androideabi-gdb --command=~/bin/gdbinit ~/bin/app_process_meilan
else
~/bin/arm-linux-androideabi-gdb --command=~/bin/gdbinit.bak ~/bin/app_process_meilan
fi
