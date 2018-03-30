#/bin/bash
SOGOULIB_PATH=out/target/product/generic/system/lib/
PROJECT_PATH=~/sogouwebview/sogouwebview
ANDROID_PATH=`pwd`
ls -l ${ANDROID_PATH}/${SOGOULIB_PATH}/libsogousupport.so
ls -l ${ANDROID_PATH}/${SOGOULIB_PATH}/libsogouwebcore.so
echo "${ANDROID_PATH}"
cp ${ANDROID_PATH}/${SOGOULIB_PATH}/libsogousupport.so ${PROJECT_PATH}/SogouWebViewModel/src/main/jniLibs/armeabi/
cp ${ANDROID_PATH}/${SOGOULIB_PATH}/libsogouwebcore.so ${PROJECT_PATH}/SogouWebViewModel/src/main/jniLibs/armeabi/
ls -l ${PROJECT_PATH}/SogouWebViewModel/src/main/jniLibs/armeabi/libsogousupport.so
ls -l ${PROJECT_PATH}/SogouWebViewModel/src/main/jniLibs/armeabi/libsogouwebcore.so
