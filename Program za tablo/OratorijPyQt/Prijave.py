__author__ = 'Alen'
RQ00,

from PyQt4 import QtCore, QtGui, uic
from Form import Ui_prijaveForm
from Classes import *
from PIL import Image
import os ,sys, pyodbc, time, base64, sqlite3, io
import win32com.client
import pythoncom
import shutil
import math
import re

#app = QtGui.QApplication(sys.argv)
#dlg = uic.loadUi("Form.ui")
x = time.time()
con = sqlite3.connect("sqlite3.db")
cu = con.cursor()
conn = pyodbc.connect('Driver={MySQL ODBC 5.1 Driver};Server=127.0.0.1;Port=3306;Database=oratorij;User=root; Password=;Option=3;')
conn.autocommit = True
cur = conn.cursor()
cur.execute("USE oratorij;")
time.sleep(0.1)

class MyForm(QtGui.QMainWindow):
    def __init__(self, parent=None):
        QtGui.QWidget.__init__(self, parent)
        self.ui = Ui_prijaveForm()
        self.ui.setupUi(self)
        self.ui.timer = QtCore.QTimer(self.ui.prijaveWidget)
        self.ui.timer.setInterval(1000)
        self.ui.timer.start()

        self.ui.dSlika = Label(self.ui.dDockContent)
        self.ui.dSlika.setText("     SLIKA     ")
        self.ui.dSlika.setScaledContents(1)
        self.ui.doGridLayout.addWidget(self.ui.dSlika, 0, 1, 1, 1)
        self.ui.dSlika.setStyleSheet("QLabel { background-color : white; color : blue; }");
        self.ui.sSlika = Label(self.ui.sDockContent)
        self.ui.sSlika.setText("     SLIKA     ")
        self.ui.sSlika.setScaledContents(1)
        self.ui.soGridLayout.addWidget(self.ui.sSlika, 0, 1, 1, 1)
        self.ui.sSlika.setStyleSheet("QLabel { background-color : white; color : blue; }");
        self.ui.aSlika = Label(self.ui.sDockContent)
        self.ui.aSlika.setText("     SLIKA     ")
        self.ui.aSlika.setScaledContents(1)
        self.ui.aoGridLayout.addWidget(self.ui.aSlika, 0, 1, 1, 1)
        self.ui.aSlika.setStyleSheet("QLabel { background-color : white; color : blue; }");
        self.ui.pSlika = Label(self.ui.pDockContent)
        self.ui.pSlika.setText("     SLIKA     ")
        self.ui.pSlika.setScaledContents(1)
        self.ui.poGridLayout.addWidget(self.ui.pSlika, 0, 1, 1, 1)
        self.ui.pSlika.setStyleSheet("QLabel { background-color : white; color : blue; }");

        QtCore.QObject.connect(self.ui.skupine, QtCore.SIGNAL("itemSelectionChanged()"), self.skupineKlik)
        QtCore.QObject.connect(self.ui.animatorji, QtCore.SIGNAL("itemSelectionChanged()"), self.animatorjiKlik)
        QtCore.QObject.connect(self.ui.otroci, QtCore.SIGNAL("itemSelectionChanged()"), self.otrociKlik)
        QtCore.QObject.connect(self.ui.delavnice, QtCore.SIGNAL("itemSelectionChanged()"), self.delavniceKlik)
        QtCore.QObject.connect(self.ui.sShrani, QtCore.SIGNAL("clicked()"), self.sShrani)
        QtCore.QObject.connect(self.ui.sBrisi, QtCore.SIGNAL("clicked()"), self.sBrisi)
        QtCore.QObject.connect(self.ui.aShrani, QtCore.SIGNAL("clicked()"), self.aShrani)
        QtCore.QObject.connect(self.ui.aBrisi, QtCore.SIGNAL("clicked()"), self.aBrisi)
        QtCore.QObject.connect(self.ui.dShrani, QtCore.SIGNAL("clicked()"), self.dShrani)
        QtCore.QObject.connect(self.ui.dBrisi, QtCore.SIGNAL("clicked()"), self.dBrisi)
        QtCore.QObject.connect(self.ui.pShrani, QtCore.SIGNAL("clicked()"), self.pShrani)
        QtCore.QObject.connect(self.ui.pBrisi, QtCore.SIGNAL("clicked()"), self.pBrisi)
        QtCore.QObject.connect(self.ui.pReset, QtCore.SIGNAL("clicked()"), self.load)
        QtCore.QObject.connect(self.ui.dSlika, QtCore.SIGNAL("clicked()"), self.dslika)
        QtCore.QObject.connect(self.ui.sSlika, QtCore.SIGNAL("clicked()"), self.sslika)
        QtCore.QObject.connect(self.ui.aSlika, QtCore.SIGNAL("clicked()"), self.aslika)
        QtCore.QObject.connect(self.ui.pSlika, QtCore.SIGNAL("clicked()"), self.pslika)
        QtCore.QObject.connect(self.ui.showGui, QtCore.SIGNAL("clicked()"), self.showGui)
        QtCore.QObject.connect(self.ui.timer, QtCore.SIGNAL("timeout()"), self.time)

    def time(self):
        self.ui.datupPrijav.setDateTime(QtCore.QDateTime.currentDateTime())

    def showGui(self):
        self.ui.podatkiDock.show()
        self.ui.delavniceDock.show()
        self.ui.nastavitveDock.show()
        self.ui.skupineDock.show()
        self.ui.animatorjiDock.show()

    def dslika(self):
        fileName = QtGui.QFileDialog().getOpenFileName(self, 'Odpri sliko','',("Images (*.png *.bmp *.jpg *.gif *.tif *.jpeg *.pbm *.pgm *.ppm *.tiff *.xbm *.xpm *.dcx *.eps *.im *.pcd *.pdf *.psd *.tif *.ps);;All Files (*.*)"))
        if fileName:
            buf= io.BytesIO()
            im = Image.open(fileName)
            im.thumbnail((800,600),Image.ANTIALIAS)
            im.save(buf,"PNG")
            data=buf.getvalue()
            qimg = QtGui.QImage.fromData(data)
            qpix = QtGui.QPixmap.fromImage(qimg)
            self.ui.dSlika.setNewPixmap(qpix)
            self.ui.dSlika.data = data
        else:
            self.ui.dSlika.pic = None
            self.ui.dSlika.data = ""
            self.ui.dSlika.setText("     SLIKA     ")



    def sslika(self):
        fileName = QtGui.QFileDialog().getOpenFileName(self, 'Odpri sliko','',("Images (*.png *.bmp *.jpg *.gif *.tif *.jpeg *.pbm *.pgm *.ppm *.tiff *.xmb *.xpm);;All Files (*.*)"))
        if fileName:
            buf= io.BytesIO()
            im = Image.open(fileName)
            im.thumbnail((800,600),Image.ANTIALIAS)
            im.save(buf,"PNG")
            data=buf.getvalue()
            qimg = QtGui.QImage.fromData(data)
            qpix = QtGui.QPixmap.fromImage(qimg)
            self.ui.sSlika.setNewPixmap(qpix)
            self.ui.sSlika.data = data
        else:
            self.ui.sSlika.pic = None
            self.ui.sSlika.data = ""
            self.ui.sSlika.setText("     SLIKA     ")

    def aslika(self):
        fileName = QtGui.QFileDialog().getOpenFileName(self, 'Odpri sliko','',("Images (*.png *.bmp *.jpg *.gif *.tif *.jpeg *.pbm *.pgm *.ppm *.tiff *.xmb *.xpm);;All Files (*.*)"))
        if fileName:
            buf= io.BytesIO()
            im = Image.open(fileName)
            im.thumbnail((800,600),Image.ANTIALIAS)
            im.save(buf,"PNG")
            data=buf.getvalue()
            qimg = QtGui.QImage.fromData(data)
            qpix = QtGui.QPixmap.fromImage(qimg)
            self.ui.aSlika.setNewPixmap(qpix)
            self.ui.aSlika.data = data
        else:
            self.ui.aSlika.pic = None
            self.ui.aSlika.data = ""
            self.ui.aSlika.setText("     SLIKA     ")



    def pslika(self):
        fileName = QtGui.QFileDialog().getOpenFileName(self, 'Odpri sliko','',("Images (*.png *.bmp *.jpg *.gif *.tif *.jpeg *.pbm *.pgm *.ppm *.tiff *.xmb *.xpm);;All Files (*.*)"))
        if fileName:
            buf= io.BytesIO()
            im = Image.open(fileName)
            im.thumbnail((800,600),Image.ANTIALIAS)
            im.save(buf,"PNG")
            data=buf.getvalue()
            qimg = QtGui.QImage.fromData(data)
            qpix = QtGui.QPixmap.fromImage(qimg)
            self.ui.pSlika.setNewPixmap(qpix)
            self.ui.pSlika.data = data
        else:
            self.ui.pSlika.pic = None
            self.ui.pSlika.data = ""
            self.ui.pSlika.setText("     SLIKA     ")


    def skupineKlik(self):
        if len(self.ui.skupine.selectedItems()):
            dat = sendSql("SELECT sid,ime,prostor, opombe,slika FROM skupine WHERE sid={}".format(self.ui.skupine.selectedItems()[0].text(0)))[0]
            self.ui.sid.setValue(dat[0])
            self.ui.skIme.setText(dat[1])
            self.ui.skProstor.setText(dat[2])
            self.ui.sOpombe.setHtml(dat[3])
            data = dat[4]
            if data:
                qimg = QtGui.QImage.fromData(data)
                qpix = QtGui.QPixmap.fromImage(qimg)
                self.ui.sSlika.setNewPixmap(qpix)
                self.ui.sSlika.data=data
                print(self.ui.sSlika.data)
            else:
                self.ui.sSlika.pic = None
                self.ui.sSlika.data = ""
                self.ui.sSlika.setText("     SLIKA     ")

    def delavniceKlik(self):
        if len(self.ui.delavnice.selectedItems()):
            dat = sendSql("SELECT did,ime,max,Min_starost,Max_starost,prostor,vecrat, opombe, slika FROM delavnice WHERE did={}".format(self.ui.delavnice.selectedItems()[0].text(0)))[0]
            self.ui.did.setValue(dat[0])
            self.ui.dIme.setText(dat[1])
            self.ui.dMax.setValue(dat[2])
            self.ui.dOd.setValue(dat[3])
            self.ui.dDo.setValue(dat[4])
            self.ui.dProstor.setText(dat[5])
            self.ui.dVec.setChecked(dat[6])
            self.ui.dOpombe.setHtml(dat[7])
            data = dat[8]
            if data:
                qimg = QtGui.QImage.fromData(data)
                qpix = QtGui.QPixmap.fromImage(qimg)
                self.ui.dSlika.setNewPixmap(qpix)
                self.ui.dSlika.data=data
            else:
                self.ui.dSlika.pic = None
                self.ui.dSlika.data = ""
                self.ui.dSlika.setText("     SLIKA     ")

    def animatorjiKlik(self):
        if len(self.ui.animatorji.selectedItems()):
            dat = sendSql("SELECT a.aid, a.ime, a.priimek, a.opombe, s.ime, d.ime, a.did, a.sid, a.slika FROM animatorji a, skupine s, delavnice d WHERE a.sid = s.sid AND d.did = a.did AND aid={};".format(self.ui.animatorji.selectedItems()[0].text(0)))[0]
            self.ui.aid.setValue(dat[0])
            self.ui.aIme.setText(dat[1])
            self.ui.aPriimek.setText(dat[2])
            self.ui.aOpombe.setHtml(dat[3])
            self.ui.aSkupina.setCurrentIndex(self.ui.aSkupina.findText(dat[4],QtCore.Qt.MatchContains))
            self.ui.aDelavnica.setCurrentIndex(self.ui.aDelavnica.findText(dat[5],QtCore.Qt.MatchContains))
            data = dat[8]
            if data:
                qimg = QtGui.QImage.fromData(data)
                qpix = QtGui.QPixmap.fromImage(qimg)
                self.ui.aSlika.setNewPixmap(qpix)
                self.ui.aSlika.data=data
            else:
                self.ui.aSlika.pic = None
                self.ui.aSlika.data = ""
                self.ui.aSlika.setText("     SLIKA     ")

    def otrociKlik(self):
        if len(self.ui.otroci.selectedItems()):
            dat = sendSql("SELECT o.oid,o.ime,o.priimek,o.starost,o.telefon,o.naslov,o.posta,o.opombe,o.Placano,o.Prijavnica,o.Majica,o.Izlet,o.Bazen,o.Extra,s.ime,o.sid,o.slika FROM otroci o, skupine s WHERE o.sid=s.sid AND oid={};".format(self.ui.otroci.selectedItems()[0].text(0)))[0]
            self.ui.oid.setValue(dat[0])
            self.ui.pIme.setText(dat[1])
            self.ui.pPriimek.setText(dat[2])
            self.ui.pStarost.setValue(int(dat[3]))
            self.ui.pSkupina.setCurrentIndex(self.ui.pSkupina.findText(dat[14],QtCore.Qt.MatchContains))
            self.ui.pPosta.setText(dat[6])
            self.ui.pNaslov.setText(dat[5])
            self.ui.pKontakt.setText(dat[4])
            self.ui.pOpombe.setHtml(dat[7])
            self.ui.pPlacano.setChecked(dat[8])
            self.ui.pPrijavnica.setChecked(dat[9])
            self.ui.pBazen.setChecked(dat[12])
            self.ui.pExtra.setChecked(dat[13])
            self.ui.pMajica.setChecked(dat[10])
            self.ui.pIzlet.setChecked(dat[11])
            data = dat[16]
            if data:
                qimg = QtGui.QImage.fromData(data)
                qpix = QtGui.QPixmap.fromImage(qimg)
                self.ui.pSlika.setNewPixmap(qpix)
                self.ui.pSlika.data=data
            else:
                self.ui.pSlika.pic = None
                self.ui.pSlika.data = ""
                self.ui.pSlika.setText("     SLIKA     ")

    def sShrani(self):
        imgF = self.ui.sSlika.data
        if self.ui.sid.value() == 0:
            x = sendSql("SELECT MAX(sid) FROM skupine;")
            self.ui.sid.setValue(x[0][0]+1)
        sid = self.ui.sid.value()
        cur = sendSql("SELECT EXISTS(Select 1 from skupine WHERE sid = {});".format(self.ui.sid.value()))
        if cur[0][0] == 1 and len(self.ui.skupine.selectedItems()):
            sendSql("UPDATE skupine SET sid = '{}', ime = '{}', prostor = '{}', opombe = '{}' WHERE sid = '{}';".format(self.ui.sid.value(),self.ui.skIme.text(),self.ui.skProstor.text(),self.ui.sOpombe.toPlainText(),self.ui.sid.value()))
        else:
            sendSql("INSERT INTO skupine (sid, ime, prostor, opombe) VALUES ('{}','{}','{}','{}');".format(self.ui.sid.value(),self.ui.skIme.text(),self.ui.skProstor.text(),self.ui.sOpombe.toPlainText()))
        sendSql("UPDATE skupine SET `slika`=? WHERE `sid`='{}'".format(sid),0,0,imgF)

    def sBrisi(self):
        cur = sendSql("SELECT EXISTS(Select 1 from skupine WHERE sid = {});".format(self.ui.sid.value()))
        if cur[0][0] == 1 and len(self.ui.skupine.selectedItems()):
            sendSql("DELETE FROM skupine WHERE sid = {}".format(self.ui.sid.value()))
        else:
            QtGui.QMessageBox.information(None, "Prekinjeno", "SID ne obstaja, ali nič ni izbrano")

    def aShrani(self):
        imgF = self.ui.aSlika.data
        if self.ui.aid.value() == 0:
            x = sendSql("SELECT MAX(aid) FROM animatorji;")
            self.ui.aid.setValue(x[0][0]+1)
        aid = self.ui.aid.value()
        cur = sendSql("SELECT EXISTS(Select 1 from animatorji WHERE aid = {});".format(self.ui.aid.value()))
        if cur[0][0] == 1 and len(self.ui.animatorji.selectedItems()):
            sendSql("UPDATE animatorji SET aid = '{}', ime = '{}', priimek = '{}', sid = '{}', did = '{}', opombe = '{}' WHERE aid = '{}';".format(self.ui.aid.value(),self.ui.aIme.text(),self.ui.aPriimek.text(),self.ui.aSkupina.currentText()[0:self.ui.aSkupina.currentText().find(".")],self.ui.aDelavnica.currentText()[0:self.ui.aDelavnica.currentText().find(".")],self.ui.aOpombe.toPlainText(),self.ui.aid.value()))
        else:
            sendSql("INSERT INTO animatorji(aid,ime,priimek,sid,did,opombe) VALUES ('{}','{}','{}','{}','{}','{}');".format(self.ui.aid.value(),self.ui.aIme.text(),self.ui.aPriimek.text(),self.ui.aSkupina.currentIndex(),self.ui.aDelavnica.currentIndex(),self.ui.aOpombe.toPlainText()))
        sendSql("UPDATE animatorji SET `slika`=? WHERE `aid`='{}'".format(aid),0,0,imgF)

    def aBrisi(self):
        cur = sendSql("SELECT EXISTS(Select 1 from animatorji WHERE aid = {});".format(self.ui.aid.value()))
        if cur[0][0] == 1 and len(self.ui.animatorji.selectedItems()):
            sendSql("DELETE FROM animatorji WHERE aid = {};".format(self.ui.aid.value()))
        else:
            QtGui.QMessageBox.information(None, "Prekinjeno", "AID ne obstaja, ali nič ni izbrano")

    def dShrani(self):
        imgF = self.ui.dSlika.data
        if self.ui.did.value() == 0:
            x = sendSql("SELECT MAX(did) FROM delavnice;")
            self.ui.did.setValue(x[0][0]+1)
        did = self.ui.did.value()
        cur = sendSql("SELECT EXISTS(Select 1 from delavnice WHERE did = {});".format(self.ui.did.value()))
        if cur[0][0] == 1 and len(self.ui.delavnice.selectedItems()):
            sendSql("UPDATE delavnice SET `did`='{}', `ime`='{}', `max`='{}', `Min_starost`='{}', `Max_starost`='{}', `vecrat`='{}', `prostor`='{}', `opombe`='{}' WHERE `did`='{}';".format(self.ui.did.value(),self.ui.dIme.text(),self.ui.dMax.value(),self.ui.dOd.value(),self.ui.dDo.value(),int(self.ui.dVec.isChecked()),self.ui.dProstor.text(),self.ui.dOpombe.toPlainText(),self.ui.did.value()))
        else:
            sendSql("INSERT INTO delavnice (`did`, `ime`, `max`, `Min_starost`, `Max_starost`, `vecrat`, `prostor`, `opombe`) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');".format(self.ui.did.value(),self.ui.dIme.text(),self.ui.dMax.value(),self.ui.dOd.value(),self.ui.dDo.value(),int(self.ui.dVec.isChecked()),self.ui.dProstor.text(),self.ui.dOpombe.toPlainText()))
        sendSql("UPDATE delavnice SET `slika`=? WHERE `did`='{}'".format(did),0,0,imgF)

    def dBrisi(self):
        cur = sendSql("SELECT EXISTS(Select 1 from delavnice WHERE did = {});".format(self.ui.did.value()))
        if cur[0][0] == 1 and len(self.ui.delavnice.selectedItems()):
            sendSql("DELETE FROM delavnice WHERE did = {};".format(self.ui.did.value()))
        else:
            QtGui.QMessageBox.information(None, "Prekinjeno", "DID ne obstaja, ali nič ni izbrano")

    def pShrani(self):
        imgF = self.ui.pSlika.data
        if self.ui.oid.value() == 0:
            x = sendSql("SELECT MAX(oid) FROM otroci;")
            self.ui.oid.setValue(x[0][0]+1)
        oid = self.ui.oid.value()
        cur = sendSql("SELECT EXISTS(Select 1 from otroci WHERE oid = {});".format(self.ui.oid.value()))
        if cur[0][0] == 1 and len(self.ui.otroci.selectedItems()):
            sendSql("UPDATE otroci SET `oid`='{}', `Ime`='{}', `priimek`='{}', `starost`='{}', `telefon`='{}', `naslov`='{}', `posta`='{}', `opombe`='{}', `Placano`='{}', `Prijavnica`='{}', `Majica`='{}', `Izlet`='{}', `Bazen`='{}', `Extra`='{}', `sid`='{}' WHERE `oid`='{}';".format(self.ui.oid.value(),self.ui.pIme.text(),self.ui.pPriimek.text(),self.ui.pStarost.value(),self.ui.pKontakt.text(),self.ui.pNaslov.text(),self.ui.pPosta.text(),self.ui.pOpombe.toPlainText(),int(self.ui.pPlacano.isChecked()),int(self.ui.pPrijavnica.isChecked()),int(self.ui.pMajica.isChecked()),int(self.ui.pIzlet.isChecked()),int(self.ui.pBazen.isChecked()),int(self.ui.pExtra.isChecked()),self.ui.pSkupina.currentText()[0:self.ui.pSkupina.currentText().find(".")],self.ui.oid.value()))
        else:
            sendSql("INSERT INTO otroci (`oid`, `Ime`, `priimek`, `starost`, `telefon`, `naslov`, `posta`, `opombe`, `Placano`, `Prijavnica`, `Majica`, `Izlet`, `Bazen`, `Extra`, `sid`) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');".format(self.ui.oid.value(),self.ui.pIme.text(),self.ui.pPriimek.text(),self.ui.pStarost.value(),self.ui.pKontakt.text(),self.ui.pNaslov.text(),self.ui.pPosta.text(),self.ui.pOpombe.toPlainText(),int(self.ui.pPlacano.isChecked()),int(self.ui.pPrijavnica.isChecked()),int(self.ui.pMajica.isChecked()),int(self.ui.pIzlet.isChecked()),int(self.ui.pBazen.isChecked()),int(self.ui.pExtra.isChecked()),self.ui.pSkupina.currentIndex()))
        sendSql("UPDATE otroci SET `slika`=? WHERE `oid`='{}'".format(oid),0,0,imgF)

    def pBrisi(self):
        cur = sendSql("SELECT EXISTS(Select 1 from otroci WHERE oid = {});".format(self.ui.oid.value()))
        if cur[0][0] == 1 and len(self.ui.otroci.selectedItems()):
            sendSql("DELETE FROM otroci WHERE oid = {};".format(self.ui.oid.value()))
        else:
            QtGui.QMessageBox.information(None, "Prekinjeno", "OID ne obstaja, ali nič ni izbrano")

    def load(self):
        self.ui.datupPrijav.setDateTime(QtCore.QDateTime.currentDateTime())
        self.ui.aSkupina.clear()
        self.ui.pSkupina.clear()
        self.ui.skupine.clear()
        self.ui.aSkupina.addItem("")
        self.ui.pSkupina.addItem("")
        self.ui.skupine.setHeaderLabels(["sid","ime","prostor", "opombe"])
        cur = sendSql("SELECT sid,ime,prostor, opombe, slika FROM skupine ORDER BY sid ASC;")
        for i in cur:
            skupine_list = TreeWidgetItem(self.ui.skupine)
            self.ui.aSkupina.addItem(str(i[0])+".) "+i[1])
            self.ui.pSkupina.addItem(str(i[0])+".) "+i[1])
            for j in range(len(i)):
                img_tag = ""
                if j==len(i)-1 and i[j]:
                    qimg = QtGui.QImage.fromData(i[j])
                    qpix = QtGui.QPixmap.fromImage(qimg)
                    icon = QtGui.QIcon(qpix)
                    skupine_list.setIcon(0,icon)
                    self.ui.aSkupina.setItemIcon(self.ui.aSkupina.count()-1,icon)
                    self.ui.pSkupina.setItemIcon(self.ui.pSkupina.count()-1,icon)
                    data_uri = str(base64.encodebytes(i[j]) , "utf8").replace("\n", "")
                    img_tag = '<p><img alt="sample" src="data:image/png;base64,{}">'.format(data_uri)
                if not i[3]:
                    i[3]=""
                for x in range(self.ui.animatorji.columnCount()):
                    skupine_list.setToolTip(x,i[3]+img_tag)
                skupine_list.setText(j,str(i[j]))
        for i in range(self.ui.skupine.columnCount()):
            self.ui.skupine.resizeColumnToContents(i)

        self.ui.delavnice.clear()
        self.ui.izborDelavnice.clear()
        self.ui.aDelavnica.clear()
        self.ui.izborDelavnice.addItem("")
        self.ui.aDelavnica.addItem("")
        self.ui.delavnice.setHeaderLabels(["did","ime","max","Min_starost","Max_starost","prostor","vecrat", "opombe"])
        cur = sendSql("SELECT did,ime,max,Min_starost,Max_starost,prostor,vecrat,opombe,slika FROM delavnice ORDER BY did ASC;")
        for i in cur:
            delavnice_list = TreeWidgetItem(self.ui.delavnice)
            self.ui.izborDelavnice.addItem(str(i[0])+".) "+i[1])
            self.ui.aDelavnica.addItem(str(i[0])+".) "+i[1])
            for j in range(len(i)):
                img_tag = ""
                if j==len(i)-1 and i[j]:
                    qimg = QtGui.QImage.fromData(i[j])
                    qpix = QtGui.QPixmap.fromImage(qimg)
                    icon = QtGui.QIcon(qpix)
                    delavnice_list.setIcon(0,icon)
                    self.ui.izborDelavnice.setItemIcon(self.ui.izborDelavnice.count()-1,icon)
                    self.ui.aDelavnica.setItemIcon(self.ui.aDelavnica.count()-1,icon)
                    data_uri = str(base64.encodebytes(i[j]) , "utf8").replace("\n", "")
                    img_tag = '<p><img alt="sample" src="data:image/png;base64,{}">'.format(data_uri)
                if not i[7]:
                    i[7]=""
                for x in range(self.ui.animatorji.columnCount()):
                    delavnice_list.setToolTip(x,i[7]+img_tag)
                delavnice_list.setText(j,str(i[j]))
        for i in range(self.ui.delavnice.columnCount()):
            self.ui.delavnice.resizeColumnToContents(i)

        self.ui.animatorji.clear()
        self.ui.animatorji.setHeaderLabels(["aid","ime", "priimek", "sid", "did", "opombe"])
        cur = sendSql("SELECT aid,ime, priimek, sid, did, opombe, slika FROM animatorji ORDER BY aid ASC;")
        for i in cur:
            animatorji_list = TreeWidgetItem(self.ui.animatorji)
            for j in range(len(i)):
                img_tag = ""
                if j==len(i)-1 and i[j]:
                    qimg = QtGui.QImage.fromData(i[j])
                    qpix = QtGui.QPixmap.fromImage(qimg)
                    animatorji_list.setIcon(0,QtGui.QIcon(qpix))
                    data_uri = str(base64.encodebytes(i[j]) , "utf8").replace("\n", "")
                    img_tag = '<p><img alt="sample" src="data:image/png;base64,{}">'.format(data_uri)
                if not i[5]:
                    i[5]=""
                for x in range(self.ui.animatorji.columnCount()):
                    animatorji_list.setToolTip(x,i[5]+img_tag)
                animatorji_list.setText(j,str(i[j]))
        for i in range(self.ui.animatorji.columnCount()):
            self.ui.animatorji.resizeColumnToContents(i)

        self.ui.otroci.clear()
        self.ui.otroci.setHeaderLabels(["oid","ime","priimek","starost","telefon","naslov","posta","opombe","Placano","Prijavnica","Majica","Izlet","Bazen","Extra","sid"])
        cur = sendSql("SELECT oid,ime,priimek,starost,telefon,naslov,posta,opombe,Placano,Prijavnica,Majica,Izlet,Bazen,Extra,sid,slika FROM otroci ORDER BY oid ASC;")
        for i in cur:
            otroci_list = TreeWidgetItem(self.ui.otroci)
            for j in range(len(i)):
                img_tag = ""
                if j==len(i)-1 and i[j]:
                    qimg = QtGui.QImage.fromData(i[j])
                    qpix = QtGui.QPixmap.fromImage(qimg)
                    otroci_list.setIcon(0,QtGui.QIcon(qpix))
                    data_uri = str(base64.encodebytes(i[j]) , "utf8").replace("\n", "")
                    img_tag = '<p><img alt="sample" src="data:image/png;base64,{}">'.format(data_uri)
                if not i[7]:
                    i[7]=""
                for x in range(self.ui.animatorji.columnCount()):
                    otroci_list.setToolTip(x,i[7]+img_tag)
                otroci_list.setText(j,str(i[j]))
        for i in range(self.ui.otroci.columnCount()):
            self.ui.otroci.resizeColumnToContents(i)

        self.ui.skIme.setText("")
        self.ui.skProstor.setText("")
        self.ui.sid.setValue(0)
        self.ui.sOpombe.setHtml("")
        self.ui.dIme.setText("")
        self.ui.dMax.setValue(0)
        self.ui.dOd.setValue(0)
        self.ui.dDo.setValue(0)
        self.ui.dProstor.setText("")
        self.ui.dVec.setChecked(0)
        self.ui.did.setValue(0)
        self.ui.dOpombe.setHtml("")
        self.ui.aIme.setText("")
        self.ui.aPriimek.setText("")
        self.ui.aid.setValue(0)
        self.ui.aSkupina.setCurrentIndex(0)
        self.ui.aDelavnica.setCurrentIndex(0)
        self.ui.aOpombe.setHtml("")
        self.ui.oid.setValue(0)
        self.ui.pIme.setText("")
        self.ui.pPriimek.setText("")
        self.ui.pStarost.setValue(0)
        self.ui.pSkupina.setCurrentIndex(0)
        self.ui.pPosta.setText("")
        self.ui.pNaslov.setText("")
        self.ui.pKontakt.setText("")
        self.ui.pOpombe.setHtml("")
        self.ui.pPlacano.setChecked(0)
        self.ui.pPrijavnica.setChecked(0)
        self.ui.pBazen.setChecked(0)
        self.ui.pExtra.setChecked(0)
        self.ui.pMajica.setChecked(0)
        self.ui.pIzlet.setChecked(0)

        self.ui.dSlika.pic = None
        self.ui.dSlika.data = ""
        self.ui.dSlika.setText("     SLIKA     ")

        self.ui.aSlika.pic = None
        self.ui.aSlika.data = ""
        self.ui.aSlika.setText("     SLIKA     ")

        self.ui.sSlika.pic = None
        self.ui.sSlika.data = ""
        self.ui.sSlika.setText("     SLIKA     ")

        self.ui.pSlika.pic = None
        self.ui.pSlika.data = ""
        self.ui.pSlika.setText("     SLIKA     ")


def sendSql(cmd,safe=1,out=1,file=None):
    startT = time.time()
    if file != None:
        f = None
        if type(file) == bytes or type(file) == bytearray:
            f = pyodbc.Binary(file)
        cur.execute(cmd,f)
        myapp.load()
        return
    x = []
    if not cmd.startswith("SELECT") and safe:
        reply = QtGui.QMessageBox.warning(None, 'Izvaja se sprememba ali brisanje!',"Ukaz: {}.\nAli želite nadeljevati?".format(cmd), QtGui.QMessageBox.Yes |QtGui.QMessageBox.No, QtGui.QMessageBox.No)
        if reply == QtGui.QMessageBox.Yes:
            cur.execute(cmd)
            myapp.load()
        else:
            QtGui.QMessageBox.information(None, "Prekinjeno", "Ukaz je prekinjen")
            return
    else:
        cur.execute(cmd)
        x = cur.fetchall()
    if out:
        print(cmd)
        print("Sql query time: {}".format(time.time()-startT))
    return x



def toExcell(file, data, collumnames=[]):
    xlApp = win32com.client.Dispatch("Excel.Application")
    xlApp.Visible=1

    f = open("{}\{}.xls".format(os.path.dirname(sys.argv[0]),file),'w')
    f.close()

    workBook = xlApp.Workbooks.Open(r"{}\{}.xls".format(os.path.dirname(sys.argv[0]),file))
    for i in range(1,len(collumnames)+1):
        workBook.ActiveSheet.Cells(1,i).Value = str(collumnames[i-1])

    for i in range(len(data)):
        for j in range(len(data[i])):
            workBook.ActiveSheet.Cells(i+2,j+1).Value = str(data[i][j])

    #workBook.ActiveSheet.Cells(1, 1).Value = "hello"
    #workBook.Close(SaveChanges=1)
    #print(str(workBook.ActiveSheet.Cells(1,1)))
    #xlApp.Quit()


app = QtGui.QApplication(sys.argv)
myapp = MyForm()
myapp.show()
dlg = myapp.ui
myapp.load()
app.setWindowIcon(QtGui.QIcon('logotip.ico'))
print("Load time:{}s".format(time.time()-x))
sys.exit(app.exec_())