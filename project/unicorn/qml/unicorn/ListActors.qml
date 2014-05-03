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
        title: "Участиники"
        isMenuButtonVisible: false

        BackButton {
        }

        AddButton {
            onClick: {
                contentView.show('AddActor');
            }
        }
    }

    function loadActors() {
        if (visible) {
            if (contentView.isDealActors) {
                var id_deal = contentView.getViewParam("ListActors");
                OrgController.getDealActors(id_deal);
            } else {
                var id_event = contentView.getViewParam("ListActors");
                OrgController.getEventActors(id_event);
            }
        }
    }

    onVisibleChanged: {
        loadActors();
    }

    Component.onCompleted: {
        loadActors();
    }

    PageContent {
        id: pageContent

        // TODO: line up normal colors
        ListView {
            id: viewcontacts
            model: actorsModel
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
                        contentView.show("viewcontact", id_contact);
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

