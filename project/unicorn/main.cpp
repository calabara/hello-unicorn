#include <QtGui/QGuiApplication>
#include <QtQml/QtQml>
#include <QtQml/QQmlComponent>

#include "qtquick2applicationviewer/qtquick2applicationviewer.h"
#include "controller/orgcontroller.h"
#include "utils/dbutils.h"
#include "models/contactobject.h"
#include "models/eventobject.h"

void registerTypes();

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile("qml/unicorn/main.qml");

    auto context = viewer.rootContext();

    OrgController controller(context);
    DbUtils utils;

    registerTypes();

    context->setContextProperty("OrgController", &controller);
    context->setContextProperty("DbUtils", &utils);

    viewer.showExpanded();

    return app.exec();
}

void registerTypes() {
    qmlRegisterType<ContactObject>("contact", 1, 0, "Contact");
    qmlRegisterType<DealObject>("deal", 1, 0, "Deal");
    qmlRegisterType<EventObject>("event", 1, 0, "Event");
}
