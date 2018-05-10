def gif_size(file):
    f = open(file, "rb")
    s = f.read()
    return ("{w:>5} X {h:<5}".format(w=str(ord(s[6])+ord(s[7])*0x100) ,h=str(ord(s[8])+ord(s[9])*0x100)))

def png_size(file):
    f = open(file, "rb")
    s = f.read()
    return ("{w:>5} X {h:<5}".format(w=str(ord(s[19])+ord(s[18])*0x100), h=str(ord(s[23])+ord(s[22])*0x100)))

def jpg_size(file):
    f = open(file, "rb")
    s = f.read()
    i = 0
    vrni = ""
    for c in s:
        if ord(c)==255:
            if ord(s[i+1])==192:
                vrni = ("{w:>5} X {h:<5}".format(w=ord(s[i+8])+ord(s[i+7])*256, h=ord(s[i+6])+ord(s[i+5])*256))
        i += 1
    return vrni


import os
path = "C:\\a" # tukaj vnesi mapo
for file in os.listdir(path):
    if file.split(".")[1].lower() == "gif":
        print("{dat:50}{size:}".format(dat=file, size=gif_size(path + "\\" + file)))
    elif file.split(".")[1].lower() == "png":
        print("{dat:50}{size:}".format(dat=file, size=png_size(path + "\\" + file)))
    elif file.split(".")[1].lower() == "jpg":
        print("{dat:50}{size:}".format(dat=file, size=jpg_size(path + "\\" + file)))