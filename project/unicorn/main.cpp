#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"

#include "backend/dbase_connector.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/unicorn/main.qml"));
    viewer.showExpanded();


    DBaseConnector::Instance()->initConnection();

    int retCode = app.exec();

    DBaseConnector::DestroyInstance();

    return retCode;
}
