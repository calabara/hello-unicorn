#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer/qtquick2applicationviewer.h"

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

    return app.exec();
}
