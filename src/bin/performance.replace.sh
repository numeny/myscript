#/bin/bash
#delete all description sentences, used for awk selecting time data
find . -name "*.txt" | xargs sed -i 's/Total load time: //g'
find . -name "*.txt" | xargs sed -i 's/Total css parsing time: //g'
find . -name "*.txt" | xargs sed -i 's/Total javascript time: //g'
find . -name "*.txt" | xargs sed -i 's/Total javascript init time: //g'
find . -name "*.txt" | xargs sed -i 's/Total javascript parsing time: //g'
find . -name "*.txt" | xargs sed -i 's/Total javascript execution time: //g'
find . -name "*.txt" | xargs sed -i 's/Total calculate style time: //g'
find . -name "*.txt" | xargs sed -i 's/Total Java callback (frame bridge) time: //g'
find . -name "*.txt" | xargs sed -i 's/Total parsing (may include calcStyle, Java callback or inline script execution) time: //g'
find . -name "*.txt" | xargs sed -i 's/Total layout time: //g'
find . -name "*.txt" | xargs sed -i 's/Total native 1 (framebridge nativecall for java) time: //g'
find . -name "*.txt" | xargs sed -i 's/Total native 2 (resource load) time: //g'
find . -name "*.txt" | xargs sed -i 's/Total native 3 (shared timer) time: //g'
find . -name "*.txt" | xargs sed -i 's/Total build nav (webview core) time: //g'
find . -name "*.txt" | xargs sed -i 's/Total record content (webview core) time: //g'
find . -name "*.txt" | xargs sed -i 's/Total native 4 (webviewcore nativecall for java) time: //g'
find . -name "*.txt" | xargs sed -i 's/Total draw content (webview ui) time: //g'
find . -name "*.txt" | xargs sed -i 's/Total texture generater (webview core) time: //g'
find . -name "*.txt" | xargs sed -i 's/Total page load (webview core) time: //g'
find . -name "*.txt" | xargs sed -i 's/Total page firstshotshow (webview core) time: //g'

#for all file on this directory, selete time data only, and save it in filename.log
for file in *.txt
do
echo "processing $file ..."
cat $file | awk '{print $5}' > /tmp/aa
mv /tmp/aa /tmp/bb
sed '/drawGL/d' /tmp/bb > /tmp/aa
sed '1,3d' /tmp/aa > /tmp/bb
sed '21,$d' /tmp/bb > /tmp/aa
sed '19,19d' /tmp/aa > /tmp/bb
sed '14,14d' /tmp/bb > /tmp/aa
sed '12,12d' /tmp/aa > /tmp/bb
sed '3,3d' /tmp/bb > /tmp/aa
mv /tmp/aa $file.log
done
