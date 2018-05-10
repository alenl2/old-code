import pyodbc
from PyQt4.QtCore import *
from PyQt4.QtGui import *

app=QApplication([])
widget = QDialog()
widget.setWindowTitle("Gostota populacije")
widget.setLayout(QVBoxLayout())
widget.layout().setMargin(2)
widget.scene = QGraphicsScene(widget)
widget.scene.setBackgroundBrush(Qt.white)
widget.view = QGraphicsView(widget.scene, widget)
widget.view.setAlignment(Qt.AlignLeft | Qt.AlignTop)
widget.view.setSizePolicy(QSizePolicy.MinimumExpanding, QSizePolicy.MinimumExpanding)
widget.view.setRenderHints(QPainter.Antialiasing | QPainter.SmoothPixmapTransform)
widget.layout().addWidget(widget.view)
widget.resize(800, 800)
widget.scene.setSceneRect(0, 0, widget.view.width(), widget.view.height())
widget.view.setSceneRect(0, 0, widget.view.width(), widget.view.height())
widget.show()
widget.raise_()
grad = QRadialGradient()
grad.setColorAt(0,QColor(0,46,180,100))
grad.setColorAt(1,QColor(0,46,180,0))

conn = pyodbc.connect('Driver={MySQL ODBC 5.1 Driver};Server=127.0.0.1;Port=3306;Database=seminarska;User=seminarskadb; Password=seminarska;Option=3;')
cur = conn.cursor()
cur.execute("DROP TABLE IF EXISTS gostote;")
cur.execute("CREATE TABLE gostote(topAid INT REFERENCES aliansa(aid), x INT, y INT, gostota FLOAT);")
for x in range(-400,410,10):
    for y in range(-400,410,10):
        cur.execute("SELECT stIgralcev("+str(x)+","+str(y)+");")
        p = cur.fetchone()[0]
        if p:
            cur.execute("SELECT aid, SUM(population)/100 FROM naselje NATURAL JOIN igralec NATURAL JOIN aliansa WHERE (x BETWEEN "+str(x)+" AND "+str(x+9)+") AND (y BETWEEN "+str(y)+" AND "+str(y+9)+") GROUP BY aid ORDER BY SUM(population) DESC LIMIT 0,1;")
            cur.execute("INSERT INTO gostote(gostota,x,y,topAid) VALUES ("+str(p/100)+", "+str(x)+", "+str(y)+", "+str(cur.fetchone()[0])+");")
            p /= 700
            grad.setRadius(p)
            elipsa = widget.scene.addEllipse(-p, -p, 2*p, 2*p, QPen(QBrush(Qt.transparent), 1),QBrush(grad))
            elipsa.setPos(x+400.5, y+400.5)
    widget.scene.update()
    qApp.processEvents()
cur.close()
conn.commit()
conn.close()
app.exec_()