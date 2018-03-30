#!/bin/bash
adb forward tcp:5039 tcp:5039
if [[ $# -eq 0 ]];then
~/bin/arm-linux-androideabi-gdb_510_shamu --command=~/bin/gdbinit ~/bin/app_process_510_shamu
else
~/bin/arm-linux-androideabi-gdb_510_shamu --command=~/bin/gdbinit.bak ~/bin/app_process_510_shamu
fi
