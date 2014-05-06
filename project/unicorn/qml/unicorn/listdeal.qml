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

        AddButton {
            onClick: {
                contentView.show('adddeal');
            }
        }

    }

    property variant stateColor: ["lightgrey", "#e9fa71","#ff2a52","lightgreen"];

    function loadModel() {
        // if we show this view reload model from Database
        if (visible) {
            var isActual = contentView.getViewParam("listdeal") == 1 ? true : false;

            var success = isActual ? OrgController.getActualDeals() : OrgController.getAllDeals();
            if (!success) {
                // TODO: show error to user
                console.log("error load model");
            }
            viewtrades.model = dealModel;
        }
    }

    onVisibleChanged: loadModel()
    Component.onCompleted: loadModel()

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

                color: stateColor[state_key - 1]

                border {
                    color: "black"
                    width: 1
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        contentView.show("viewdeal", id);
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
                    text: DbUtils.statusAsString(state_key);
                    renderType: Text.NativeRendering
                    font.bold: true
                }

                Text {
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.bottomMargin: 20
                    anchors.rightMargin: 70
                    text: max_price
                    renderType: Text.NativeRendering
                }

                Text {
                    id: summTradeText
                    text: price != -1 ? price : ""

                    anchors {
                        right: parent.right
                        rightMargin: 60
                        verticalCenter: parent.verticalCenter
                    }

                    font {
                        bold: true
                        pixelSize: nameAchorText.font.pixelSize * 1.5
                    }

                    // Text {
                    //     anchors.horizontalCenter: parent.horizontalCenter
                    //     anchors.top: parent.bottom
                    //     anchors.topMargin: 2
                    //     visible: false
                    //     text: min_price
                    // }

                    renderType: Text.NativeRendering
                }
            }
        }
    }
}
