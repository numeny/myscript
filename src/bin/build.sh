#/bin/bash
export SHELL_PATH=/home/bdg/ssd/shell/prefetchnext_pre_newcore/chromium/

cd /home/bdg/ssd/chromium.android_webview/src
. sogou_webview/envsetup.sh
echo "gg ..."
gg
if [[ $# -ne 0 ]];then
    exit -1;
fi
echo "building ..."
build
if [[ $# -ne 0 ]];then
    exit -1;
fi
echo "building ... success"
cp out/Release/libs_prebuilt/* $SHELL_PATH -ra
