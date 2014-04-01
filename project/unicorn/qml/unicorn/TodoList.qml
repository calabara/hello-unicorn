import QtQuick 2.0

// Список дел
Rectangle {
    anchors.fill: parent
    MyToolBar {
        id: toolbar
        title: "Органайзер"
    }

    PageContent {
        id: pageContent

        Rectangle {
            anchors.fill: parent
            color: "lightblue"
        }
    }

    // TODO: impelements this
}
