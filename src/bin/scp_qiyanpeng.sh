#/bin/sh
echo copying $1 ...
TARGET_IP=10.129.157.217
USER=teamer
if [[ -d $1 ]]
then
    scp -r $1 $USER@${TARGET_IP}:~/tmp
elif [[ -f $1 ]]
then
    scp $1 $USER@${TARGET_IP}:~/tmp
fi
if [[ -d $2 ]]
then
    scp -r $2 $USER@${TARGET_IP}:~/tmp
elif [[ -f $2 ]]
then
    scp $2 $USER@${TARGET_IP}:~/tmp
fi
if [[ -d $3 ]]
then
    scp -r $3 $USER@${TARGET_IP}:~/tmp
elif [[ -f $3 ]]
then
    scp $3 $USER@${TARGET_IP}:~/tmp
fi
