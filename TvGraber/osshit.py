import shutil
import fileinput
f = open("T-2.RADIO.m3u","r", encoding='utf8')
x = open("Tlist","w")
f.readline()

count = 1
for line in f:
    name = line.strip("\n")[line.strip("\n").find("-")+2:]
    stream = f.readline().strip("\n")
    ip,port = stream[stream.find("@")+1:].split(":")
    x.write(name+"|"+ip+"|"+port+"\n")
    f.readline()