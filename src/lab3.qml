import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    width: 260
    height: 360

    toolBar: ToolBar{
        RowLayout{
            anchors.fill: parent
            anchors.margins: 3
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
                source: "icons/glyphicons_158_show_lines.png"

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

                source: "icons/glyphicons_432_plus.png"

            }
        }
    }


    ColumnLayout{
        anchors.fill:  parent
        anchors.topMargin: 0
        spacing: 4
        anchors.margins: 10

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

