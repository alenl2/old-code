#TO JE MOJA IGRICA ZA 10 :)
from math import sin, radians, sqrt, atan, degrees
from time import sleep
from random import randint
from PyQt4.QtCore import *
from PyQt4.QtGui import *

class QGraphicsViewWMouse(QGraphicsView):
    def __init__(self, *args, **kw):
        super(QGraphicsViewWMouse, self).__init__(*args, **kw)
        self.setMouseTracking(True)

    def mouseMoveEvent(self, ev):
        global miska # Takole se programirajo samo zasilni moduli za Programiranje 1!!!
        miska = ev.x(), ev.y()
        super(QGraphicsViewWMouse, self).mouseMoveEvent(ev)

    def mousePressEvent(self, ev):
        global miska, klik # Takole se programirajo samo zasilni moduli za Programiranje 1!!!
        miska = ev.x(), ev.y()
        klik = True
        super(QGraphicsViewWMouse, self).mousePressEvent(ev)

app=QApplication([])
widget = QDialog()
widget.setWindowTitle("THE GAME")
widget.setLayout(QVBoxLayout())
widget.layout().setMargin(2)
widget.scene = QGraphicsScene(widget)
widget.scene.setBackgroundBrush(Qt.black)
widget.view = QGraphicsViewWMouse(widget.scene, widget)
widget.view.setAlignment(Qt.AlignLeft | Qt.AlignTop)
widget.view.setSizePolicy(QSizePolicy.MinimumExpanding, QSizePolicy.MinimumExpanding)
widget.view.setRenderHints(QPainter.Antialiasing | QPainter.SmoothPixmapTransform)
widget.layout().addWidget(widget.view)
widget.resize(1280, 720)
widget.scene.setSceneRect(0, 0, widget.view.width(), widget.view.height())
widget.view.setSceneRect(0, 0, widget.view.width(), widget.view.height())
widget.show()
widget.raise_()
maxX = widget.view.width()
maxY = widget.view.height()
miska = maxX/2, maxY/2
klik = False

def obnovi():
    widget.scene.update()
    qApp.processEvents()

def krog(x, y, r, barva=Qt.white, sirina=1):
    elipsa = widget.scene.addEllipse(-r, -r, 2*r, 2*r, QPen(QBrush(barva), sirina))
    elipsa.setPos(x, y)
    return elipsa

def besedilo(x, y, txt, barva=Qt.white, velikost=20, pisava="Arial"):
    font = QFont(pisava)
    font.setPixelSize(velikost)
    txt = widget.scene.addText(txt, font)
    txt.setPos(x, y)
    txt.setDefaultTextColor(barva)
    return txt

def moveK(k):
    y = sin(radians(k[1]))*k[3]/1000
    x = sin(radians(90)-radians(k[1]))*k[3]/1000
    k[0].moveBy(x,y)
    if k[0].x()+k[2] >= maxX or k[0].x()-k[2] <= 0:
        k[1] = k[1]+180-(2*k[1])
    if k[0].y()+k[2] >= maxY or k[0].y()-k[2] <= 0:
        k[1] = k[1]+360-(2*k[1])
    while k[1] > 360:
        k[1] -= 360

def makeBalls(n):
    z = []
    while not len(z) == n:
        ne = False
        r = randint(15,30)
        x,y,b,s,a,t,e = randint(r,maxX-r),randint(r,maxY-r),QColor(randint(0,255),randint(0,255),randint(0,255)),randint(400,1000),randint(0,360),randint(500,1000),randint(30,50)
        for i in z:
            if sqrt(((x-i[0].x()))**2 + ((y-i[0].y()))**2) <= i[2]+r:
                ne = True
        if not ne:
            z.append([krog(x,y,r,b),a,r,s,0,b,t,e])#krog,kot,radij,hitrost,counter za timeout,barvo,timeout,raširjena velikost
    return z

def CircleCollide(C1,C2):
    XDiff = -(C1[0].x()-C2[0].x())
    YDiff = -(C1[0].y()-C2[0].y())
    if XDiff > 0:
        if YDiff > 0: Angle = degrees(atan(YDiff/XDiff))
        elif YDiff < 0: Angle = degrees(atan(YDiff/XDiff))
    elif XDiff < 0:
        if YDiff > 0: Angle = 180 + degrees(atan(YDiff/XDiff))
        elif YDiff < 0: Angle = -180 + degrees(atan(YDiff/XDiff))
    elif XDiff == 0:
        if YDiff > 0: Angle = -90
        else: Angle = 90
    elif YDiff == 0:
        if XDiff < 0:  Angle = 0
        else: Angle = 180
    if C1[0].x()+C1[2] >= maxX or C1[0].x()-C1[2] <= 0:
        return C1[1]
    if C1[0].y()+C1[2] >= maxY or C1[0].y()-C1[2] <= 0:
        return C1[1]
    return Angle+180

def round(ballNum,niv,pot):
    pocCou = 0
    status = besedilo(10,10,"Počenih je {} od {}. Nivo: {} Za naslednjega {}".format(pocCou,ballNum,niv,pot),velikost=20)
    balls = makeBalls(ballNum)
    r = randint(30,50)
    stoped = [[krog(maxX/2, maxY/2, r),0,r,0,0,0,1000,0]]
    while True:
        cou = 0
        for ball in balls:
            moveK(ball)
            if not klik and sqrt(((ball[0].x()-stoped[0][0].x()))**2 + ((ball[0].y()-stoped[0][0].y()))**2) <= stoped[0][2]+ball[2]:
                ball[1] = CircleCollide(ball,stoped[0])
            for sBall in stoped:
                if sqrt(((ball[0].x()-sBall[0].x()))**2 + ((ball[0].y()-sBall[0].y()))**2) <= sBall[2]+ball[2] and klik:
                    status.setPlainText("Počenih je {} od {}. Nivo: {} Za naslednjega {}".format(pocCou+1,ballNum,niv,pot))
                    ball[0].setBrush(QBrush(ball[5]))
                    pocCou += 1
                    nrad,x,y = ball[7],ball[0].x(),ball[0].y()
                    ball[0].setRect(-nrad,-nrad,2*nrad,2*nrad)
                    ball[0].setPos(x,y)
                    ball[2] = nrad
                    stoped.append(balls[cou])
                    del balls[cou]
                    break
            cou += 1
            for ball2 in balls:
                if sqrt(((ball[0].x()-ball2[0].x()))**2 + ((ball[0].y()-ball2[0].y()))**2) <= ball2[2]+ball[2] and ball2 != ball:
                    ball[1] = CircleCollide(ball,ball2)
        cou = 0
        for sBall in stoped:
            if sBall[4] >= sBall[6] and klik:
                del stoped[cou]
                sBall[0].hide()
                break
            cou += 1
            if klik: sBall[4] += 1
        if klik and stoped == []:
            bes = besedilo(maxX/2-100,maxY/2-20,"Počenih je {} od potrebnih {}".format(pocCou,pot))
            obnovi()
            sleep(2)
            for ball in balls: ball[0].hide()
            for sBall in stoped: sBall[0].hide()
            status.hide()
            bes.hide()
            return pocCou
        if not klik:
            stoped[0][0].setX(miska[0])
            stoped[0][0].setY(miska[1])
            s = False
        else:
            if not s:
                stoped[0][0].setBrush(QBrush(Qt.white))
                s = True
        obnovi()

x = 1
for i in range(1,11):
    balls = i*10
    score = 0
    while score < x:
        score = round(balls,i,x)
        klik = False
        if score < x:
            bes = besedilo(maxX/2-100,maxY/2-20,"POISKUSI ZNOVA")
            while not klik: obnovi()
            bes.hide()
        klik = False
    if i == 10:
        bes = besedilo(maxX/2-100,maxY/2-20,"BRAVO!",velikost=50)
        obnovi()
        sleep(5)
        break
    x = randint(balls-5,balls)
    bes = besedilo(maxX/2-100,maxY/2-20,"Nivo: {} za naslednjega {}".format(i+1,x))
    while not klik: obnovi()
    bes.hide()
    klik = False