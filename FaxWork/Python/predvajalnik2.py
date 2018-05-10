from PyQt4 import QtCore, QtGui, uic, phonon
from PyQt4.QtCore import *
import os

path = "fili"

app = QtGui.QApplication([])
dlg = uic.loadUi("predvajalnik.ui")





def cd():
    cdd = str(QtGui.QFileDialog.getExistingDirectory(None,"Izberi mapo"))
    dlg.path.setText(cdd)
    dlg.listWidget.clear()
    for data in preberi_direktorij(dlg.path.text()):
        dlg.listWidget.insertItem(0,data["File"].strip(".mp3"))

def play():
    if len(dlg.listWidget.selectedItems()) != 0:
        if dlg.videoPlayer.isPaused():
            dlg.videoPlayer.play()
        else:
            file=preberi_direktorij(dlg.path.text())[dlg.listWidget.currentRow()]["File"]
            dlg.videoPlayer.play(phonon.Phonon.MediaSource(dlg.path.text()+"\\"+file))

def pause():
    dlg.videoPlayer.pause()

def stop():
    dlg.videoPlayer.stop()

def next():
    stop()
    file = os.path.basename(dlg.videoPlayer.mediaObject().currentSource().fileName())
    muske = preberi_direktorij(dlg.path.text())
    for i in range(len(muske)):
        if muske[i]["File"] == file:
            dlg.listWidget.setCurrentRow(i+1)
            play()
            return

def prev():
    stop()
    file = os.path.basename(dlg.videoPlayer.mediaObject().currentSource().fileName())
    muske = preberi_direktorij(dlg.path.text())
    for i in range(len(muske)):
        if muske[i]["File"] == file:
            dlg.listWidget.setCurrentRow(i-1)
            play()
            return


dlg.videoPlayer.play(phonon.Phonon.MediaSource("D:\\StarGate SG-1 All Seasons Complete -TD\\Season 8\\Stargate.SG-1.S08E19.Moebius.Part1.WS.DVDrip.XviD-SAiNTS.avi"))

dlg.volumeSlider.setAudioOutput(dlg.videoPlayer.audioOutput())
dlg.seekSlider.setMediaObject(dlg.videoPlayer.mediaObject())

QtCore.QObject.connect(dlg.listWidget, QtCore.SIGNAL("currentRowChanged(int)"), spremembaIzbora)
QtCore.QObject.connect(dlg.cd, QtCore.SIGNAL("clicked()"), cd)
QtCore.QObject.connect(dlg.play, QtCore.SIGNAL("clicked()"), play)
QtCore.QObject.connect(dlg.pause, QtCore.SIGNAL("clicked()"), pause)
QtCore.QObject.connect(dlg.stop, QtCore.SIGNAL("clicked()"), stop)
QtCore.QObject.connect(dlg.next, QtCore.SIGNAL("clicked()"), next)
QtCore.QObject.connect(dlg.prev, QtCore.SIGNAL("clicked()"), prev)
QtCore.QObject.connect(dlg.videoPlayer, QtCore.SIGNAL("finished()"), next)

dlg.show()
app.exec()