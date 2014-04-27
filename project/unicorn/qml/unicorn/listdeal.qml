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

    // return color
    function getColor(status) {
        if (status == "Успешно")
            return "lightgreen";
        if (status == "В процессе")
            return "#a9787f";
        if (status == "Отложена")
            return "lightblue";
        if (status == "Неудача")
            return "white";
    }

    onVisibleChanged: {
        // if we show this view reload model from Database
        if (visible) {
            var success = OrgController.getAllDeals();
            if (!success) {
                // TODO: show error to user
                console.log("error load model");
            }
            viewtrades.model = dealModel;
        }
    }

    Component.onCompleted:{
        if (visible) {
            var success = OrgController.getAllDeals();
            if (!success) {
                // TODO: show error to user
                console.log("error load model");
            }
            viewtrades.model = dealModel;
        }
    }

    PageContent {
        id: pageContent

        // TODO: line up normal colors
        ListView {
            id: viewtrades
            model: dealModel
            anchors.fill: parent
            spacing: 4

            delegate: Rectangle {
                width: viewtrades.width
                height: nameAchorText.height + adressText.height +
                        dateTradeText.height + summTradeText.height + typeText.height
                radius: 2

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
                    id: adressText
                    text: flatAdress
                    anchors {
                        left: parent.left
                        top: parent.top
                        topMargin: 6
                        leftMargin: 5
                    }
                    font {
                        bold: true
                    }
                    renderType: Text.NativeRendering
                }

                Text {
                    id: nameAchorText
                    text: ""
                    anchors.top: adressText.bottom
                    anchors.leftMargin: 5
                    anchors.left: parent.left
                    renderType: Text.NativeRendering
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
                    renderType: Text.NativeRendering
                }

                Text {
                    id: typeText
                    anchors.bottom: dateTradeText.top
                    anchors.bottomMargin: 2
                    anchors.leftMargin: 6
                    anchors.left: parent.left
                    text: state_key
                    renderType: Text.NativeRendering
                    font.bold: true
                }

                Text {
                    id: summTradeText
                    //text: if (status == "Успешно" || status == "В процессе") {
                    //         summ;
                    //      } else {
                    //          "    -     ";
                    //      }
                    text: price

//                    visible: status == "Успешно" || status == "В процессе"
                    anchors {
                        right: parent.right
                        rightMargin: 8
                        verticalCenter: parent.verticalCenter
                    }

                    font {
                        bold: true
                        pixelSize: nameAchorText.font.pixelSize * 1.5
                    }

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.top
                        anchors.bottomMargin: 2
                        text: max_price
                    }

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.bottom
                        anchors.topMargin: 2
                        text: min_price
                    }

                    renderType: Text.NativeRendering
                }
            }
        }
    }
}
