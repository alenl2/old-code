from PyQt4.QtGui import *
from PyQt4.QtCore import *
from PIL import Image
import sys
import io

app = QApplication(sys.argv)
window = QWidget()


layout = QGridLayout(window)

button = QLabel()
button.setPixmap(QPixmap.fromImage(qimg))

layout.addWidget(button)
window.show()
sys.exit(app.exec_())