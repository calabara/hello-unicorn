import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
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
                console.log('AAAAAA');
            }
        }
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

                placeholderText: "Фамилия"
            }
            TextField {

                id: contactName
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                placeholderText: "Имя"
            }
            TextField {

                id: contactSecondname
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                placeholderText: "Отчество"
            }

            TextField {

                id: contactPhone
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width

                placeholderText: "+7993944959"
            }

            TextArea {
                id: otherInfo
                Layout.fillWidth: true
                height: 100
                text: "Дополнительная информация"
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Сохранить"

            }

        }
    }
}
