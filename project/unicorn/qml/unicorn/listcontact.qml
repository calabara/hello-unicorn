import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "."

Rectangle {
    id: listTrades
    anchors.fill: parent
    anchors.topMargin: 0
    color: "gray"

    MyToolBar {
        id: toolbar
        title: "Клиенты"

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

    function compareDate(date) {
        // TODO: implements this. color selection logic
        return true;
    }

    ListModel {
        id: contactsModel
        ListElement {
            name: "Иванов И.И."
            phone: "+79234567812"
        }
        ListElement {
            name: "Иванов И.И."
            phone: "+79234567812"
        }
        ListElement {
            name: "Иванов И.И."
            phone: "+79234567812"
        }
        ListElement {
            name: "Иванов И.И."
            phone: "+79234567812"
        }
        ListElement {
            name: "Иванов И.И."
            phone: "+79234567812"
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
                height: nameText.height + phoneText.height + 20 ;
                radius: 2


                border {
                    color: "black"
                    width: 1
                }


                MouseArea {
                    anchors.fill: parent
                    onClicked: {

                        contentView.setViewParam('viewcontact', 5);
                        console.log("p: " + contentView.getViewParam('viewcontact'))
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
                    }
                }

                Text {
                    id: phoneText
                    text: phone
                    anchors.top: nameText.bottom
                    anchors.leftMargin: nameText.anchors.leftMargin
                    anchors.left: nameText.left
                }

            }
        }
    }
}
