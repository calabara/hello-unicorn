import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Dialogs 1.1
import "."
import "Validators.js" as Validators

Rectangle {
    anchors.fill: parent
    anchors.topMargin: 0
    color: "gray"


    MyToolBar {
        id: toolbar
        title: "Добавить сделку"
        isMenuButtonVisible: false

        BackButton{
        }

        SaveButton {
            onClick: {
                saveDeal();
            }
        }
    }

    function saveDeal() {

        var addressField = { text: dealAdress.text, errorText: "адрес", type: 'title'},
            minMoneyField = { text: dealminMoney.text, errorText: "минимальная цена", type: 'money'},
            maxMoneyField = { text: dealmaxMoney.text, errorText: "максимальная цена", type: 'money'};
            
        var isValid = Validators.validate([addressField,minMoneyField,maxMoneyField]);
        if (!isValid) {

            errorMessageDialog.text = Validators.wrongFields;
            errorMessageDialog.visible = true;
            return;
        }


        var success = OrgController.addDeal(dealminMoney.text *1, 1, dealmaxMoney.text * 1, 1,
                dealAdress.text, new Date());

        if (!success) {
            console.log("error add");
        } else {
            console.log("save deal");
            OrgController.getAllDeals();
        }

        contentView.goBack();
    }

    PageContent{
        ColumnLayout{
            spacing: 4
            anchors.margins: 40
            anchors.fill: parent

            TextField {
                id: dealAdress
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                property bool hit: false

                placeholderText: "Адрес"
                
            }

            TextField {
                id: dealmaxMoney
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                property bool hit: false

                placeholderText: "Желаемая сумма"
            }

            TextField {
                id: dealminMoney
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                property bool hit: false

                placeholderText: "Минимальная сумма"
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
