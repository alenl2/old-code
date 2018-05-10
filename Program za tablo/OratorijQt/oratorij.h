#ifndef ORATORIJ_H
#define ORATORIJ_H

#include <QMainWindow>
#include <QTreeWidget>
#include <QDebug>
#include <QtSql>
#include <QLabel>
#include <QPushButton>

namespace Ui {
class Oratorij;
}

class Oratorij : public QMainWindow
{
    Q_OBJECT    
public:
    explicit Oratorij(QWidget *parent = 0);
    ~Oratorij();
    
private slots:

    void RestoreState();

    void on_skupine_currentItemChanged(QTreeWidgetItem *current, QTreeWidgetItem *previous);

    void on_delavnice_currentItemChanged(QTreeWidgetItem *current, QTreeWidgetItem *previous);

    void on_animatorji_currentItemChanged(QTreeWidgetItem *current, QTreeWidgetItem *previous);

    void on_otroci_currentItemChanged(QTreeWidgetItem *current, QTreeWidgetItem *previous);

    void on_pReset_clicked();

    void on_sShrani_clicked();

    void on_dShrani_clicked();

    void on_aShrani_clicked();

    void on_dSlika_clicked();

    void on_sSlika_clicked();

    void on_aSlika_clicked();

    void on_pSlika_clicked();

    void on_pShrani_clicked();

    void on_dBrisi_clicked();

    void on_sBrisi_clicked();

    void on_aBrsi_clicked();

    void on_pBrisi_clicked();

    void on_otroci_itemClicked(QTreeWidgetItem *item, int column);

    void on_skupine_itemClicked(QTreeWidgetItem *item, int column);

    void on_animatorji_itemClicked(QTreeWidgetItem *item, int column);

    void on_delavnice_itemClicked(QTreeWidgetItem *item, int column);

    void TimeOut();

    void on_resetUI_clicked();

    void on_koda_returnPressed();

private:
    Ui::Oratorij *ui;

protected:
    void closeEvent(QCloseEvent *event);
};



class TreeWidgetItem : public QTreeWidgetItem {

  public:
  TreeWidgetItem(QTreeWidget* parent):QTreeWidgetItem(parent){}
  private:
  bool operator<(const QTreeWidgetItem &other)const {
     int column = treeWidget()->sortColumn();
     if (text(column).toFloat() && other.text(column).toFloat()){
        return text(column).toFloat() > other.text(column).toFloat();
      }
     return text(column).toLower() > other.text(column).toLower();
  }
};

class PixPushButton : public QPushButton
{
    Q_OBJECT
public:
    PixPushButton(QWidget * parent = 0):QPushButton(parent){}
    QPixmap data;
    void setData(QPixmap in){
        data = in;
    }

};


#endif // ORATORIJ_H
