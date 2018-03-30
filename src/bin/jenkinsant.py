import os
import sys
import subprocess

if __name__ == '__main__':
    #get code
    #svn branch argv3
    cmd = 'svn co http://svn.sogou-inc.com/svn/browser/semate/android/branches/%s SogouBrowser/sogoubrowser' % (sys.argv[3])
    sp = subprocess.Popen(cmd,shell=True)
    sp.wait()
    #set path
    PropFileName = "./SogouBrowser/sogoubrowser/project.properties"
    if not os.path.exists(PropFileName):
        print "./SogouBrowser/sogoubrowser/project.properties not exists"
        sys.exit(1);
    fileHandle = open(PropFileName,"r")
    filecontent = ""
    for line in fileHandle.readlines():
        if line.find('android.library.reference.1') != -1:
            line = 'android.library.reference.1=../sogouwebview\n'
        filecontent += line
    fileHandle.close()

    fileHandle = open(PropFileName,'w')
    fileHandle.write(filecontent)
    fileHandle.close()

    PropFileName = "./SogouBrowser/sogoubrowser/local.properties"
    if not os.path.exists(PropFileName):
        print "./SogouBrowser/sogoubrowser/local.properties not exists"
        sys.exit(1);
    fileHandle = open(PropFileName,"r")
    filecontent = ""
    for line in fileHandle.readlines():
        if line.find('sdk.dir') != -1:
            line = 'sdk.dir=/search/sdk/\n' 
    filecontent += line
    fileHandle.close()

    fileHandle = open(PropFileName,'w')
    fileHandle.write(filecontent)
    fileHandle.close()

    PropFileName = "./SogouBrowser/sogouwebview/local.properties" 
    if not os.path.exists(PropFileName):
        print "./SogouBrowser/sogouwebview/local.properties not exists"
        sys.exit(1);
    fileHandle = open(PropFileName,"r")
    filecontent = ""
    for line in fileHandle.readlines():
        if line.find('sdk.dir') != -1:
            line = 'sdk.dir=/search/sdk/\n'
    filecontent += line
    fileHandle.close()

    fileHandle = open(PropFileName,'w')
    fileHandle.write(filecontent)
    fileHandle.close()
    #export some vars
    os.environ['SVN_REVISION'] = '10'
    #1:JOB_NAME2:BUILD_NAME
    os.environ['CHANNEL_ID'] = sys.argv[1]
    os.environ['BUILD_NUMBER'] = sys.argv[2]
    os.environ['ANDROID_SDK_HOME'] = '/search/sdk'
    #ant build
    currentWorkDirc = os.getcwd()
    os.chdir('SogouBrowser/sogoubrowser')

    cmd = 'ant clean';
    sp = subprocess.Popen(cmd,shell=True);
    sp.wait();

    cmd = 'ant release';
    sp = subprocess.Popen(cmd,shell=True);
    sp.wait();
    os.chdir(currentWorkDirc)
