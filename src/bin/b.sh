#/bin/bash
export SHELL_PATH=/home/bdg/ssd/shell/chromium/


cd /home/bdg/ssd/chromium.android_webview/src
. sogou_webview/envsetup.sh
echo "gg ..."
ARGS=$(env | awk '/GN_ARGS_/{print $0}' | sed 's/GN_ARGS_//g' | tr '[A-Z]' '[a-z]')
gg
if [[ $# -ne 0 ]];then
    exit -1;
fi
echo "building ..."
export GN_ARGS_BUILD_VERSION="\"1.2.0.0\""
build
if [[ $# -ne 0 ]];then
    exit -1;
fi
echo "building ... success"
rm $SHELL_PATH/assets/ $SHELL_PATH/build $SHELL_PATH/libs/ res/ -rf
cp out/Release/libs_prebuilt/* $SHELL_PATH -ra
