import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "."

Rectangle {
    anchors.fill: parent
    anchors.topMargin: 0
    color: "gray"

    MyToolBar {
        id: toolbar
        title: "Добавить сделку"
        isMenuButtonVisible: false

        Image {
            id: addDealBtn
            anchors.left: parent.left
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/back.png"
            height: parent.height
            width: Math.max(parent.width / 10, height)
            MouseArea {
                anchors.fill: parent
                onClicked: {
                     contentView.currentPage = "listdeal";
                }
            }
        }
        Image {
            id: saveDealBtn
            anchors.right: parent.right
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/glyphicons_446_floppy_save.png"
            height: parent.height * 0.7
            width: Math.max(parent.width / 10, height)
            MouseArea {
                anchors.fill: parent
                onClicked: {

                }
            }
        }
    }

    PageContent{
        ColumnLayout{
            spacing: 4
            anchors.margins: 40
            anchors.fill: parent

            TextField {

                id: dealTitle
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                placeholderText: "Название"
            }

            TextField {
                id: dealmaxMoney
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width

                placeholderText: "Максимальная сумма"
            }

            TextField {
                id: dealminMoney
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width

                placeholderText: "Минимальная сумма"
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Участники"
            }

//            Button {
//                anchors.horizontalCenter: parent.horizontalCenter
//                Layout.fillWidth: true

//                text: "События"
//            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Сохранить"

            }
        }
    }
}
