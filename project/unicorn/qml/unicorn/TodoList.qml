import QtQuick 2.0

// Список дел
Rectangle {
    anchors.fill: parent
    MyToolBar {
        id: toolbar
        title: "Органайзер"

        Image {
            id: addEventBtn
            anchors.right: parent.right
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/glyphicons_190_circle_plus.png"

            height: parent.height *0.7
            width: Math.max(parent.width / 10, height)
            MouseArea {
                anchors.fill: parent
                onClicked: {
                     contentView.currentPage = "addevent";
                }
            }
        }
    }


    ListModel {
        id: tradesModel
        ListElement {
            nameAchors: "Встреча с нотариусом"
            summ: "500 000 р"
            dateTrade: "5.05.12, 12:15"
            percent: "10"
            flatAdress: "встреча"
            status: "Успешно"
        }

        ListElement {
            nameAchors: "Ужин с родителями"
            summ: "300 000 р"
            dateTrade: "10.05.12"
            percent: "10"
            flatAdress: "встреча"
            status: "В процессе"
        }

        ListElement {
            nameAchors: "Купание в бассеине"
            summ: "500 000 р"
            dateTrade: "5.05.12"
            percent: "10"
            flatAdress: "звонок"
            status: "Неудача"
        }

        ListElement {
            nameAchors: "Дворцовый переворот"
            summ: "500 000 р"
            dateTrade: "5.05.12"
            percent: "10"
            flatAdress: "звонок"
            status: "Отложена"
        }
    }

    PageContent {
        id: pageContent

        // TODO: line up normal colors
        ListView {
            id: viewtrades
            model: tradesModel
            anchors.fill: parent
            spacing: 4

            delegate: Rectangle {
                width: viewtrades.width
                height: nameAchorText.height + adress.height + 20
                radius: 2

                border {
                    color: "black"
                    width: 1
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                         contentView.currentPage = "viewevent";
                    }
                }

                Text {
                    id: nameAchorText
                    text: nameAchors

                    anchors {
                        left: parent.left
                        top: parent.top
                        topMargin: 6
                        leftMargin: 2
                    }

                    font {
                        bold: true
                    }
                }

                Text {
                    id: adress
                    text: flatAdress
                    anchors.top: nameAchorText.bottom
                    anchors.leftMargin: nameAchorText.anchors.leftMargin
                    anchors.left: nameAchorText.left
                }

                Text {
                    id: dateTradeText
                    text: dateTrade

                    anchors {
                        top: parent.top
                        bottomMargin: 7
                        right: parent.right
                        leftMargin: 6
                    }
                }

              }
        }
    }


    // TODO: impelements this
}
