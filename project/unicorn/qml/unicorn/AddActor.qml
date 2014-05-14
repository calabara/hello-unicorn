import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

Rectangle {
    anchors.fill: parent
    color: "gray"
    MyToolBar {
        id: toolbar
        title: "Добавить"
        isMenuButtonVisible: false

        BackButton {
        }

        SaveButton {
            onClick: {
                save();
            }
        }
    }

    function save() {
        var id_target = contentView.getViewParam("AddActor");
        if (contentView.isDealActors) {
            DbUtils.execQuery("insert into deal_contact_mult (id_deal, id_contact, id_role) values(" +
                    id_target + ", " + 
                    id_contact + ", " + 
                    id_role + 
                ")"
            );
        } else {
            DbUtils.execQuery("insert into event_contact_mult (id_event, id_contact, id_role) values( " +
                    id_target + ", " + 
                    id_contact + ", " + 
                    id_role + 
                ")"
            );
        }
        contentView.goBack();
    }

    function loadData() {
        if (visible) {
            var roles = DbUtils.getRoles();
            console.log(roles);
            console.log(roles[0].title);
            for (var key in roles) {
                console.log(key);
                var item = roleMenu.addItem(roles[key].title);
                (function(localKey){
                    item.triggered.connect(function() {
                        id_role = roles[localKey].id_role;
                        chooseRole.text = roles[localKey].title;
                    });
                })(key);
            }
            chooseRole.text = roles[0].title;

            var contacts = DbUtils.getAllContactsAsList();
            contactMenu.clear();
            for (var key in contacts) {
                console.log(key);
                var item = contactMenu.addItem(contacts[key].name + " " 
                                                + contacts[key].surname);
                (function(localKey){
                    item.triggered.connect(function() {
                        id_contact= contacts[localKey].id_contact;
                        chooseContact.text = contacts[localKey].name + " " 
                                                + contacts[localKey].surname;
                    });
                })(key);
            }
            chooseContact.text = contacts[key].name + " " + contacts[key].surname;
        }
    }

    Component.onCompleted: {
        loadData();
    }

    onVisibleChanged: {
        loadData();
    }

    property int id_role: 1
    property int id_contact: 1

    PageContent {
        id: pageContent

        // TODO: line up normal colors

        ColumnLayout {
            width: parent.width / 1.5
            anchors.centerIn: parent
            spacing: 50

            Menu {
                id: contactMenu
            }

            Button {
                id: chooseContact
                Layout.fillWidth: true
                onClicked: {
                    contactMenu.popup();
                }
            }

            Menu {
                id: roleMenu
            }

            Button {
                id: chooseRole
                Layout.fillWidth: true
                onClicked: {
                    roleMenu.popup();
                }
            }

            Button {
                text: "OK"
                Layout.fillWidth: true
                onClicked: {
                    save();
                }
            }
        }

    }
}
