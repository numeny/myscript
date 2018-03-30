#!/bin/bash

# Find if a given shell program is available.
# We need to take care of the fact that the 'which <foo>' command
# may return either an empty string (Linux) or something like
# "no <foo> in ..." (Darwin). Also, we need to redirect stderr
# to /dev/null for Cygwin
#
# $1: program name
# Out: program path, or empty string
# Return: 0 on success, != 0 on error
#

find_program ()
{
    local PROG RET
    PROG=$(which "$1" 2>/dev/null)
    RET=$?
    if [ $RET != 0 ]; then
        PROG=
    fi
    echo "$PROG"
    return $RET
}

AWK_CMD=${AWK_CMD:-$(find_program awk)}
AWK_SCRIPTS=/home/niefangxing/debug/awk

VERBOSE=${VERBOSE-yes}
echo $VERBOSE
run ()
{
    if [ "$VERBOSE" = "yes" ] ; then
        echo "## COMMAND: $@"
        "$@" 2>&1
    else
        if [ -n "$TMPLOG" ] ; then
            echo "## COMMAND: $@" >> $TMPLOG
            "$@" >>$TMPLOG 2>&1
        else
            "$@" > /dev/null 2>&1
        fi
    fi
}

# Return the PID of a given package or program, or 0 if it doesn't run
# $1: Package name ("com.example.hellojni") or program name ("/lib/gdbserver")
# Out: PID number, or 0 if not running
get_pid_of ()
{
    adb shell ps | $AWK_CMD -f $AWK_SCRIPTS/extract-pid.awk -v PACKAGE="$1"
}

PID=$(get_pid_of "sogou.mobile.explorer")

echo "pid of sogou.mobile.explorer is: $PID"

run adb shell gdbserver :5039 --attach $PID &

adb forward tcp:5039 tcp:5039
/home/niefangxing/debug/debugConfig/422/arm-linux-androideabi-gdb --command=/home/niefangxing/debug/debugConfig/422/maguro/config
