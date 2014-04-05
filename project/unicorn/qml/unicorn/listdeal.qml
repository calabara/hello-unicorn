import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "."

Rectangle {
    id: listTrades
    anchors.fill: parent
    anchors.topMargin: 0
    color: "gray"

    MyToolBar {
        id: toolbar
        title: "Сделки"

        Image {
            id: addDealBtn
            anchors.right: parent.right
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/icons/glyphicons_190_circle_plus.png"

            height: parent.height *0.7
            width: Math.max(parent.width / 10, height)
            MouseArea {
                anchors.fill: parent
                onClicked: {
                     contentView.currentPage = "adddeal";
                }
            }
        }
    }

    function compareDate(date) {
        // TODO: implements this. color selection logic
        return true;
    }

    ListModel {
        id: tradesModel
        ListElement {
            nameAchors: "Иванов И.И."
            summ: "500 000 р"
            dateTrade: "5.05.12"
            percent: "10"
            flatAdress: "успех"
            status: "Успешно"
        }

        ListElement {
            nameAchors: "Васильков И.И."
            summ: "300 000 р"
            dateTrade: "10.05.12"
            percent: "10"
            flatAdress: "в процессе"
            status: "В процессе"
        }

        ListElement {
            nameAchors: "Иванов И.И."
            summ: "500 000 р"
            dateTrade: "5.05.12"
            percent: "10"
            flatAdress: "неудача"
            status: "Неудача"
        }

        ListElement {
            nameAchors: "Иванов И.И."
            summ: "500 000 р"
            dateTrade: "5.05.12"
            percent: "10"
            flatAdress: "в процессе"
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
                height: nameAchorText.height + adress.height + dateTradeText.height + summTradeText.height
                radius: 2
                color: compareDate(dateTrade) ? "#f2092c" : "#a9787f";

                border {
                    color: "black"
                    width: 1
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                         contentView.currentPage = "viewdeal";
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
                        bottom: parent.bottom
                        bottomMargin: 7
                        left: parent.left
                        leftMargin: 6
                    }
                }

                Text {
                    id: summTradeText
                    text: summ
                    anchors {
                        right: parent.right
                        rightMargin: 8
                        verticalCenter: parent.verticalCenter
                    }

                    font {
                        bold: true
                        pixelSize: nameAchorText.font.pixelSize * 1.5
                    }


                }
            }
        }
    }
}
