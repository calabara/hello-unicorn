import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

Rectangle {
    anchors.fill: parent
    color: "gray"
    MyToolBar {
        id: toolbar
        title: "Органайзер"

        Button {
            anchors.right: parent.right
            text: "Done!"
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                contentView.currentPage = "ListActors";
            }
        }

//        Image {
//            id: addEventBtn
//            anchors.right: parent.right
//            anchors.rightMargin: 3
//            anchors.verticalCenter: parent.verticalCenter
//            source: "qrc:/icons/glyphicons_190_circle_plus.png"

//            height: parent.height *0.7
//            width: Math.max(parent.width / 10, height)
//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                     contentView.currentPage = "addevent";
//                }
//            }
//        }
    }


    PageContent {
        id: pageContent

        // TODO: line up normal colors

        ColumnLayout {
            width: parent.width
            anchors.margins: 22
            spacing: 50
            ComboBox {
                id: chooseContact
                Layout.fillWidth: true
                model: ["Иванов И.И. "]
            }

            ComboBox {
                id: chooseRole
                Layout.fillWidth: true
                model: ["Покупатель"]
            }

            Button {
                text: "OK"
                Layout.fillWidth: true
                onClicked: {
                    contentView.currentPage = "ListActors";
                }
            }
        }

    }


    // TODO: impelements this
}
