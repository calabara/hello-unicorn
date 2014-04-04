import QtQuick 2.0

// Список дел
Rectangle {
    anchors.fill: parent
    MyToolBar {
        id: toolbar
        title: "Добавить событие"

        Image {
            id: addEventBtn
            anchors.right: parent.right
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/glyphicons_190_circle_plus.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                     contentView.currentPage = "addevent";
                }
            }
        }
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
