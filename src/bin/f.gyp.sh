#!/bin/sh
if [ $# -eq 1 ];then
    SEARCH_PATH=.
    SEARCH_STR="$1"
elif [ $# -eq 2 ];then
    SEARCH_PATH=$1
    SEARCH_STR="$2"
else
    echo "[Usage] $0 [search_path] search_string"
    exit 0
fi

echo "$0 $SEARCH_PATH $SEARCH_STR"

find $SEARCH_PATH -name "*.gyp" -o -name "*.gypi" -type f | other_platform_src_filter.sh | xargs grep "$SEARCH_STR" --color=auto -i
