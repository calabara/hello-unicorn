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
        title: "Васильев И.И."
        isMenuButtonVisible: false

        BackButton{

        }

        EditButton{
            onClick: {
                contentView.setViewParam('editcontact', 32);
                contentView.currentPage = 'editcontact';
            }
        }
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

                    text: "Васильев, id:" + contentView.getViewParam('viewcontact');
                }
                Text {

                    id: contactName
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: "Иван"
                }
                Text {

                    id: contactSecondname
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: "Иванович"
                }

                Text {

                    id: contactPhone
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    width: parent.width

                    text: "+7993944959"
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
                        text: "Дом. телефон: 832978.\n Какой-то текст. Звонить после обеда."
                    }
                }

            }
        }
    }
}
