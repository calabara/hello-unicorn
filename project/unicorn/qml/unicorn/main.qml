import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

Rectangle {
    width: 260
    height: 360

    ToolBar{
        id: toolbar
        RowLayout{
            anchors.fill: parent
            anchors.margins: 3
            id:toolbarLayout

            Image {
                anchors.margins: 3

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        navMenu.popup();
                    }
                }

                anchors.verticalCenter: parent.verticalCenter
                id: menuIcon
                source: "qrc:/icons/glyphicons_158_show_lines.png"

            }

            Menu{
                id: navMenu
                MenuItem{
                    text: "Сделки"
                }
                MenuItem{
                    text: "Контакты"
                }
                MenuItem{
                    text: "Органайзер"
                }
            }
            Text {
                id: pageTitle
                font.pointSize: 14
                text: "Сделки"
            }
            Rectangle{
                Layout.fillWidth: true
            }

            Image {
                anchors.margins: 3

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        navMenu.popup();
                    }
                }

                anchors.verticalCenter: parent.verticalCenter
                id: addDeal

                source: "qrc:/icons/glyphicons_432_plus.png"

            }
        }
    }


    Rectangle{
        width: parent.width
        height: parent.height - toolbar.height
        anchors.topMargin: 0
        anchors.top: toolbar.bottom

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

                id: dealMoney
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width

                placeholderText: "Сумма"
            }

            ComboBox{
                id: dealState
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width

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
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Сохранить"

            }
        }
    }
}

