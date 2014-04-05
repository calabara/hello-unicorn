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
                     contentView.currentPage = "TodoList";
                }
            }
        }
        Image {
            id: saveDealBtn
            anchors.right: parent.right
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/glyphicons_030_pencil.png"

            height: parent.height * 0.7
            width: Math.max(parent.width / 10, height)
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    contentView.currentPage = "addevent";
                }
            }
        }
    }

    PageContent{

        Substrate {
            ColumnLayout{
                spacing: 2
                anchors.margins: 40
                anchors.fill: parent
                Text {
                    id: eventTitle
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    renderType: Text.NativeRendering
                    text: "Встреча на Эльбе"
                }


                Text{
                    id: eventType


                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    renderType: Text.NativeRendering
                    width: parent.width
                    text: "Тип: встреча";

                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    renderType: Text.NativeRendering
                    text: "22.05.1807"
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    renderType: Text.NativeRendering

                    text: "Место: Эльба"
                }

                Text{
                    id: eventDeal
                    renderType: Text.NativeRendering
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
}
