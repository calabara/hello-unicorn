import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

ToolBar {
    anchors.top: parent.top
    width: parent.width
    height: parent.height / 10

    property bool isMenuButtonVisible: true

    property alias title: titleText.text

    RowLayout {
        id:toolbarLayout

        spacing: 10
        anchors.fill: parent
        anchors.margins: 3
        
        ToolButton {
            anchors.margins: 3
            iconSource:  "qrc:/icons/glyphicons_158_show_lines.png"
            scale: 1.7
            visible: isMenuButtonVisible
            onClicked: {
                root.onMenu();
            }
        }

        Text {
            id: titleText
            font.bold: true
            font.pointSize: 14
            renderType: Text.NativeRendering
        }

        Rectangle {
            Layout.fillWidth: true
        }

//        Image {
//            anchors.margins: 3
//            height: toolbar.height
//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                    root.onMenu()
//                }
//            }
            
//            anchors.verticalCenter: parent.verticalCenter
//            id: menuIcon
//            source: "qrc:/icons/glyphicons_158_show_lines.png"
//        }
        
//        Loader {
//            id: toolbarLoader
//        }
        
//        Text {
//            id: title
//            font.pointSize: 14
//            text: "Сделки"
            
//        }
        
//        Rectangle {
//            Layout.fillWidth: true
//        }
        
//        Image {
//            id: addDeal
//            anchors.margins: 3
//            height: toolbar.height
            
//            MouseArea{
//                anchors.fill: parent
//                onClicked: {
//                }
//            }
            
//            anchors.verticalCenter: parent.verticalCenter
//            source: "qrc:/icons/glyphicons_432_plus.png"
//        }
    }

}
