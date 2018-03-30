#!/bin/bash
ANDROID_PATH=/home/bdg/ssd/android/AndroidSource
#DIR_PATH=~/ssd/chromium/src/out/Release/lib/
DIR_PATH=/home/bdg/tmp/huawei.sym
LIB_NAME=libsogou_content_shell_content_view.so
#${ANDROID_PATH}/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi-addr2line -C -f -e ${DIR_PATH}/${LIB_NAME} ${FUNC_ADDRESS}
#cat $1 | grep "\ pc\ " | grep "sogou" | awk '{print $4}' | ${ANDROID_PATH}/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi-addr2line -C -f -e ${DIR_PATH}/${LIB_NAME}

cat $1 | grep "sogou_content_shell_content_view"  | awk '{print $3}' | ${ANDROID_PATH}/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi-addr2line -C -f -e ${DIR_PATH}/${LIB_NAME}
