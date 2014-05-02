import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import event 1.0
import "."

Rectangle {
    anchors.fill: parent
    anchors.topMargin: 0
    color: "gray"

    MyToolBar {
        id: toolbar
        title: currentEvent.title
        isMenuButtonVisible: false

        BackButton{

        }

        EditButton{
            onClick: {
                contentView.show('editevent', currentEvent.idEvent);
            }
        }
    }

    Event {
        id: currentEvent
    }

    function loadEvent() {
        if (visible){
            var id_evt= contentView.getViewParam("viewevent");
            DbUtils.readEvent(id_evt, currentEvent);
        }
    }

    Component.onCompleted: {
        loadEvent();
    }

    onVisibleChanged: {
        loadEvent();
    }

    function getColor(id_type) {
        switch (currentEvent.type_id) {
            case 1: return "#bf3030";
            case 2: return "#87f03c";
            case 3: return "#7c71d8";
            case 4: return "#e9fa71";
            case 5: return "#04819e";
        }
    }

    PageContent{
        Substrate {
            color: getColor();
            ColumnLayout{
                spacing: 2
                anchors.margins: 40
                anchors.fill: parent

                Text {
                    id: eventTitle
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    renderType: Text.NativeRendering
                    text: currentEvent.title
                }

                Text{
                    id: eventType
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    renderType: Text.NativeRendering
                    width: parent.width
                    text: "Тип: " +
                            DbUtils.eventTypeAsString(currentEvent.type_id);
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    renderType: Text.NativeRendering
                    text: Qt.formatDateTime(currentEvent.dateEvent, 
                                "dd.mm.yyyy hh:mm")
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    renderType: Text.NativeRendering
                    text: "Место: " + currentEvent.place 
                }

                Text {
                    id: eventDeal
                    renderType: Text.NativeRendering
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    width: parent.width
                    text: "Сделка: " +
                            DbUtils.dealAdress(currentEvent.deal_id);
                }

                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: "Участники"
                    onClicked: {
                        contentView.show("ListActors");
                    }
                }
            }
        }
    }
}
