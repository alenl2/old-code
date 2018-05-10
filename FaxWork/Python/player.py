import sys ,os
from PyQt4 import uic
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from PyQt4 import *
from PyQt4.QtNetwork import *
from PyQt4.phonon import *

PORTS = (9998, 9999)
PORT = 9999
SIZEOF_UINT32 = 4
IP = "localhost"
ROOT = "D:/StarGate SG-1 All Seasons Complete -TD"



class Form(QMainWindow):

    def __init__(self, parent=None):
        super(Form, self).__init__(parent)
        dlg = uic.loadUi("play.ui",self)

        self.playerVolume.setAudioOutput(self.player.audioOutput())
        self.playerSeek.setMediaObject(self.player.mediaObject())
        # Ititialize socket
        self.socket = QTcpSocket()

        # Initialize data IO variables
        self.nextBlockSize = 0
        self.request = None


        self.shortcutFull = QShortcut(self)
        self.shortcutFull.setKey(QKeySequence('F11'))
        self.shortcutFull.setContext(Qt.ApplicationShortcut)
        self.shortcutFull.activated.connect(self.fullScreen)


        self.lineedit.setFocus()
        self.seekTo = 0
        # Signals and slots for line edit and connect button
        self.lineedit.returnPressed.connect(self.issueRequest)
        self.connectButton.clicked.connect(self.connectToServer)
        self.stop.clicked.connect(self.stopIt)
        self.fullScr.clicked.connect(self.fullScreen)
        self.syncButton.clicked.connect(self.sync)

        self.setWindowTitle("Client")
        # Signals and slots for networking

        self.player.mediaObject().stateChanged.connect(self.handleStateChanged)

        self.socket.readyRead.connect(self.readFromServer)
        self.socket.disconnected.connect(self.serverHasStopped)
        self.connect(self.socket, SIGNAL("error(QAbstractSocket::SocketError)"), self.serverHasError)


    def stopIt(self):
        self.player.stop()

    def fullScreen(self):
        videoWidget = self.player.videoWidget()
        if not videoWidget.isFullScreen():
            videoWidget.enterFullScreen()
        else:
            videoWidget.exitFullScreen()

    def sync(self):
        self.issueRequest("CMD|File={}|Play={}|Time={}".format(self.player.mediaObject().currentSource().fileName()[len(ROOT):],int(self.player.isPlaying()),self.player.currentTime()))
        pass

    def handleStateChanged(self, newstate, oldstate):
        if newstate == Phonon.PlayingState:
            self.playerSeek.mediaObject().seek(int(self.seekTo))

    def updateUi(self, text):

        "CMD|File=/Season 9/Stargate.SG-1.S09E07.Ex.Deus.Machina.WS.DVDrip.XviD-SAiNTS.avi.avi|Play=1|Time=15208"
        cmd = text[text.find("> ")+2:]
        if cmd.startswith("CMD|"):
            for command in cmd.split("|"):
                if command.startswith("File"):
                    self.player.load(Phonon.MediaSource(ROOT+command[5:]))
                if command.startswith("Play"):
                    if command.strip("Play=") == "1":
                        self.player.play()
                    if command.strip("Play=") == "0":
                        self.player.pause()
                    if command.strip("Play=") == "-1":
                        self.player.stop()
                if command.startswith("Time"):
                    self.seekTo = command.strip("Time=")

        self.browser.append(text)

    # Create connection to server
    def connectToServer(self):
        self.connectButton.setEnabled(False)
        self.socket.connectToHost(IP, PORT)

    def issueRequest(self, text=""):
        self.request = QByteArray()
        stream = QDataStream(self.request, QIODevice.WriteOnly)
        stream.setVersion(QDataStream.Qt_4_2)
        stream.writeUInt32(0)
        if text == "":
            stream.writeQString(self.lineedit.text())
        else:
            stream.writeQString(text)
        stream.device().seek(0)
        stream.writeUInt32(self.request.size() - SIZEOF_UINT32)
        self.socket.write(self.request)
        self.nextBlockSize = 0
        self.request = None
        if text == "":
            self.lineedit.setText("")

    def readFromServer(self):
        stream = QDataStream(self.socket)
        stream.setVersion(QDataStream.Qt_4_2)

        while True:
            if self.nextBlockSize == 0:
                if self.socket.bytesAvailable() < SIZEOF_UINT32:
                    break
                self.nextBlockSize = stream.readUInt32()
            if self.socket.bytesAvailable() < self.nextBlockSize:
                break
            textFromServer = stream.readQString()
            self.updateUi(textFromServer)
            self.nextBlockSize = 0

    def serverHasStopped(self):
        self.socket.close()
        self.connectButton.setEnabled(True)

    def serverHasError(self):
        self.updateUi("Error: {}".format(
            self.socket.errorString()))
        self.socket.close()
        self.connectButton.setEnabled(True)


app = QApplication(sys.argv)
form = Form()
form.show()
app.exec_()