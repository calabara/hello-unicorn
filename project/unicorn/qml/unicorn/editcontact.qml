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
        title: "Редактировать"
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

                id: dealTitle
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                text: "jaja"  + contentView.getViewParam('editcontact');
                placeholderText: "Адрес"
            }

            TextField {

                id: dealMoney
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width

                placeholderText: "Сумма"
            }

            ComboBox{
                id: dealState
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width

            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Участники"

            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "События"
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Сохранить"

            }
        }
    }
}
