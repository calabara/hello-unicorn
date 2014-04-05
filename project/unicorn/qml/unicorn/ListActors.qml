import QtQuick 2.0

Rectangle {
    id: listTrades
    anchors.fill: parent
    anchors.topMargin: 0
    color: "gray"

    MyToolBar {
        id: toolbar
        title: "Участиники"

        Image {
            id: addContactBtn
            anchors.right: parent.right
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/glyphicons_190_circle_plus.png"

            height: parent.height *0.7
            width: Math.max(parent.width / 10, height)

            MouseArea {
                anchors.fill: parent
                onClicked: {
                     contentView.currentPage = "AddActor";
                }
            }
        }
    }

    function compareDate(date) {
        // TODO: implements this. color selection logic
        return true;
    }

    ListModel {
        id: contactsModel
        ListElement {
            name: "Иванов И.И."
            role: "Покупатель"
        }

        ListElement {
            name: "Басков И.И."
            role: "Продователь"
        }

        ListElement {
            name: "Басков И.И."
            role: "Свидетель"
        }
    }

    PageContent {
        id: pageContent

        // TODO: line up normal colors
        ListView {
            id: viewcontacts
            model: contactsModel
            anchors.fill: parent
            spacing: 4

            delegate: Rectangle {
                width: viewcontacts.width
                height: nameText.height + roleText.height + 50;
                radius: 2

                border {
                    color: "black"
                    width: 1
                }


                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                         contentView.currentPage = "viewcontact";
                    }
                }

                Text {
                    id: nameText
                    text: name

                    anchors {
                        left: parent.left
                        top: parent.top
                        topMargin: 6
                        leftMargin: 2
                    }

                    font.bold: true
                }

                Text {
                    id: roleText
                    text: role
                    anchors.top: nameText.bottom
                    anchors.leftMargin: nameText.anchors.leftMargin
                    anchors.left: nameText.left
                }

            }
        }
    }
}

