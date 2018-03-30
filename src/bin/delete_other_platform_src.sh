#!/bin/sh
rm -rf LayoutTests
rm -rf Examples
rm -rf PerformanceTests
rm -rf Tools
rm -rf WebKitLibraries
rm -rf Source/WebKit2
#删除 ChangeLog
find . -name "ChangeLog*" | xargs rm -rf

#删除平台相关代码
find . -name "brew" -o -name "cairo" -o -name "cg" -o -name "cocoa" -o -name "efl" -o -name "gtk" -o -name "haiku" -o -name "mac" -o -name "qt" -o -name "win" -o -name "wince" -o -name "wx" | xargs rm -rf
