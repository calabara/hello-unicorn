import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

Rectangle {
    id: root
    width: 260
    height: 360

    property bool menuShow: false


    function onMenu() {
        gameTranslate.x = root.menuShow ? 0 : root.width * 0.8
        root.menuShow = !root.menuShow;
    }

    PageList {
        id: pageList
    }

    MenuView {
        id: menuView
    }

    Rectangle {
        anchors.fill: parent
        id: pageLayout

        ContentView {
            id: contentView
        }

        MouseArea {
            anchors.fill: parent
            enabled: root.menuShow
            onClicked: root.onMenu()
        }

        transform: Translate {
            id: gameTranslate
            x: 0
            Behavior on x { NumberAnimation { duration: 400; easing.type: Easing.OutQuad } }
        }
    }
}

