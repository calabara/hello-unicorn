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

            }
        }
    }


    PageContent {
        id: pageContent

        // TODO: line up normal colors

        ColumnLayout {
            width: parent.width
            anchors.margins: 22
            spacing: 50
            ComboBox {
                id: chooseContact
                Layout.fillWidth: true
                model: ["Иванов И.И. "]
            }

            ComboBox {
                id: chooseRole
                Layout.fillWidth: true
                model: ["Покупатель"]
            }

            Button {
                text: "OK"
                Layout.fillWidth: true
                onClicked: {
                    contentView.currentPage = "ListActors";
                }
            }
        }

    }


    // TODO: impelements this
}
