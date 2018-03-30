#/bin/bash
export LD_LIBRARY_PATH=/home/bdg/android-sdk/build-tools/23.0.2/lib:$LD_LIBRARY_PATH
./gradlew clean assemblePluginDebug --info
#./gradlew assemblePluginDebug --info
