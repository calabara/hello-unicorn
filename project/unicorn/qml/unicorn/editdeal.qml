import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "."
import "Validators.js" as Validators

Rectangle {
    anchors.fill: parent
    anchors.topMargin: 0
    color: "gray"

    MyToolBar {
        id: toolbar
        title: "Редактировать "
        isMenuButtonVisible: false
        BackButton {
            id: back
        }

        SaveButton {
            onClick: {
                saveDeal();
            }
        }
    }

    function saveDeal() {

        curDeal.price = (dealMoney.text !== "") ? dealMoney.text*1 : -1;
        console.log("price = " + dealMoney.text);
        curDeal.max_price = dealmaxMoney.text * 1;

        var moneyField = { text: dealMoney.text, errorText: "договорились на сумме", type: 'money'},
            maxMoneyField = { text: dealmaxMoney.text, errorText: "минимальная цена", type: 'money'};
            
        var isValid = Validators.validate([moneyField,maxMoneyField]);
        if (!isValid) {

            errorMessageDialog.text = Validators.wrongFields;
            errorMessageDialog.visible = true;
            return;
        }

        curDeal.flatAdress = dealTitle.text;
        curDeal.state_key = states[curIndexState].idState;

        curDeal.save();
        contentView.goBack();
    }

    Component.onCompleted: {
        loadDeal();
        states = DbUtils.getAllStatesDealAsList();
        for (var key in states) {
            console.log(key);
            var item = stateMenu.addItem(states[key].title);
            if (curDeal.state_key == states[key].idState){
                curIndexState = key;
            }
            (function(localKey){
                item.triggered.connect(function() {
                    curIndexState = localKey;
                    stateBtn.text = states[curIndexState].title;
                });
            })(key);
        }
        stateBtn.text = states[curIndexState].title;
    }

    onVisibleChanged: {
        loadDeal();
    }

    function loadDeal() {
        if (visible) {
            OrgController.getDeal(curDeal.id_deal);
            dealTitle.text = curDeal.flatAdress;
            dealMoney.text = curDeal.price != -1 ? curDeal.price : "";
            dealmaxMoney.text = curDeal.max_price;
        }
    }
    
    property variant states: null
    property int curIndexState: 0

    PageContent{
        ColumnLayout{
            spacing: 4
            anchors.margins: 40
            anchors.fill: parent

            TextField {
                id: dealTitle
                text: curDeal.flatAdress
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                placeholderText: "Адрес"
            }

            TextField {
                id: dealMoney
                text: curDeal.price != -1 ? curDeal.price : ""
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width
                placeholderText: "Договорились на сумме"
            }

            TextField {
                id: dealmaxMoney
                text: curDeal.max_price
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width

                placeholderText: "Желаемая сумма"
            }

            Menu {
                id: stateMenu
            }

            Button {
                id: stateBtn
                Layout.fillWidth: true
                onClicked: {
                    stateMenu.popup();
                }
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true

                text: "Сохранить"
                onClicked: {
                    saveDeal();
                }
            }
        }
    }
}
