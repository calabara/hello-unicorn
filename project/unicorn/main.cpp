#include <QtGui/QGuiApplication>
#include <QtQml/QtQml>
#include <QtQml/QQmlComponent>
#include "qtquick2applicationviewer/qtquick2applicationviewer.h"

#include "controller/orgcontroller.h"
#include "utils/dbutils.h"
#include "models/contactobject.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile("qml/unicorn/main.qml");

    auto context = viewer.rootContext();
    OrgController controller(context);
    context->setContextProperty("OrgController", &controller);
    DbUtils utils;
    context->setContextProperty("DbUtils", &utils);
    qmlRegisterType<ContactObject>("contact", 1, 0, "Contact");
    qmlRegisterType<DealObject>("deal", 1, 0, "Deal");

    viewer.showExpanded();

    return app.exec();
}
