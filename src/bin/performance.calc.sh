#/bin/bash
grep firstShot . -r  | awk '{print $2}' | sed  's/diff://g'
