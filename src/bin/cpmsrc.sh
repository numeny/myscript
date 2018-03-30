#/bin/bash
if [ $# -ne 1 ];then
echo "[Usage] $0 [src-file-path]"
exit 0
fi
if [ -f ${NFS_ANDROID_PATH}/${NUFRONT_WEBKIT_PATH}/$1 ];then
echo "cp lib  ... cp ${NFS_ANDROID_PATH}/${NUFRONT_WEBKIT_PATH}/$1 ${ANDROID_PATH}/${NUFRONT_WEBKIT_PATH}/$1"
cp ${NFS_ANDROID_PATH}/${NUFRONT_WEBKIT_PATH}/$1 ${ANDROID_PATH}/${NUFRONT_WEBKIT_PATH}/$1
echo "cp lib ok ..."
ls -l ${NFS_ANDROID_PATH}/${NUFRONT_WEBKIT_PATH}/$1 
ls -l ${ANDROID_PATH}/${NUFRONT_WEBKIT_PATH}/$1
else
echo "file not exist [${NFS_ANDROID_PATH}/${NUFRONT_WEBKIT_PATH}/$1]"
fi
