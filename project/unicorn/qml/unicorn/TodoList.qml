import QtQuick 2.0

// Список дел
Rectangle {
    anchors.fill: parent
    color: "gray"

    MyToolBar {
        id: toolbar
        title: "Органайзер"


        AddButton {
            onClick: {
                contentView.show('addevent');
            }
        }

    }

    function loadModel() {
        if (visible) {
            var id_deal = contentView.getViewParam("TodoList");
            OrgController.getEvents(id_deal);
            console.log(id_deal);
        }
    }

    onVisibleChanged: {
        loadModel();
    }

    Component.onCompleted: {
        loadModel();
    }

    function getColor(id_type) {
        switch (id_type) {
            case 1: return "#bf3030";
            case 2: return "#87f03c";
            case 3: return "#7c71d8";
            case 4: return "#e9fa71";
            case 5: return "#04819e";
        }
    }

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
                color: getColor(type_id);

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
