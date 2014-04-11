import QtQuick 2.0

Rectangle {
    id: listConnections
    anchors.fill: parent
    anchors.topMargin: 0
    color: "gray"

    MyToolBar {
        id: toolbar
        title: "Деловые связи"

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
                     contentView.currentPage = "addcontact";
                }
            }
        }
    }

    ListModel {
        id: contactsModel
        ListElement {
            name: "Иванов И.И."
            phone: "+79234567812"
            type: "Нотариус"
        }
        ListElement {
            name: "Иванов И.И."
            phone: "+79234567812"
            type: "Связист"
        }
        ListElement {
            name: "Иванов И.И."
            phone: "+79234567812"
            type: "Минер"
        }
        ListElement {
            name: "Иванов И.И."
            phone: "+79234567812"
            type: "Хозяин ларька"
        }
        ListElement {
            name: "Иванов И.И."
            phone: "+79234567812"
            type: "Администратор"
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
                height: nameText.height + phoneText.height + 60;
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

                    font {
                        bold: true
                        pointSize: 14
                    }

                    renderType: Text.NativeRendering
                }

                Text {
                    id: typeText
                    text: type
                    anchors.top: nameText.bottom
                    anchors.leftMargin: nameText.anchors.leftMargin
                    anchors.left: nameText.left
                    font.bold: true
                    renderType: Text.NativeRendering
                }

                Text {
                    id: phoneText
                    text: phone
                    anchors.top: typeText.bottom
                    anchors.leftMargin: typeText.anchors.leftMargin
                    anchors.left: typeText.left
                    renderType: Text.NativeRendering
                }

            }
        }
    }
}