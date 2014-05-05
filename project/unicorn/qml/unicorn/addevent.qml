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

    Event {
        id: currentEvent
        place: placeText.text
        title: eventTitle.text
    }

    function save() {
        // TODO: validate

        // build dateTime
        currentEvent.dateEvent = new Date(
            dateInput.year,
            dateInput.month,
            dateInput.day,
            timeInput.hour,
            timeInput.minute
        );

        currentEvent.save();

        contentView.goBack();
    }

    function loadEvent() {
        if (visible){
            var id_evt= contentView.getViewParam("addevent");
            if (id_evt != -1) {
                DbUtils.readEvent(id_evt, currentEvent);
            } else {
                currentEvent.empty();
                var id_deal = contentView.getViewParam("TodoList");
                if (id_deal != -1) {
                    currentEvent.deal_id = id_deal;
                }
            }

            dateInput.setDate(currentEvent.dateEvent);
            timeInput.setTime(currentEvent.dateEvent);
            setEvent();
        }
    }

    Component.onCompleted: {
        loadEvent();

        OrgController.getAllActiveDealsAsList();
        console.log(activeDeals.keys);
        for (var key in activeDeals) {
            console.log(key);
            var item = dealMenu.addItem(activeDeals[key].flatAdress);
            (function(localKey){
                item.triggered.connect(function() {
                    currentEvent.deal_id = activeDeals[localKey].id_deal;
                });
            })(key);
        }

        for (var key in eventTypes) {
            var item = eventTypeMenu.addItem(eventTypes[key].title);
            // thanks pragmadash :)
            (function(localKey){
                item.triggered.connect(function() {
                    idType = eventTypes[localKey].idType;
                });
            })(key);
        }

    }

    onVisibleChanged: {
        loadEvent();
    }

    function setEvent() {
        eventTitle.text = currentEvent.title;
        placeText.text = currentEvent.place;
    }

    // type of event for savingfrom menu
    property alias idType: currentEvent.type_id

    function getTitleEvent() {
        for (var key in eventTypes) {
            if (eventTypes[key].idType == idType) {
                return eventTypes[key].title;
            }
        }
        return "";
    }

    function getFlatAdress() {
        for (var key in activeDeals) {
            if (activeDeals[key].id_deal == currentEvent.deal_id) {
                return activeDeals[key].flatAdress;
            }
        }
        return "Адрес";
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

            Menu {
                id: eventTypeMenu
            }

            Button {
                id: selectEventTypeButton
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                text: getTitleEvent();
                onClicked:{
                    eventTypeMenu.popup();
                }
            }

            Menu {
                id: dealMenu
            }

            Button {
                id: selectDealMenu
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                text: getFlatAdress();
                onClicked: {
                    dealMenu.popup();
                }
            }

            TimePicker{
                id: timeInput
            }

            DatePicker{
                id: dateInput
            }

            TextArea{
                id: placeText
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
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
