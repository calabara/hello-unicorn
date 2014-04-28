import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "."

Rectangle {
    anchors.fill: parent
    anchors.topMargin: 0
    color: "gray"

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
                console.log('AAAAAA');
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

            Menu {
                id: eventTypeMenu
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

                text: "тип события"
                onClicked: {
                    eventTypeMenu.popup();
                }

            }

            TimePicker{
                id: time
            }

            DatePicker{
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
                    onTriggered:  changeButtonTitle(selectDealButton);
                }
                MenuItem {

                    text: "Сделка 2"
                    onTriggered:  changeButtonTitle(selectDealButton);
                }
                MenuItem {

                    text: "стадион в сочи"
                    onTriggered:  changeButtonTitle(selectDealButton);
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
