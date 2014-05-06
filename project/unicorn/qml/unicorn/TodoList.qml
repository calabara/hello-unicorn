import QtQuick 2.0

// Список дел
Rectangle {
    anchors.fill: parent
    color: "gray"

    MyToolBar {
        id: toolbar
        title: "Органайзер"

        BackButton {
            id: backbutton
        }

        AddButton {
            onClick: {
                contentView.show('addevent', -1);
            }
        }
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
                height: titleText.height + dateText.height +
                        placeText.height +  20
                radius: 2
                color: eventColor[type_id - 1]

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
