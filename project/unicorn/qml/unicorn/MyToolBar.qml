import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "."

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


        Rectangle {
            Layout.fillWidth: true
        }
    }

    Text {
        id: titleText
        font.bold: true
        anchors.centerIn: parent
        font.pointSize: 14
        renderType: Text.NativeRendering
    }
}
