#include <QtGui/QApplication>
#include "oratorij.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Oratorij w;
    w.show();
    
    return a.exec();
}
