import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import contact 1.0
import "."

Rectangle {
    anchors.fill: parent
    anchors.topMargin: 0
    color: "gray"

    MyToolBar {
        id: toolbar
        title: contact.name + " " + contact.surname
        isMenuButtonVisible: false

        BackButton{

        }

        EditButton{
            onClick: {
                contentView.show('addcontact', contact.id_contact);
            }
        }
    }

    Contact {
        id: contact
    }

    function loadContact() {
        if (visible){
            var id_con = contentView.getViewParam("viewcontact");
            DbUtils.readContact(id_con, contact);
            console.log(id_con);
            deleteBtn.visible = contact.isBeCanDelete();
        }
    }

    Component.onCompleted: {
        loadContact();
    }

    onVisibleChanged: {
        loadContact();
    }

    PageContent{

        Substrate {
            ColumnLayout{
                spacing: 4
                anchors.margins: 40
                anchors.fill: parent

                Text {

                    id: contactSurname
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: contact.name
                }
                Text {

                    id: contactName
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: contact.surname
                }

                Text {

                    id: contactPhone
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    width: parent.width

                    text: contact.phone_number
                }

                Rectangle {
                    color: "white"
                    Layout.fillWidth: true
                    height: 200
                    border.width: 1
                    border.color: "black"
                    Text {
                        anchors.margins: 10
                        anchors.fill: parent
                        text: contact.additional_info
                    }
                }

                Button {
                    id: deleteBtn
                    text: " Удалить "
                    onClicked: {
                        contact.deleteContact();
                        contentView.goBack();
                    }
                }
            }
        }
    }
}
