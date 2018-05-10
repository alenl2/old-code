#include "oratorij.h"
#include "ui_oratorij.h"
#include <QDebug>
#include <QtSql>
#include <QtCore>
#include <QFileDialog>
#include <QCloseEvent>

Oratorij::Oratorij(QWidget *parent) :QMainWindow(parent),ui(new Ui::Oratorij)
{
    //QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    //db.setDatabaseName("Oratorij.db");
    //db.open();
    QSqlDatabase db=QSqlDatabase::addDatabase("QODBC3");
    db.setHostName("localhost");
    db.setDatabaseName("MySql");
    db.setPort(3306);
    db.setUserName("root");
    db.setPassword("");

    if(!db.open())
    {
        qDebug()<<db.lastError();
    }

    ui->setupUi(this);
    RestoreState();
    QTimer *timer = new QTimer(this);
    timer->setInterval(1000);
    timer->start();
    TimeOut();
    on_pReset_clicked();
    connect(timer, SIGNAL(timeout()),this,SLOT(TimeOut()));
}

Oratorij::~Oratorij()
{
    delete ui;
}

void Oratorij::TimeOut(){
    ui->datupPrijav->setDateTime(QDateTime::currentDateTime());
}

void Oratorij::on_delavnice_currentItemChanged(QTreeWidgetItem *current, QTreeWidgetItem *previous)
{
    if(ui->delavnice->selectedItems().count()>0){
        QSqlQuery query;
        query.exec(QString("SELECT did,ime,max,minAge,maxAge,veckrat,prostor,opombe,slika FROM delavnice WHERE did=%1").arg(current->text(0)));
        query.next();
        ui->did->setValue(query.value(0).toInt());
        ui->dIme->setText(query.value(1).toString());
        ui->dMax->setValue(query.value(2).toInt());
        ui->dOd->setValue(query.value(3).toInt());
        ui->dDo->setValue(query.value(4).toInt());
        ui->dVec->setChecked(query.value(5).toBool());
        ui->dProstor->setText(query.value(6).toString());
        ui->dOpombe->setHtml(query.value(7).toString());
        QPixmap pixmap;
        pixmap.loadFromData(query.value(8).toByteArray());
        if (!pixmap.size().isNull()){
            ui->dSlika->setIconSize(QSize(ui->dSlika->width()-10, ui->dSlika->height()-10));
            ui->dSlika->setIcon(QIcon(pixmap));
            ui->dSlika->setText("");
            ui->dSlika->setData(pixmap);
        } else {
            ui->dSlika->setIcon(QIcon());
            ui->dSlika->setText("Slika");
            ui->dSlika->setData(QPixmap());
        }
    }
}

void Oratorij::on_skupine_currentItemChanged(QTreeWidgetItem *current, QTreeWidgetItem *previous)
{
    if(ui->skupine->selectedItems().count()>0){
        QSqlQuery query;
        query.exec(QString("SELECT sid,ime,prostor,opombe,slika FROM skupine WHERE sid=%1").arg(current->text(0)));
        query.next();
        ui->sid->setValue(query.value(0).toInt());
        ui->skIme->setText(query.value(1).toString());
        ui->skProstor->setText(query.value(2).toString());
        ui->sOpombe->setHtml(query.value(3).toString());
        QPixmap pixmap;
        pixmap.loadFromData(query.value(4).toByteArray());
        if (!pixmap.size().isNull()){
            ui->sSlika->setIconSize(QSize(ui->sSlika->width()-10, ui->sSlika->height()-10));
            ui->sSlika->setIcon(QIcon(pixmap));
            ui->sSlika->setText("");
            ui->sSlika->setData(pixmap);
        } else {
            ui->sSlika->setIcon(QIcon());
            ui->sSlika->setText("Slika");
            ui->sSlika->setData(QPixmap());
        }
    }
}

void Oratorij::on_animatorji_currentItemChanged(QTreeWidgetItem *current, QTreeWidgetItem *previous)
{
    if(ui->animatorji->selectedItems().count()>0){
        QSqlQuery query;
        query.exec(QString("SELECT a.aid, a.ime, a.priimek, a.opombe, s.ime, d.ime, a.did, a.sid, a.slika FROM animatorji a, skupine s, delavnice d WHERE a.sid = s.sid AND d.did = a.did AND aid=%1").arg(current->text(0)));
        query.next();
        ui->aid->setValue(query.value(0).toInt());
        ui->aIme->setText(query.value(1).toString());
        ui->aPriimek->setText(query.value(2).toString());
        ui->aOpombe->setHtml(query.value(3).toString());
        ui->aSkupina->setCurrentIndex(ui->aSkupina->findText(query.value(4).toString(),Qt::MatchEndsWith));
        ui->aDelavnica->setCurrentIndex(ui->aDelavnica->findText(query.value(5).toString(),Qt::MatchEndsWith));
        QPixmap pixmap;
        pixmap.loadFromData(query.value(8).toByteArray());
        if (!pixmap.size().isNull()){
            ui->aSlika->setIconSize(QSize(ui->aSlika->width()-10, ui->aSlika->height()-10));
            ui->aSlika->setIcon(QIcon(pixmap));
            ui->aSlika->setText("");
            ui->aSlika->setData(pixmap);
        } else {
            ui->aSlika->setIcon(QIcon());
            ui->aSlika->setText("Slika");
            ui->aSlika->setData(QPixmap());
        }
    }
}

void Oratorij::on_otroci_currentItemChanged(QTreeWidgetItem *current, QTreeWidgetItem *previous)
{
    if(ui->otroci->selectedItems().count()>0){
        QSqlQuery query;
        query.exec(QString("SELECT o.oid,o.ime,o.priimek,o.starost,o.telefon,o.naslov,o.posta,o.opombe,o.Placano,o.Prijavnica,o.Majica,o.Izlet,o.Bazen,o.Extra,s.ime,o.sid,o.slika FROM otroci o, skupine s WHERE o.sid=s.sid AND oid=%1").arg(current->text(0)));
        query.next();
        ui->oid->setValue(query.value(0).toInt());
        ui->pIme->setText(query.value(1).toString());
        ui->pPriimek->setText(query.value(2).toString());
        ui->pStarost->setValue(query.value(3).toInt());
        ui->pSkupina->setCurrentIndex(ui->pSkupina->findText(query.value(14).toString(),Qt::MatchContains));
        ui->pPosta->setText(query.value(6).toString());
        ui->pNaslov->setText(query.value(5).toString());
        ui->pKontakt->setText(query.value(4).toString());
        ui->pOpombe->setHtml(query.value(7).toString());
        ui->pPlacano->setChecked(query.value(8).toBool());
        ui->pPrijavnica->setChecked(query.value(9).toBool());
        ui->pBazen->setChecked(query.value(12).toBool());
        ui->pExtra->setChecked(query.value(13).toBool());
        ui->pMajica->setChecked(query.value(10).toBool());
        ui->pIzlet->setChecked(query.value(11).toBool());

        QPixmap pixmap;
        pixmap.loadFromData(query.value(16).toByteArray());
        if (!pixmap.size().isNull()){
            ui->pSlika->setIconSize(QSize(ui->pSlika->width()-10, ui->pSlika->height()-10));
            ui->pSlika->setIcon(QIcon(pixmap));
            ui->pSlika->setText("");
            ui->pSlika->setData(pixmap);
        } else {
            ui->pSlika->setIcon(QIcon());
            ui->pSlika->setText("Slika");
            ui->pSlika->setData(QPixmap());
        }
    }
}

void Oratorij::on_otroci_itemClicked(QTreeWidgetItem *item, int column)
{
    on_otroci_currentItemChanged(item,item);
}

void Oratorij::on_skupine_itemClicked(QTreeWidgetItem *item, int column)
{
    on_skupine_currentItemChanged(item,item);
}

void Oratorij::on_animatorji_itemClicked(QTreeWidgetItem *item, int column)
{
    on_animatorji_currentItemChanged(item,item);
}

void Oratorij::on_delavnice_itemClicked(QTreeWidgetItem *item, int column)
{
    on_delavnice_currentItemChanged(item,item);
}

void Oratorij::on_pReset_clicked()
{
    QSqlQuery query;

    ui->aSkupina->clear();
    ui->pSkupina->clear();
    ui->skupine->clear();
    ui->skupine->setHeaderLabels(QStringList() << "sid" << "ime" << "prostor" << "opombe");
    query.exec("SELECT sid,ime,prostor,opombe,slika FROM skupine ORDER BY sid ASC");
    ui->aSkupina->addItem("");
    ui->pSkupina->addItem("");
    while (query.next()) {
        QPixmap pixmap;
        pixmap.loadFromData(query.value(4).toByteArray());
        QIcon ico(pixmap);
        ui->aSkupina->addItem(ico,QString("%1.) %2").arg(query.value(0).toString(),query.value(1).toString()));
        ui->pSkupina->addItem(ico,QString("%1.) %2").arg(query.value(0).toString(),query.value(1).toString()));
        QTreeWidgetItem *item = new TreeWidgetItem(ui->skupine);
        item->setIcon(0,ico);
        QString tip(QString("%1<p><img alt='sample' src='data:image/png;base64,%2'>").arg(query.value(3).toString(),QString(query.value(4).toByteArray().toBase64())));
        for(int i=0;i<ui->skupine->columnCount();i++){
            item->setText(i,query.value(i).toString());
            item->setToolTip(i,tip);
        }
    }

    ui->izborDelavnice->clear();
    ui->aDelavnica->clear();
    ui->delavnice->clear();
    ui->delavnice->setHeaderLabels(QStringList() << "did" << "ime" << "max" << "minAge" << "maxAge" << "veckrat" << "prostor" << "opombe");
    query.exec("SELECT did,ime,max,minAge,maxAge,veckrat,prostor,opombe,slika FROM delavnice ORDER BY did ASC");
    ui->aDelavnica->addItem("");
    ui->izborDelavnice->addItem("");
    while (query.next()) {
        QPixmap pixmap;
        pixmap.loadFromData(query.value(8).toByteArray());
        QIcon ico(pixmap);
        ui->aDelavnica->addItem(ico,QString("%1.) %2").arg(query.value(0).toString(),query.value(1).toString()));
        ui->izborDelavnice->addItem(ico,QString("%1.) %2").arg(query.value(0).toString(),query.value(1).toString()));
        QTreeWidgetItem *item = new TreeWidgetItem(ui->delavnice);
        item->setIcon(0,ico);
        QString tip(QString("%1<p><img alt='sample' src='data:image/png;base64,%2'>").arg(query.value(7).toString(),QString(query.value(8).toByteArray().toBase64())));
        for(int i=0;i<ui->delavnice->columnCount();i++){
            item->setText(i,query.value(i).toString());
            item->setToolTip(i,tip);
        }
    }

    ui->animatorji->clear();
    ui->animatorji->setHeaderLabels(QStringList() << "aid" << "ime" << "priimek" << "opombe" << "sid" << "did");
    query.exec("SELECT aid,ime,priimek,opombe,sid,did,slika FROM animatorji ORDER BY aid ASC");
    while (query.next()) {
        QPixmap pixmap;
        pixmap.loadFromData(query.value(6).toByteArray());
        QIcon ico(pixmap);
        QTreeWidgetItem *item = new TreeWidgetItem(ui->animatorji);
        item->setIcon(0,ico);
        QString tip(QString("%1<p><img alt='sample' src='data:image/png;base64,%2'>").arg(query.value(3).toString(),QString(query.value(6).toByteArray().toBase64())));
        for(int i=0;i<ui->animatorji->columnCount();i++){
            item->setText(i,query.value(i).toString());
            item->setToolTip(i,tip);
        }
    }

    ui->otroci->clear();
    ui->otroci->setHeaderLabels(QStringList() << "oid" << "ime" << "priimek" << "starost" << "telefon" << "naslov" << "posta" << "opombe" << "placano" << "prijavnica" << "majica" << "izlet" << "bazen" << "extra" << "sid");
    query.exec("SELECT oid,ime,priimek,starost,telefon,naslov,posta,opombe,placano,prijavnica,majica,izlet,bazen,extra,sid,slika FROM otroci ORDER BY oid ASC");
    while (query.next()) {
        QPixmap pixmap;
        pixmap.loadFromData(query.value(15).toByteArray());
        QIcon ico(pixmap);
        QTreeWidgetItem *item = new TreeWidgetItem(ui->otroci);
        item->setIcon(0,ico);
        QString tip(QString("%1<p><img alt='sample' src='data:image/png;base64,%2'>").arg(query.value(7).toString(),QString(query.value(15).toByteArray().toBase64())));
        for(int i=0;i<ui->otroci->columnCount();i++){
            item->setText(i,query.value(i).toString());
            item->setToolTip(i,tip);
        }
    }
    for(int i=0;i<ui->animatorji->columnCount();i++){
        ui->animatorji->resizeColumnToContents(i);
    }
    for(int i=0;i<ui->delavnice->columnCount();i++){
        ui->delavnice->resizeColumnToContents(i);
    }
    for(int i=0;i<ui->otroci->columnCount();i++){
        ui->otroci->resizeColumnToContents(i);
    }
    for(int i=0;i<ui->skupine->columnCount();i++){
        ui->skupine->resizeColumnToContents(i);
    }
    ui->skIme->setText("");
    ui->skProstor->setText("");
    ui->sid->setValue(0);
    ui->sOpombe->setHtml("");
    ui->dIme->setText("");
    ui->dMax->setValue(0);
    ui->dOd->setValue(0);
    ui->dDo->setValue(0);
    ui->dProstor->setText("");
    ui->dVec->setChecked(0);
    ui->did->setValue(0);
    ui->dOpombe->setHtml("");
    ui->aIme->setText("");
    ui->aPriimek->setText("");
    ui->aid->setValue(0);
    ui->aSkupina->setCurrentIndex(0);
    ui->aDelavnica->setCurrentIndex(0);
    ui->aOpombe->setHtml("");
    ui->oid->setValue(0);
    ui->pIme->setText("");
    ui->pPriimek->setText("");
    ui->pStarost->setValue(0);
    ui->pSkupina->setCurrentIndex(0);
    ui->pPosta->setText("");
    ui->pNaslov->setText("");
    ui->pKontakt->setText("");
    ui->pOpombe->setHtml("");
    ui->pPlacano->setChecked(0);
    ui->pPrijavnica->setChecked(0);
    ui->pBazen->setChecked(0);
    ui->pExtra->setChecked(0);
    ui->pMajica->setChecked(0);
    ui->pIzlet->setChecked(0);
    ui->dSlika->setIcon(QIcon());
    ui->dSlika->setText("Slika");
    ui->dSlika->setData(QPixmap());
    ui->aSlika->setIcon(QIcon());
    ui->aSlika->setText("Slika");
    ui->aSlika->setData(QPixmap());
    ui->sSlika->setIcon(QIcon());
    ui->sSlika->setText("Slika");
    ui->sSlika->setData(QPixmap());
    ui->pSlika->setIcon(QIcon());
    ui->pSlika->setText("Slika");
    ui->pSlika->setData(QPixmap());
}


void Oratorij::on_dSlika_clicked()
{
    QString fn = QFileDialog::getOpenFileName(this,"Odpri sliko","",("Images (*.bmp *.gif *.jpg *.jpeg *.png *.pbm *.pgm *.ppm *.xbm *.xpm);;All Files (*.*)"));
    if(fn != ""){
        QPixmap pixmap = QPixmap(fn);
        ui->dSlika->setIconSize(QSize(ui->dSlika->width()-10, ui->dSlika->height()-10));
        ui->dSlika->setIcon(QIcon(pixmap));
        ui->dSlika->setText("");
        ui->dSlika->setData(pixmap);
    } else {
        ui->dSlika->setIcon(QIcon());
        ui->dSlika->setText("Slika");
        ui->dSlika->setData(QPixmap());
    }
}

void Oratorij::on_sSlika_clicked()
{
    QString fn = QFileDialog::getOpenFileName(this,"Odpri sliko","",("Images (*.bmp *.gif *.jpg *.jpeg *.png *.pbm *.pgm *.ppm *.xbm *.xpm);;All Files (*.*)"));
    if(fn != ""){
        QPixmap pixmap = QPixmap(fn);
        ui->sSlika->setIconSize(QSize(ui->sSlika->width()-10, ui->sSlika->height()-10));
        ui->sSlika->setIcon(QIcon(pixmap));
        ui->sSlika->setText("");
        ui->sSlika->setData(pixmap);
    } else {
        ui->sSlika->setIcon(QIcon());
        ui->sSlika->setText("Slika");
        ui->sSlika->setData(QPixmap());
    }
}

void Oratorij::on_aSlika_clicked()
{
    QString fn = QFileDialog::getOpenFileName(this,"Odpri sliko","",("Images (*.bmp *.gif *.jpg *.jpeg *.png *.pbm *.pgm *.ppm *.xbm *.xpm);;All Files (*.*)"));
    if(fn != ""){
        QPixmap pixmap = QPixmap(fn);
        ui->aSlika->setIconSize(QSize(ui->aSlika->width()-10, ui->aSlika->height()-10));
        ui->aSlika->setIcon(QIcon(pixmap));
        ui->aSlika->setText("");
        ui->aSlika->setData(pixmap);
    } else {
        ui->aSlika->setIcon(QIcon());
        ui->aSlika->setText("Slika");
        ui->aSlika->setData(QPixmap());
    }
}

void Oratorij::on_pSlika_clicked()
{
    QString fn = QFileDialog::getOpenFileName(this,"Odpri sliko","",("Images (*.bmp *.gif *.jpg *.jpeg *.png *.pbm *.pgm *.ppm *.xbm *.xpm);;All Files (*.*)"));
    if(fn != ""){
        QPixmap pixmap = QPixmap(fn);
        ui->pSlika->setIconSize(QSize(ui->pSlika->width()-10, ui->pSlika->height()-10));
        ui->pSlika->setIcon(QIcon(pixmap));
        ui->pSlika->setText("");
        ui->pSlika->setData(pixmap);
    } else {
        ui->pSlika->setIcon(QIcon());
        ui->pSlika->setText("Slika");
        ui->pSlika->setData(QPixmap());
    }
}

void Oratorij::on_dBrisi_clicked()
{
    QSqlQuery query;
    query.exec(QString("DELETE FROM delavnice WHERE did = %1").arg(ui->did->value()));
    on_pReset_clicked();
}

void Oratorij::on_sBrisi_clicked()
{
    QSqlQuery query;
    query.exec(QString("DELETE FROM skupine WHERE sid = %1").arg(ui->sid->value()));
    on_pReset_clicked();
}

void Oratorij::on_aBrsi_clicked()
{
    QSqlQuery query;
    query.exec(QString("DELETE FROM animatorji WHERE aid = %1").arg(ui->aid->value()));
    on_pReset_clicked();
}

void Oratorij::on_pBrisi_clicked()
{
    QSqlQuery query;
    query.exec(QString("DELETE FROM otroci WHERE oid = %1").arg(ui->oid->value()));
    on_pReset_clicked();
}

void Oratorij::on_dShrani_clicked()
{
    QSqlQuery query;
    if(ui->did->value()==0){
        query.exec("SELECT MAX(did) FROM delavnice");
        query.next();
        ui->did->setValue(query.value(0).toInt()+1);
    }
    query.exec(QString("SELECT EXISTS(Select 1 from delavnice WHERE did = %1);").arg(ui->did->value()));
    query.next();
    if(query.value(0).toBool() == true){
        query.exec(QString("UPDATE delavnice SET `did`='%1', `ime`='%2', `max`='%3', `minAge`='%4', `maxAge`='%5', `veckrat`='%6', `prostor`='%7', `opombe`='%8' WHERE `did`='%1'").arg(QVariant(ui->did->value()).toString(),ui->dIme->text(),QVariant(ui->dMax->value()).toString(),QVariant(ui->dOd->value()).toString(),QVariant(ui->dDo->value()).toString(),QVariant(QVariant(ui->dVec->isChecked()).toInt()).toString(),ui->dProstor->text(),ui->dOpombe->toPlainText()));
    } else {
        query.exec(QString("INSERT INTO delavnice (`did`, `ime`, `max`, `minAge`, `maxAge`, `veckrat`, `prostor`, `opombe`) VALUES ('%1', '%2', '%3', '%4', '%5', '%6', '%7', '%8')").arg(QVariant(ui->did->value()).toString(),ui->dIme->text(),QVariant(ui->dMax->value()).toString(),QVariant(ui->dOd->value()).toString(),QVariant(ui->dDo->value()).toString(),QVariant(QVariant(ui->dVec->isChecked()).toInt()).toString(),ui->dProstor->text(),ui->dOpombe->toPlainText()));
    }
    QPixmap x = ui->dSlika->data;
    if(!x.isNull()){
        if (x.size().width()>320 || x.size().height()>240){
            x = x.scaled(320,240,Qt::KeepAspectRatio,Qt::SmoothTransformation);
        }
        QByteArray bytes;
        QBuffer buffer(&bytes);
        buffer.open(QIODevice::WriteOnly);
        x.save(&buffer, "PNG");
        query.prepare(QString("UPDATE delavnice SET slika=(?) WHERE did='%1'").arg(ui->did->value()));
        query.addBindValue(buffer.data());
        query.exec();
    }
    on_pReset_clicked();
}

void Oratorij::on_sShrani_clicked()
{
    QSqlQuery query;
    if(ui->sid->value()==0){
        query.exec("SELECT MAX(sid) FROM skupine");
        query.next();
        ui->sid->setValue(query.value(0).toInt()+1);
    }
    query.exec(QString("SELECT EXISTS(Select 1 from skupine WHERE sid = %1);").arg(ui->sid->value()));
    query.next();
    if(query.value(0).toBool() == true){
        query.exec(QString("UPDATE skupine SET sid = '%1', ime = '%2', prostor = '%3', opombe = '%4' WHERE sid = '%1'").arg(QVariant(ui->sid->value()).toString(),ui->skIme->text(),ui->skProstor->text(),ui->skProstor->text()));
    } else {
        query.exec(QString("INSERT INTO skupine (sid, ime, prostor, opombe) VALUES ('%1','%2','%3','%4')").arg(QVariant(ui->sid->value()).toString(),ui->skIme->text(),ui->skProstor->text(),ui->skProstor->text()));
    }
    QPixmap x = ui->sSlika->data;
    if(!x.isNull()){
        if (x.size().width()>320 || x.size().height()>240){
            x = x.scaled(320,240,Qt::KeepAspectRatio,Qt::SmoothTransformation);
        }
        QByteArray bytes;
        QBuffer buffer(&bytes);
        buffer.open(QIODevice::WriteOnly);
        x.save(&buffer, "PNG");
        query.prepare(QString("UPDATE skupine SET slika=(?) WHERE sid='%1'").arg(ui->sid->value()));
        query.addBindValue(buffer.data());
        query.exec();
    }
    on_pReset_clicked();
}

void Oratorij::on_aShrani_clicked()
{
    QSqlQuery query;
    if(ui->aid->value()==0){
        query.exec("SELECT MAX(aid) FROM animatorji");
        query.next();
        ui->aid->setValue(query.value(0).toInt()+1);
    }
    query.exec(QString("SELECT EXISTS(Select 1 from animatorji WHERE aid = %1);").arg(ui->aid->value()));
    query.next();
    if(query.value(0).toBool() == true){
        query.exec(QString("UPDATE animatorji SET aid = '%1', ime = '%2', priimek = '%3', sid = '%4', did = '%5', opombe = '%6' WHERE aid = '%1'").arg(QVariant(ui->aid->value()).toString(),ui->aIme->text(),ui->aPriimek->text(),ui->aSkupina->currentText().left(ui->aSkupina->currentText().indexOf(".")),ui->aDelavnica->currentText().left(ui->aDelavnica->currentText().indexOf(".")),ui->aOpombe->toPlainText()));
    } else {
        query.exec(QString("INSERT INTO animatorji(aid,ime,priimek,sid,did,opombe) VALUES ('%1','%2','%3','%4','%5','%6')").arg(QVariant(ui->aid->value()).toString(),ui->aIme->text(),ui->aPriimek->text(),ui->aSkupina->currentText().left(ui->aSkupina->currentText().indexOf(".")),ui->aDelavnica->currentText().left(ui->aDelavnica->currentText().indexOf(".")),ui->aOpombe->toPlainText()));
    }
    QPixmap x = ui->aSlika->data;
    if(!x.isNull()){
        if (x.size().width()>320 || x.size().height()>240){
            x = x.scaled(320,240,Qt::KeepAspectRatio,Qt::SmoothTransformation);
        }
        QByteArray bytes;
        QBuffer buffer(&bytes);
        buffer.open(QIODevice::WriteOnly);
        x.save(&buffer, "PNG");
        query.prepare(QString("UPDATE animatorji SET slika=(?) WHERE aid='%1'").arg(ui->aid->value()));
        query.addBindValue(buffer.data());
        query.exec();
    }
    on_pReset_clicked();
}

void Oratorij::on_pShrani_clicked()
{
    QSqlQuery query;
    if(ui->oid->value()==0){
        query.exec("SELECT MAX(oid) FROM otroci");
        query.next();
        ui->oid->setValue(query.value(0).toInt()+1);
    }
    query.exec(QString("SELECT EXISTS(Select 1 from otroci WHERE oid = %1);").arg(ui->oid->value()));
    query.next();
    if(query.value(0).toBool() == true){
        QString x = QString("UPDATE otroci SET `oid`='%1', `Ime`='%2', `priimek`='%3', `starost`='%4', `telefon`='%5', `naslov`='%6', `posta`='%7', ").arg(QVariant(ui->oid->value()).toString(),ui->pIme->text(),ui->pPriimek->text(),QVariant(ui->pStarost->value()).toString(),ui->pKontakt->text(),ui->pNaslov->text(),ui->pPosta->text());
        QString y = QString("`opombe`='%1', `Placano`='%2', `Prijavnica`='%3', `Majica`='%4', `Izlet`='%5', `Bazen`='%6', `Extra`='%7', `sid`='%8' WHERE `oid`='%9'").arg(ui->pOpombe->toPlainText(),QVariant(QVariant(ui->pPlacano->isChecked()).toInt()).toString(),QVariant(QVariant(ui->pPrijavnica->isChecked()).toInt()).toString(),QVariant(QVariant(ui->pMajica->isChecked()).toInt()).toString(),QVariant(QVariant(ui->pIzlet->isChecked()).toInt()).toString(),QVariant(QVariant(ui->pBazen->isChecked()).toInt()).toString(),QVariant(QVariant(ui->pExtra->isChecked()).toInt()).toString(),ui->pSkupina->currentText().left(ui->pSkupina->currentText().indexOf(".")),QVariant(ui->oid->value()).toString());
        query.exec(x+y);
    } else {
        QString x = QString("INSERT INTO otroci (`oid`, `Ime`, `priimek`, `starost`, `telefon`, `naslov`, `posta`, `opombe`, `Placano`, `Prijavnica`, `Majica`, `Izlet`, `Bazen`, `Extra`, `sid`) VALUES ('%1', '%2', '%3', '%4', '%5', '%6', '%7', ").arg(QVariant(ui->oid->value()).toString(),ui->pIme->text(),ui->pPriimek->text(),QVariant(ui->pStarost->value()).toString(),ui->pKontakt->text(),ui->pNaslov->text(),ui->pPosta->text());
        QString y = QString("'%1', '%2', '%3', '%4', '%5', '%6', '%7', '%8')").arg(ui->pOpombe->toPlainText(),QVariant(QVariant(ui->pPlacano->isChecked()).toInt()).toString(),QVariant(QVariant(ui->pPrijavnica->isChecked()).toInt()).toString(),QVariant(QVariant(ui->pMajica->isChecked()).toInt()).toString(),QVariant(QVariant(ui->pIzlet->isChecked()).toInt()).toString(),QVariant(QVariant(ui->pBazen->isChecked()).toInt()).toString(),QVariant(QVariant(ui->pExtra->isChecked()).toInt()).toString(),ui->pSkupina->currentText().left(ui->pSkupina->currentText().indexOf(".")));
        query.exec(x+y);
    }
    QPixmap x = ui->pSlika->data;
    if(!x.isNull()){
        if (x.size().width()>320 || x.size().height()>240){
            x = x.scaled(320,240,Qt::KeepAspectRatio,Qt::SmoothTransformation);
        }
        QByteArray bytes;
        QBuffer buffer(&bytes);
        buffer.open(QIODevice::WriteOnly);
        x.save(&buffer, "PNG");
        query.prepare(QString("UPDATE otroci SET slika=(?) WHERE oid='%1'").arg(ui->oid->value()));
        query.addBindValue(buffer.data());
        query.exec();
    }
    on_pReset_clicked();
}

void Oratorij::closeEvent(QCloseEvent *event)
{
    QSettings settings("Oratorij", "Oratorij prijave");
    settings.setValue("MainWindow/State", saveState());
    settings.setValue("MainWindow/Geometry", geometry());
    settings.setValue("dSpliter/State",ui->dSplitter->saveState());
    settings.setValue("aSpliter/State",ui->aSplitter->saveState());
    settings.setValue("sSpliter/State",ui->sSpliter->saveState());
    QMainWindow::closeEvent(event);
}

void Oratorij::RestoreState()
{
    QSettings settings("Oratorij", "Oratorij prijave");
    restoreState(settings.value("MainWindow/State").toByteArray());
    setGeometry(settings.value("MainWindow/Geometry").toRect());
    ui->dSplitter->restoreState(settings.value("dSpliter/State").toByteArray());
    ui->aSplitter->restoreState(settings.value("aSpliter/State").toByteArray());
    ui->sSpliter->restoreState(settings.value("sSpliter/State").toByteArray());
}

void Oratorij::on_resetUI_clicked()
{
    QSettings settings("Oratorij", "Oratorij prijave");
    settings.setValue("MainWindow/State", "");
    settings.setValue("MainWindow/Geometry", "");
    settings.setValue("dSpliter/State","");
    settings.setValue("aSpliter/State","");
    settings.setValue("sSpliter/State","");
}


void Oratorij::on_koda_returnPressed()
{
    //MAIN PRIJAVA KODE
}
