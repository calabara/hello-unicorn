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
        title: ""
        isMenuButtonVisible: true
        Button {
            id: rangeEventsBtn
            anchors.centerIn: parent
            text: "За месяц"
            onClicked: {
                menuRange.popup();
            }
            onTextChanged: {
                calcStats();
            }
        }

        Menu {
            id: menuRange
            MenuItem {
                text: "За месяц"
                onTriggered: {
                    rangeEventsBtn.text = text;
                }
            }

            MenuItem {
                text: "За год"
                onTriggered: {
                    rangeEventsBtn.text = text;
                }
            }
        }
    }

    Component.onCompleted: {
        load();
    }

    onVisibleChanged: {
        load();
    }

    function load() {
        if (visible) {
            calcStats();
        }
    }

    function calcStats() {
        var deals = DbUtils.getAllDealsAsList();
        var startDate = new Date();
        var endDate = new Date();

        if (rangeEventsBtn.text == "За год") {
            startDate.setTime(startDate.getTime() - 183* 86400000);
            endDate.setTime(endDate.getTime() + 183* 86400000);
        } else if (rangeEventsBtn.text == "За месяц") {
            startDate.setTime(startDate.getTime() - 15* 86400000);
            endDate.setTime(endDate.getTime() + 15* 86400000);
        }

        var price = 0;
        var tCountLocal = 0;
        var fCountLocal = 0;
        for (var key in deals) {
            var deal = deals[key];
            var target = deal.dateTrade;
            console.log(deal.flatAdress);
            console.log("t : " + target);
            console.log("e : " + endDate);
            console.log("s : " + startDate);
            console.log(isDateInRange(target, startDate, endDate));
            if (isDateInRange(target, startDate, endDate)) {
                console.log(deal.flatAdress);
                fCountLocal += 1;
                if (deal.state_key == 4) {
                    console.log("t");
                    tCountLocal += 1;
                    if (deal.price != -1) {
                        price += deal.price;
                    }
                }
            }
        }
        
        tCount.text = tCountLocal + "";
        fCount.text = fCountLocal + "";
        mCount.text = price + "";
    }

    function isDateInRange(targetDate, startDate, endDate) {
        return targetDate >= startDate && targetDate <= endDate;
    }


    PageContent {
        Substrate {
            Text {
                id: dealStat
                text: "Удачные/Все"
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                renderType: Text.NativeRendering
                font.pixelSize: tCount.font.pixelSize * 2

                RowLayout {
                    anchors.top: parent.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: tCount
                        text: "0"
                        renderType: Text.NativeRendering
                        color: "green"
                    }

                    Text {
                        text: "/"
                    }

                    Text {
                        id: fCount
                        text: "0"
                        renderType: Text.NativeRendering
                        color: "blue"
                    }
                }
            }

            Text {
                id: moneyStat
                anchors.top: dealStat.bottom
                anchors.topMargin: 60
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Прибыль: "
                font.pixelSize: mCount.font.pixelSize * 2
                renderType: Text.NativeRendering
                Text {
                    id: mCount
                    anchors.top: moneyStat.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    renderType: Text.NativeRendering
                    text: "0"
                }
            }
        }
    }
}
