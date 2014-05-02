import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "."

Rectangle {
    anchors.fill: parent
    anchors.topMargin: 0
    color: "gray"

    // wtf ??
    function changeButtonTitle(parentButton){
        console.log('haha');
        parentButton.text = this.text;
    }

    MyToolBar {
        id: toolbar
        title: "Добавить событие"
        isMenuButtonVisible: false

        BackButton {

        }

        SaveButton {
            onClick: {
                save();
            }
        }
    }

    function save() {
        console.log("save event");
    }

    // type of event for save from menu
    property int idType: -1

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

            Menu {
                id: eventTypeMenu
                /* Repater { */
                /*     model: modelTypes */
                /* } */
                MenuItem {
                    text: "встреча"
                    onTriggered:  changeButtonTitle(selectEventTypeButton);
                }

                MenuItem {

                    text: "просмотр недвижимости"
                    onTriggered:  changeButtonTitle(selectEventTypeButton);
                }

                MenuItem {

                    text: "переговоры"
                    onTriggered:  changeButtonTitle(selectEventTypeButton);
                }

                MenuItem {
                    text: "неформальная обстановка"
                    onTriggered:  changeButtonTitle(selectEventTypeButton);
                }
            }

             Button {
                id: selectEventTypeButton
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                onClicked: {
                    eventTypeMenu.popup();
                }
            }

            TimePicker{
                id: time
            }

            DatePicker{
                id: dateInput
            }

            TextArea{
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Место"
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Участники"
                onClicked: {
                    // TODO: list actors rewrite
                }
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                text: "Сохранить"
                onClicked: save();
            }
        }
    }
}
