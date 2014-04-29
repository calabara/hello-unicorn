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
        title: "Добавить клиента"
        isMenuButtonVisible: false

        BackButton {
            id: back
        }

        SaveButton {
            onClick: {
                if (validate()) {
                    contact.save();
                    contentView.goBack();
                }
            }
        }
    }

    function validate() {
        // TODO: validate input
        return true;
    }

    function loadContact() {
        if (visible) {
            var id_c = contentView.getViewParam("addcontact");
            if (id_c == -1) {
                contact.empty();
            } else {
                DbUtils.readContact(id_c, contact);
            }
            setContact();
            console.log(id_c);
        }
    }

    Component.onCompleted: {
        loadContact();
    }

    onVisibleChanged: {
        loadContact();
    }

    function setContact() {
        contactName.text = contact.name;
        contactSurname.text = contact.surname;
        contactPhone.text = contact.phone_number;
        otherInfo.text = contact.additional_info;
    }

    Contact {
        id: contact
        name: contactName.text
        surname: contactSurname.text
        phone_number: contactPhone.text
        additional_info: otherInfo.text
    }

    PageContent{
        ColumnLayout{
            spacing: 4
            anchors.margins: 40
            anchors.fill: parent

            TextField {
                id: contactSurname
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                
                text: ""
                placeholderText: "Фамилия"
            }
            TextField {

                id: contactName
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                placeholderText: "Имя"
                text: ""
            }

            TextField {

                id: contactPhone
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width
                text: ""

                placeholderText: "+7993944959"
            }

            TextArea {
                id: otherInfo
                Layout.fillWidth: true
                height: 100
                
                text: ""
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                text: "Сохранить"
                onClicked: {
                    if (validate()) {
                        contact.save();
                        contentView.goBack();
                    }
                }
            }

        }
    }
}
