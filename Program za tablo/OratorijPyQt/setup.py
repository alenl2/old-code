import sys, os
from cx_Freeze import setup, Executable
from PyQt4 import uic
import shutil

ui = open("Form.ui", 'r')
py = open("Form.py", 'w')
err = uic.compileUi(ui, py, True)
ui.close()
py.close()

try:
    for i in os.listdir("C:\\Python32\\Lib\\site-packages\\PyQt4\\plugins"):
        shutil.copytree("C:\\Python32\\Lib\\site-packages\\PyQt4\\plugins\\"+i,"C:\\Users\\Alen\\PycharmProjects\\Oratorij\\build\\exe.win-amd64-3.2\\"+i)
except:
    pass

build_exe_options = {"packages": ["decimal"], "excludes": ["tkinter"], 'include_files':[], 'includes':['sip', 'PyQt4.QtCore']}
if sys.platform == "win32":
    base = "Win32GUI"

setup(  name = "Prijave",
    version = "1",
    description = "Program za prijavo otrok na oratorij",
    options = {"build_exe": build_exe_options},
    executables = [Executable("Prijave.py", base=base,icon = "logotip.ico")])