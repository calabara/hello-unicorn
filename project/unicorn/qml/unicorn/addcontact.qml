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
        title: "Добавить клиента"

        Image {
            id: addClientBtn
            anchors.right: parent.right
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/glyphicons_224_chevron-left.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                     contentView.currentPage = "listcontact";
                }
            }
        }
        Image {
            id: saveClientBtn
            anchors.right: addClientBtn.left
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/glyphicons_446_floppy_save.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {

                }
            }
        }
    }

    PageContent{
        anchors.fill: parent
        anchors.topMargin: 0

        ColumnLayout{
            spacing: 4
            anchors.margins: 40
            anchors.fill: parent

            TextField {

                id: contactFio
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                placeholderText: "ФИО"
            }

            TextField {

                id: contactPhone
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width

                placeholderText: "Телефон"
            }

        }
    }
}
