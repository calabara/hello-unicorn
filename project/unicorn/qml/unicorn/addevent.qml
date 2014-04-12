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
        title: "Добавить событие"
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
            source: "qrc:/icons/glyphicons_446_floppy_save.png"
            height: parent.height * 0.7
            width: Math.max(parent.width / 10, height)
            MouseArea {
                anchors.fill: parent
                onClicked: {
                }
            }
        }
    }

    PageContent{

        ColumnLayout{
            spacing: 4
            anchors.margins: 40
            anchors.fill: parent

            TextField {

                id: eventTitle
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                placeholderText: "Название"
            }


            ListModel{
                id: typeModel
                ListElement { text: "встреча"; }
            }

            ComboBox{
                id: eventType

                model: typeModel
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width

            }

            TimePicker{
                id: time
                anchors.horizontalCenter: parent.horizontalCenter
            }

            DatePicker{
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Место"
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Участники"
            }

            ListModel{
                id: eventDealModel
                ListElement { text: "продажа квартиры 24"; }
            }

            ComboBox{
                id: eventDeal

                model: eventDealModel
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width

            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Сохранить"

            }
        }
    }
}
