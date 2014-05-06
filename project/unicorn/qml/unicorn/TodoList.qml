import QtQuick 2.0
import QtQuick.Controls 1.1

// Список дел
Rectangle {
    anchors.fill: parent
    color: "gray"

    MyToolBar {
        id: toolbar
        title: ""

        BackButton {
            id: backbutton
        }

        Button {
            id: rangeEventsBtn
            anchors.centerIn: parent
            text: "Все"
            onClicked: {
                menuRange.popup();
            }
        }

        Menu {
            id: menuRange
            MenuItem {
                text: "Все"
                onTriggered: {
                    rangeEventsBtn.text = text;
                }
            }

            MenuItem {
                text: "За неделю"
                onTriggered: {
                    rangeEventsBtn.text = text;
                }
            }

            MenuItem {
                text: "За месяц"
                onTriggered: {
                    rangeEventsBtn.text = text;
                }
            }

            MenuItem {
                text: "За год"
                onTriggered: {
                    rangeEventsBtn.text = text;
                }
            }
        }

        AddButton {
            onClick: {
                contentView.show('addevent', -1);
            }
        }
    }

    function applyFilter(targetDate) {
        // magic. I dont know javascript, and network not avalible
        var now = new Date();
        var target = new Date();
        target.setDate(targetDate.substring(0,3));
        target.setMonth(targetDate.substring(4,5) - 2);
        target.setYear(targetDate.substring(6,10)*1);
        var rr = Math.abs(now - target) / 60 / 60/ 1000 / 24;

        if (rangeEventsBtn.text == "За месяц") {
            return target.getFullYear() == now.getFullYear() && 
                    target.getMonth() == now.getMonth();
        }

        if (rangeEventsBtn.text == "За год") {
            return target.getFullYear() == now.getFullYear();
        }

        if (rangeEventsBtn.text == "За неделю") {
            return rr < 7;
        }

        return true;
    }

    function loadModel() {
        if (visible) {
            var id_deal = contentView.getViewParam("TodoList");
            console.log("load events deal - " + id_deal);
            if (id_deal == -1) {
                toolbar.isMenuButtonVisible = true;
                backbutton.visible = false;
            } else {
                toolbar.isMenuButtonVisible = false;
                backbutton.visible = true;
            }
            OrgController.getEvents(id_deal);
        }
    }

    onVisibleChanged: {
        loadModel();
    }

    Component.onCompleted: {
        loadModel();
    }

    property variant eventColor: ["#bf3030", "#87f03c","#7c71d8","#e9fa71","#04819e"]

    PageContent {
        id: pageContent

        // TODO: line up normal colors
        ListView {
            id: viewtrades
            model: eventsModel
            anchors.fill: parent
            spacing: 4

            delegate: Rectangle {
                width: viewtrades.width
                height: applyFilter(date) ? titleText.height + dateText.height +
                        placeText.height +  20 : 0;
                radius: 2
                color: eventColor[type_id - 1]
                visible: applyFilter(date);

                border {
                    color: "black"
                    width: 2
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        contentView.show("viewevent", id);
                        /* contentView.currentPage = "viewevent"; */
                    }
                }

                Text {
                    id: titleText
                    text: eventTitle

                    anchors {
                        left: parent.left
                        top: parent.top
                        margins: 5
                    }

                    font {
                        bold: true
                    }
                }

                Text {
                    id: placeText
                    text: place
                    anchors.top: titleText.bottom
                    anchors.leftMargin: titleText.anchors.leftMargin
                    anchors.left:  titleText.left
                    anchors.margins: 5
                }

                Text {
                    id: dateText
                    text: date

                    anchors {
                        top: parent.top
                        /* bottomMargin: 7 */
                        right: parent.right
                        /* leftMargin: 6 */
                        margins: 5
                    }
                }
            }
        }
    }
}
