import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.0
import "."

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

    function validateField(field) {
        if (field.text == "") {
            field.hit = true;
            return false;
        }
        return true;
    }

    function validate() {
        return validateField(dealAdress) &&
                validateField(dealmaxMoney) &&
                validateField(dealminMoney);
    }

    function saveDeal() {
        if (!validate())
            return;

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
                // TODO: wtf??!
                id: dealAdress
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                property bool hit: false

                style: TextFieldStyle {
                    textColor: "black"
                    background: Rectangle {
                        radius: 2
                        implicitWidth: 100
                        implicitHeight: 24
                        border.color: "red"
                        border.width: dealAdress.hit ? 3 : 0
                   }
                }

                placeholderText: "Адрес"
            }

            TextField {
                id: dealmaxMoney
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width
                validator: IntValidator {bottom: 10; top: 9000000;}
                property bool hit: false

                style: TextFieldStyle {
                    textColor: "black"
                    background: Rectangle {
                        radius: 2
                        implicitWidth: 100
                        implicitHeight: 24
                        border.color: "red"
                        border.width: dealmaxMoney.hit ? 3 : 0
                   }
                }

                placeholderText: "Желаемая сумма"
            }

            TextField {
                id: dealminMoney
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
                width: parent.width
                validator: IntValidator {bottom: 10; top: 9000000;}
                property bool hit: false

                style: TextFieldStyle {
                    textColor: "black"
                    background: Rectangle {
                        radius: 2
                        implicitWidth: 100
                        implicitHeight: 24
                        border.color: "red"
                        border.width: dealminMoney.hit ? 2 : 0
                   }
                }

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
