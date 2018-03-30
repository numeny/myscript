#/bin/bash
JAR_FILE_LIST=/tmp/sogou_chrome_jar_file.list

find out/Release/gen/ -name "*.jar" > $JAR_FILE_LIST
while read line
do
cp $line sogou_webkit/sogouwebview_delegate/libs/
done < $JAR_FILE_LIST
