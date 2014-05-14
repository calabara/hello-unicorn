import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.0
import "."

// Список дел
Rectangle {
    anchors.fill: parent
    color: "gray"
    property string sortColumn: "id";
    MyToolBar {
        id: toolbar
        title: ""

        isMenuButtonVisible: !backbutton.visible

        BackButton {
            id: backbutton
        }

        ColumnLayout {

            anchors.centerIn: parent
            Button {
                id: rangeEventsBtn
                anchors.horizontalCenter: parent.horizontalCenter
                text: "С начала времен"
                onClicked: {
                    menuRange.popup();
                }
            }

            Button {
                id: sortEventsBtn
                anchors.horizontalCenter: parent.horizontalCenter
                text: "по дате добавления"
                onClicked: {
                    menuSort.popup();
                }
            }
        }

        Menu {
            id: menuRange
            MenuItem {
                text: "С начала времен"
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
                text: "В этом месяце"
                onTriggered: {
                    rangeEventsBtn.text = text;
                }
            }

            MenuItem {
                text: "В этом году"
                onTriggered: {
                    rangeEventsBtn.text = text;
                }
            }
            MenuItem {
                text: "Ближайшие"
                onTriggered: {
                    rangeEventsBtn.text = text;
                }
            }
        }


        Menu {
            id: menuSort
            MenuItem {
                text: "по дате добавления"
                onTriggered: {
                    sortColumn = "id";
                    sortEventsBtn.text = text;
                }
            }

            MenuItem {
                text: "по типу"
                onTriggered: {
                    sortColumn = "type_id";
                    sortEventsBtn.text = text;
                }
            }

            MenuItem {
                text: "по алфавиту"
                onTriggered: {
                    sortColumn = "title";
                    sortEventsBtn.text = text;
                }
            }

        }

        AddButton {
            id: addbutton
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
        target.setMonth(targetDate.substring(4,5) - 1);
        target.setYear(targetDate.substring(6,10)*1);
        var rr = Math.abs(now - target) / 60 / 60/ 1000 / 24;

        console.log(rr);

        if (rangeEventsBtn.text == "В этом месяце") {
            return target.getFullYear() == now.getFullYear() && 
                    target.getMonth() == now.getMonth();
        }

        if (rangeEventsBtn.text == "В этом году") {
            return target.getFullYear() == now.getFullYear();
        }

        if (rangeEventsBtn.text == "За неделю") {
            return rr < 7;
        }
        if (rangeEventsBtn.text == "Ближайшие") {
            return rr < 2;
        }

        return true;
    }

    function loadModel(sortColumn) {
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
            // date, title, type_id, id
            OrgController.getEvents(id_deal, sortColumn);
        }
    }

    function load() {
        loadModel(sortColumn);
    }

    onVisibleChanged: load()
    Component.onCompleted: load()
    onSortColumnChanged: load()

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
                        bottom: parent.bottom
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
