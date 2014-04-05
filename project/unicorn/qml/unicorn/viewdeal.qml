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
        title: "Квартира на ленинском"
        isMenuButtonVisible: false

        Image {
            id: addDealBtn
            anchors.left: parent.left
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height *0.7
            width: Math.max(parent.width / 10, height)
            source: "qrc:/icons/back.png"

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
            source: "qrc:/icons/glyphicons_030_pencil.png"
            height: parent.height
            width: Math.max(parent.width / 10, height)
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    contentView.currentPage = "adddeal";
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

                    id: dealTitle
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: "Квартира на ленинском"
                }

                Text {

                    id: dealMoney
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    width: parent.width

                    text: "300 000р."
                }

                Text{
                    id: dealState


                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    width: parent.width
                    text: "Статус: в процессе";

                }

                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: "Участники"

                }
                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: "События"
                }

            }

        }
    }
}
