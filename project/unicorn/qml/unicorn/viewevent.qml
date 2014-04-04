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
        title: "Встреча на Эльбе"

        Image {
            id: addDealBtn
            anchors.right: parent.right
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/glyphicons_224_chevron-left.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                     contentView.currentPage = "TodoList";
                }
            }
        }
        Image {
            id: saveDealBtn
            anchors.right: addDealBtn.left
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/glyphicons_030_pencil.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    contentView.currentPage = "addevent";
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


            Text {

                id: eventTitle
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Встреча на Эльбе"
            }


            Text{
                id: eventType


                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width
                text: "Тип: встреча";

            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "22.05.1807"

            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Место: Эльба"
            }

            Text{
                id: eventDeal

                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width
                text: "Событие: продажа квартиры 24";

            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Участники"
            }



        }
    }
}
