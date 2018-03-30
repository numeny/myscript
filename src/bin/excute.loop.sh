#!/bin/sh
if [ $# -eq 0 ];then
    echo "[Usage] $(basename $0) <excute-command> [cmd-param]"
    exit 0
fi

x=1
ls -l aaaaaaa
while [ $? -ne 0 ]
do
echo "excuting $1 $2 $3 $4 $5 $6 $7 $8 $9 ... $x times"
x=$(( $x + 1 ))
$1 $2 $3 $4 $5 $6 $7 $8 $9 >~/tmp/log.$(basename $0).$1.$x 2>&1
done
