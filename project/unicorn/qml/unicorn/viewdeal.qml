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
                var id_deal = contentView.getViewParam("id_deal");
                contentView.show('editdeal', id_deal);
            }
        }
    }

    function loadDeal() {
        if (visible) {
            var id_deal = contentView.getViewParam("id_deal");
            OrgController.getDeal(id_deal);
        }
    }

    Component.onCompleted: {
        loadDeal();
    }

    onVisibleChanged: {
        loadDeal();
    }

    PageContent{
        Substrate {
            // TODO: set color from state
            ColumnLayout {
                spacing: 4
                anchors.margins: 40
                anchors.fill: parent

                Text {
                    id: dealTitle
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true

                    text: curDeal.flatAdress
                }

                Text {
                    id: dealMoney
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    width: parent.width
                    font.bold: true

                    text: (curDeal.price != -1) ? curDeal.price : ""
                }

                Text {
                    id: dateTrade
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    width: parent.width
                    font.bold: true

                    text: Qt.formatDateTime(curDeal.dateTrade, 
                                "dd.mm.yyyy hh:mm")

                }


                Text {
                    id: dealMaxMoney
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    width: parent.width
                    text: "Желаемая сумма: " + curDeal.max_price
                }

                Text {
                    id: dealState
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    width: parent.width
                    text: DbUtils.statusAsString(curDeal.state_key);
                }

                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    text: "Участники"
                    onClicked: {
                        var id_deal = contentView.getViewParam("id_deal");
                        contentView.isDealActors = true;
                        contentView.show("ListActors", id_deal);
                    }
                }

                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    text: "События"
                    onClicked: {
                        var id_deal = contentView.getViewParam("id_deal");
                        contentView.show("TodoList", id_deal);
                    }
                }
            }

        }
    }
}
