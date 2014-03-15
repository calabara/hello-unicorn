import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0


Rectangle{
    anchors.fill:parent
    anchors.topMargin: 0

    property variant deals: [
        "Комсомольский 35",
        "Квартира 8",
        "Номер 5",
        "Привет",
        "Двадцать 5",
        "Добрый вечер",

    ];


    ListView {
        model: parent.deals
        anchors.fill: parent
        delegate:
            Item {
            height: 30
            width: parent.width

            Text {
                anchors {
                    left: parent.left
                    leftMargin: 12
                    verticalCenter: parent.verticalCenter
                }
                color: "black"; font.pixelSize: 14; text: "%1".arg(modelData)
            }

            Rectangle {
                height: 1; width: parent.width;
                color: "gray";
                anchors {
                    horizontalCenter: parent.horizontalCenter;
                    bottom: parent.bottom
                }
            }

        }
    }

}

