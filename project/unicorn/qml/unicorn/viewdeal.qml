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
            anchors.right: parent.right
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/glyphicons_224_chevron-left.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                     contentView.currentPage = "listdeal";
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
