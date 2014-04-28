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
        title: "Квартира на ленинском"
        isMenuButtonVisible: false

        BackButton{

        }

        EditButton{
            onClick: {
                contentView.show('editcontact', 322);
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

                    id: dealTitle
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: "Квартира на ленинском"
                }

                Text {

                    id: dealMoney
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    width: parent.width

                    text: "300 000р."
                }

                Text{
                    id: dealState


                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    width: parent.width
                    text: "Статус: в процессе";

                }

                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: "Участники"
                    onClicked: {
                        contentView.currentPage = "ListActors";
                    }
                }

                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: "События"
                }

            }

        }
    }
}
