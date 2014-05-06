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
                console.log(currentEvent.idEvent);
                contentView.show('addevent', currentEvent.idEvent);
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

    property variant eventColor: ["#bf3030", "#87f03c","#7c71d8","#e9fa71","#04819e"]

    function deleteEvent() {
        if (currentEvent.idEvent != -1) {
            DbUtils.execQuery("delete from event where id=" 
                    + currentEvent.idEvent);
            contentView.goBack();
        }
    }

    PageContent{
        Substrate {
            color: eventColor[currentEvent.type_id - 1] || "white"
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
                        contentView.isDealActors = false;
                        contentView.show("ListActors", currentEvent.idEvent);
                    }
                }

                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    text: "Удалить"
                    visible: currentEvent.idEvent != -1
                    onClicked: deleteEvent();
                }
            }
        }
    }
}
