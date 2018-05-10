from PyQt4 import QtCore, QtGui, uic, phonon
from PyQt4.QtCore import *
import os

path = "fili"

app = QtGui.QApplication([])
dlg = uic.loadUi("predvajalnik.ui")
dlg.volumeSlider.setAudioOutput(dlg.videoPlayer.audioOutput())
dlg.seekSlider.setMediaObject(dlg.videoPlayer.mediaObject())









#dlg.videoPlayer.play(phonon.Phonon.MediaSource("D:\\StarGate SG-1 All Seasons Complete -TD\\Season 8\\Stargate.SG-1.S08E19.Moebius.Part1.WS.DVDrip.XviD-SAiNTS.avi"))




dlg.show()
app.exec()