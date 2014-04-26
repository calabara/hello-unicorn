#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer/qtquick2applicationviewer.h"

#include "backend/dbase_connector.h"
#include <QList>
#include "controller/orgcontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile("qml/unicorn/main.qml");

    auto context = viewer.rootContext();
    OrgController controller(context);
    context->setContextProperty("OrgController", &controller);

    viewer.showExpanded();
    DBaseConnector::Instance()->initConnection();

    int retCode = app.exec();

    DBaseConnector::DestroyInstance();
    return retCode;
}
