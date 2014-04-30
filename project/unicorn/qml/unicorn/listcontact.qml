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

        AddButton {
            onClick: {
                contentView.show('addcontact', -1);
            }
        }
    }

    function loadModel() {
        if (visible) {
            OrgController.getAllContacts(2);
            contentView.setViewParam("contact_type", 2);
        }
    }

    Component.onCompleted: loadModel();
    onVisibleChanged: loadModel();

    PageContent {
        id: pageContent

        // TODO: line up normal colors
        ListView {
            id: viewcontacts
            model: contactModel
            anchors.fill: parent
            spacing: 4

            delegate: Rectangle {
                width: viewcontacts.width
                height: nameText.height + phoneText.height + 30;
                radius: 2

                border {
                    color: "black"
                    width: 1
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        /* contentView.setViewParam('addcontact', id); */
                        /* console.log("p: " + contentView.getViewParam('viewcontact')) */
                        /* contentView.currentPage = "viewcontact"; */
                        contentView.show("viewcontact", id);
                    }
                }
                Text {
                    id: nameText
                    text: name + " " + surname

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
                    text: phone_number
                    anchors.top: nameText.bottom
                    anchors.leftMargin: nameText.anchors.leftMargin
                    anchors.left: nameText.left
                }

            }
        }
    }
}
