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
        title: "Васильев И.И."
        isMenuButtonVisible: false

        Image {
            id: addClientBtn
            anchors.left: parent.left
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height
            width: parent.width / 10
            source: "qrc:/icons/back.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                     contentView.currentPage = "listcontact";
                }
            }
        }

        Image {
            id: saveClientBtn
            anchors.right: parent.right
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/glyphicons_030_pencil.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    contentView.currentPage = "addcontact";
                }
            }
        }
    }

    PageContent{

        Substrate {
            ColumnLayout{
                spacing: 4
                anchors.margins: 40
                anchors.fill: parent

                Text {

                    id: contactSurname
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: "Васильев"
                }
                Text {

                    id: contactName
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: "Иван"
                }
                Text {

                    id: contactSecondname
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: "Иванович"
                }

                Text {

                    id: contactPhone
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    width: parent.width

                    text: "+7993944959"
                }


            }
        }
    }
}
