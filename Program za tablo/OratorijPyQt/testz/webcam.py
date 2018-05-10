from PyQt4 import QtCore, QtGui
from VideoCapture import Device
from PIL import Image, ImageQt
import sys
import time

app = QtGui.QApplication(sys.argv)
window = QtGui.QWidget()
layout = QtGui.QGridLayout(window)

button = QtGui.QLabel()


cam = Device(0)

pilImage = cam.getImage()
qimg = ImageQt.ImageQt(pilImage)
qPixmap = QtGui.QPixmap.fromImage(qimg)
button.setPixmap(qPixmap)
time.sleep(10)
del(cam)


layout.addWidget(button)

window.show()
app.exec_()
