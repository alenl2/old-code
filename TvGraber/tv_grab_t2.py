#!/usr/bin/python3
#coding=utf-8

import urllib.request
import datetime
import time
import re
URL = "http://tv.t-2.net/"


def getChanals():
    page = urllib.request.urlopen(URL+"?funcName=TVCHANNELS")
    pageContent = page.read().decode('utf-8')
    reg = re.findall("<tr><td><img src=\"IMGTV(.*?)<div class=\"Underline_Lite\">",pageContent, re.IGNORECASE | re.MULTILINE)
    chanels = []
    for rawCh in reg:
        imgre = re.findall("/(.*?)\" align", rawCh,re.IGNORECASE | re.MULTILINE)
        img = "http://192.168.1.2/IMGTV/"+imgre[0]
        nreg = re.findall("<b>(.*?)</b>",rawCh,re.IGNORECASE | re.MULTILINE)
        ChName = nreg[0]
        nnreg = re.findall("<a href=\"./\\?TVCHUID=(.*?)\">",rawCh,re.IGNORECASE | re.MULTILINE)
        ChID = 0;
        if len(nnreg) != 0:
            ChID = nnreg[0]
        chanels.append([ChName,ChID,img])
    return chanels

def getChanalData(ChID, day):
    program = []
    page = urllib.request.urlopen(URL+"?TVCHUID="+str(ChID)+"&date="+((datetime.date.today()+datetime.timedelta(days=day)).isoformat().replace("-","")))
    pageContent = page.read().decode('utf-8')
    reg = re.findall("<tt>(.*?)</tr>",pageContent,re.IGNORECASE | re.MULTILINE)
    for prog in reg:
        nameReg = re.findall("<td><b>(.*?)</b>",prog,re.IGNORECASE | re.MULTILINE)
        discReg = re.findall("<div class=\"small-text\">(.*?)</div>",prog,re.IGNORECASE | re.MULTILINE)
        timeReg = re.findall("([0-9][0-9]:[0-9][0-9])</tt>",prog,re.IGNORECASE | re.MULTILINE)
        if len(discReg) == 0:
            discReg.append("")
        if len(nameReg) != 0 and len(timeReg) != 0:
            time = (datetime.date.today()+datetime.timedelta(days=day)).isoformat().replace("-","")+timeReg[0].replace(":","")+"00"
            program.append([nameReg[0],time,discReg[0]])
    return program

chs = getChanals()

print("""<?xml version="1.0" encoding="utf-8"?>
<tv source-info-url="http://tv.t-2.net/" source-info-name="T2 Spored">""")
for ch in chs:
    print("""  <channel id={}">
    <display-name>{}</display-name>
    <icon src="{}" />
  </channel>""".format(ch[0],ch[0],ch[2]))

for day in range(2):
    for ch in chs:
        prog = getChanalData(ch[1],day)
        for showN in range(len(prog)):
            if len(prog) < showN+2:
                stopT = prog[showN][1][:8]+"235959"
            else:
                stopT = prog[showN+1][1]
            print("""  <programme start="{} +0100" stop="{} +0100" channel="{}">
    <title>{}</title>
    <desc>{}</desc>
  </programme>""".format(prog[showN][1],stopT,ch[0],prog[showN][0],prog[showN][2]))
print("</tv>")