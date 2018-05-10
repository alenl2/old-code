from PyQt4 import QtGui ,QtCore

class TreeWidgetItem(QtGui.QTreeWidgetItem):
    def __init__(self, parent=None):
        QtGui.QTreeWidgetItem.__init__(self, parent)
        self.pic = None
    def __lt__(self, otherItem):
        column = self.treeWidget().sortColumn()
        try:
            return float( self.text(column) ) > float( otherItem.text(column) )
        except ValueError:
            return self.text(column) > otherItem.text(column)


class Label(QtGui.QLabel):
    def __init__(self, parent):
        self.pic = None
        self.data = ""
        return QtGui.QLabel.__init__(self, parent)

    def mouseReleaseEvent(self, ev):
        self.emit(QtCore.SIGNAL('clicked()'))

    def resizeEvent(self, event=None):
        QtGui.QLabel.resizeEvent(self, event)
        if self.pic:
            x = self.pic.scaled(event.size(),QtCore.Qt.KeepAspectRatio)
            self.setPixmap(x)

    def setNewPixmap(self, Pixmap):
        self.pic = Pixmap
        self.setPixmap(Pixmap.scaledToHeight(self.size().height()))