#!/usr/bin/env python
# coding=utf8

import os
import sys
import re

chromium_dir = "/home/bdg/ssd/chromium.android_webview/"


'''
head = "\
<?xml version=\"1.0\" encoding=\"utf-8\"?>\n\
<resources xmlns:xliff=\"urn:oasis:names:tc:xliff:document:1.2\">\n\
"
'''
head = ""

tail = "</resources>"
#tail = ""

supports_lang_list = []

translate_base = {}

def peek_data():
    print 'peek collected data......'
    for k in translate_base.iterkeys():
        print k + "  ->\n" + ''.join(translate_base[k])

def write_to_output(output_to):
    for k in translate_base.iterkeys():
        lang_part = k.split('-')
        new_lang = k
        if len(lang_part) > 1:
            new_lang =  lang_part[0] + '-r' + lang_part[1]
        dir_name = 'values-' + new_lang
        output = os.path.join(output_to, dir_name)
        os.mkdir(output)
        output = os.path.join(output, 'strings.xml')
        with open(output, 'a+') as f:
            f.write(head)
            f.write(''.join(translate_base[k]))
            f.write(tail)

def do_merge(root, t_id, name):
    r = re.compile(r'.*(_[a-z]{2}.).*')
    global supports_lang_list
    text_value = re.compile(r'.*<.*id="(.*)".*>(.*)<.*>.*')
    for lang in supports_lang_list:
        for fl in os.listdir(root):
            if fl.find("_" + lang +'.xtb') > 0:
                with open(os.path.join(root, fl), 'r') as f:
                    lines = f.readlines()
                    for l in lines:
                        ret = text_value.match(l)
                        if ret and ret.group(1) == t_id:
                            new_t = '    <string name=\"' + name + '\">\"' + ret.group(2) + '\"</string>\n'
                            translate_base[lang].append(new_t)
                            # print new_t

def do_merge2(root, t_id, name):
    r = re.compile(r'.*(_[a-z]{2}.).*')
    global supports_lang_list
    text_value = re.compile(r'.*<.*id="(.*)".*>.*<.*>(.*)<.*>.*')
    for lang in supports_lang_list:
        for fl in os.listdir(root):
            if fl.find("_" + lang +'.xtb') > 0:
                with open(os.path.join(root, fl), 'r') as f:
                    lines = f.readlines()
                    for l in lines:
                        ret = text_value.match(l)
                        if ret and ret.group(1) == t_id:
                            new_t = '    <string name=\"' + name + '\">\"' + ret.group(2).strip() + '\"</string>\n'
                            translate_base[lang].append(new_t)
                            # print new_t

def fetch_supported_lang(root):
    global supports_lang_list
    for file_name in os.listdir(root):
        if not file_name.endswith('.xtb'):
            continue
        last_dot = file_name.rfind('.')
        last_hor = file_name.rfind('_', 0, last_dot)
        lang = file_name[(last_hor + 1):last_dot]
        supports_lang_list.append(lang)
        translate_base[lang] = []

def do_merge_from_android(root, t_id, name):
    r = re.compile(r'.*(_[a-z]{2}.).*')
    global supports_lang_list
    text_value = re.compile(r'.*<.*id="(.*)".*>(.*)<.*>.*')
    for lang in supports_lang_list:
        lang_part = lang.split('-')
        new_lang = lang
        if len(lang_part) > 1:
            new_lang =  lang_part[0] + '-r' + lang_part[1]
        # print new_lang
        for fl in os.listdir(root):
            if fl.endswith('values-' + new_lang):
                try:
                    with open(os.path.join(root, fl + '/strings.xml'), 'r') as f:
                        lines = f.readlines()
                        for l in lines:
                            ret = text_value.match(l)
                            if ret and ret.group(1) == t_id:
                                new_t = '    <string name=\"' + name + '\">' + ret.group(2) + '</string>\n'
                                translate_base[lang].append(new_t)
                                # print new_t
                except IOError:
                    print("Error: 没有找到文件或读取文件失败: %s" % os.path.join(root, fl + '/strings.xml'))

def do_new_traslate(lang, text, name):
    pass

if __name__ == '__main__':
    global supports_lang_list
    fetch_supported_lang(chromium_dir + 'src/chrome/android/java/strings/translations/')
    print supports_lang_list
    '''
    do_merge(chromium_dir + 'src/chrome/android/java/strings/translations/', '6831043979455480757', 'sw_translate') #翻译
    do_merge('/home/qiyanpeng/ssd/sogou_chromium/src/content/public/android/java/strings/translations/', '1542044944667958430', 'sw_websearch') # 网页搜索
    do_merge('/home/qiyanpeng/ssd/sogou_chromium/src/content/public/android/java/strings/translations/', '6527303717912515753', 'sw_share') # 分享
    '''
    do_merge2(chromium_dir + 'src/chrome/app/resources/', '4875622588773761625', 'sw_update_password_message')

    # 从aosp中提取对应的语言.
    do_merge_from_android('/home/bdg/disk-server.1/android/android60/frameworks/base/core/res/res/', '767344687139195790', 'sw_save_password_message') 
    do_merge_from_android('/home/bdg/disk-server.1/android/android60/frameworks/base/core/res/res/', '6389675316706699758', 'sw_save_password_notnow') 
    do_merge_from_android('/home/bdg/disk-server.1/android/android60/frameworks/base/core/res/res/', '6491879678996749466', 'sw_save_password_remember') 
    do_merge_from_android('/home/bdg/disk-server.1/android/android60/frameworks/base/core/res/res/', '8274330296785855105', 'sw_save_password_never') 

    '''
    # 从翻译接口提取对应的语言.
    do_new_traslate('zh', '拔打', 'sw_dial') #拔打
    do_new_traslate('zh', '去往', 'sw_gotowebsite') #去往
    do_new_traslate('zh', '智能选词', 'sw_bigbang') #智能选词
    '''
    peek_data()
    write_to_output('/tmp/test/')
