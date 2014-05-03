import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import event 1.0

Rectangle {
    anchors.fill: parent

    MyToolBar {
        id: toolbar
        title: "Edit event"
        BackButton {
            id: back
        }

        SaveButton {
            onClick: {
            }
        }

    }

    Event {
        id: currentEvent
    }

    PageContent {
        id: pageContent

        Rectangle{
            anchors.fill: parent

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

                    text: "Сохранить"
                }
            }
        }

    }
}
