import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "."

Rectangle {
    anchors.fill: parent
    anchors.topMargin: 0
    color: "gray"

    function changeButtonTitle(){
        console.log('haha');
        selectDealButton.text = this.text;
    }

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
//                anchors.horizontalCenter: root.horizontalCenter
            }

            DatePicker{
//                anchors.horizontalCenter: root.horizontalCenter
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
                ListElement { text: " квартиры 24"; }
                ListElement { text: " квартиры 24"; }

            }

            Menu {
                id: dealsMenu
                MenuItem {

                    text: "продажа квартиры 24"
                    onTriggered:  changeButtonTitle();
                }
                MenuItem {

                    text: "Сделка 2"
                    onTriggered:  changeButtonTitle();
                }
                MenuItem {

                    text: "стадион в сочи"
                    onTriggered:  changeButtonTitle();
                }

            }

            Button {
                id: selectDealButton
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Сделка"
                onClicked: {
                    dealsMenu.popup();
                }

            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Сохранить"

            }
        }
    }
}
