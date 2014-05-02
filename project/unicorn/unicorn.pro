# Add more folders to ship with the application, here
folder_01.source = qml/unicorn
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01
QMAKE_CXXFLAGS += -std=c++11

QT += sql

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    utils/dbase_connector.cpp \
    controller/orgcontroller.cpp \
    models/orgsqlmodel.cpp \
    models/dealobject.cpp \ 
    utils/dbutils.cpp \
    models/contactobject.cpp \
    models/eventobject.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

CONFIG+=qml_debug

RESOURCES += \
    resources.qrc


OTHER_FILES +=

HEADERS += \
    utils/dbase_connector.h \
    controller/orgcontroller.h \
    models/orgsqlmodel.h \
    models/dealobject.h \
    utils/dbutils.h \
    models/contactobject.h \
    models/eventobject.h
