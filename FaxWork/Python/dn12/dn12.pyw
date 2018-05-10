from PyQt4 import QtCore, QtGui, uic

app = QtGui.QApplication([])
dlg = uic.loadUi("dn12.ui")

def replace_line(file_name, line_num, text):
    lines = open(file_name, 'r').readlines()
    lines[line_num] = text
    out = open(file_name, 'w')
    out.writelines(lines)
    out.close()

def beri():
    sez = []
    d = open("kon","r",-1,"utf8")
    for i in d:
        sez.append(i.strip("\n"))
    d.close()
    return sez

def isci():
    cou = 0
    dlg.treeWidget.clear()
    for i in beri():
        if i.lower().startswith(dlg.iskal.text().replace(" ","\t").lower()):
            i = i.split("\t")
            a = QtGui.QTreeWidgetItem(dlg.treeWidget)
            for x in range(4):
                a.setText(x, i[x])
        cou += 1

def shrani():
    if dlg.treeWidget.selectedItems():
        reply = QtGui.QMessageBox.question(None, 'Message',"Ali želite posodobiti kontakt?", QtGui.QMessageBox.Yes |QtGui.QMessageBox.No, QtGui.QMessageBox.No)
        if reply == QtGui.QMessageBox.Yes:
            cou = 0
            for x in beri():
                s = ""
                for r in range(4):
                    s += dlg.treeWidget.currentItem().text(r)+"\t"
                s = s[0:len(s)-1]
                if x == s:
                    replace_line("kon",cou,dlg.imeBox.text() +"\t"+ dlg.priimekBox.text() +"\t"+ dlg.telBox.text() +"\t"+ dlg.emailBox.text()+"\n")
                cou +=1
            QtGui.QMessageBox.information(None, "Shranjeno", "Shranjeno")
        else:
            QtGui.QMessageBox.critical(None, "Napaka", "Ni shranjeno")
    else:
        if dlg.imeBox.text() != "":
            f = open("kon", "a", -1, "utf-8")
            f.write(dlg.imeBox.text() +"\t"+ dlg.priimekBox.text() +"\t"+ dlg.telBox.text() +"\t"+ dlg.emailBox.text()+"\n")
            QtGui.QMessageBox.information(None, "Shranjeno", "Shranjeno")
            f.close()
        else:
            QtGui.QMessageBox.critical(None, "Napaka", "Prosim vnesi ime")
    update()

def izberi():
    dat = []
    for i in range(4):
        dat.append(dlg.treeWidget.currentItem().text(i))
    dlg.imeBox.setText(dat[0])
    dlg.priimekBox.setText(dat[1])
    dlg.telBox.setText(dat[2])
    dlg.emailBox.setText(dat[3])

def update():
    dlg.treeWidget.clear()
    for i in beri():
        i = i.split("\t")
        a = QtGui.QTreeWidgetItem(dlg.treeWidget)
        for x in range(4):
            a.setText(x, i[x])
    dlg.imeBox.setText("")
    dlg.priimekBox.setText("")
    dlg.telBox.setText("")
    dlg.emailBox.setText("")



QtCore.QObject.connect(dlg.reset, QtCore.SIGNAL("clicked()"), update)
QtCore.QObject.connect(dlg.iskal, QtCore.SIGNAL("returnPressed()"), isci)
QtCore.QObject.connect(dlg.shrani, QtCore.SIGNAL("clicked()"), shrani)
QtCore.QObject.connect(dlg.isci, QtCore.SIGNAL("clicked()"), isci)
QtCore.QObject.connect(dlg.treeWidget, QtCore.SIGNAL("itemSelectionChanged()"), izberi)
update()
dlg.show()
app.exec()
