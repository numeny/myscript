#/bin/bash
export ANDROID_PATH=/home/bdg/ssd/android/AndroidSource/external
#export ANDROID_PATH=/home/bdg/sogouwebcore
if [ $# -ne 1 ];then
    echo "[Usage] $0 <git branch>"
    exit -1
fi
branch=$1
PROJECTS=("${ANDROID_PATH}/sogouwebkit" "${ANDROID_PATH}/sogoulibs" "${ANDROID_PATH}/sogouchromium" "${ANDROID_PATH}/sogouskia/")
for project in ${PROJECTS[*]}
do
echo "========== processing ... project: $project"
cd ${project}
git stash
git fetch
git checkout $branch
git reset --hard origin/$branch
done
