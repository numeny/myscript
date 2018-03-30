#!/bin/bash
echo "generating... ctags"
if [[ -f "tags" ]]
then
  rm tags -f
fi
if [[ -f "fileList" ]]
then
  rm fileList -f
fi

# generate cscope
echo "generating... cscope file"
if [[ -f "cscope.files" || -f "cscope.out" ]]
then
  rm cscope* -f
fi
find . -regex '.*\.\(cpp\|h\|c\|cc\|java\)' -type f | other_platform_src_filter.sh > cscope.files 
echo "generating... cscope tag"

ctags -R -L cscope.files
# ctags -R
cscope -bkR

# generate lookupfile tag
echo "generating... lookupfile tag"
if [[ -f "filenametags" ]]
then
  rm filenametags -f
fi
echo "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
find . -regex '.*\.\(cpp\|h\|c\|cc\|java\)' -type f -printf "%f\t%p\t1\n" | other_platform_src_filter.sh >> filenametags
#find . -not -regex '.*\.\(cpp\|h\)' -type f -printf "%f\t%p\t1\n" | sort -f >> filenametags 

echo "---generating ok---"
