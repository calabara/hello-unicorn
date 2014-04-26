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
            width: Math.max(parent.width / 10, height)
            source: "qrc:/icons/back.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                     contentView.goBack();
                }
            }
        }

        Image {
            id: saveClientBtn
            anchors.right: parent.right
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/glyphicons_030_pencil.png"
            height: parent.height * 0.7
            width: Math.max(parent.width / 10, height)
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

                Rectangle {
                    color: "white"
                    Layout.fillWidth: true
                    height: 200
                    border.width: 1
                    border.color: "black"
                    Text {
                        anchors.margins: 10
                        anchors.fill: parent
                        text: "Дом. телефон: 832978.\n Какой-то текст. Звонить после обеда."
                    }
                }

            }
        }
    }
}
