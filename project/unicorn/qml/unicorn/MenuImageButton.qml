import QtQuick 2.0

Item {

    anchors.right: parent.right
    anchors.rightMargin: 3
    anchors.verticalCenter: parent.verticalCenter

    height: parent.height * 0.7
    width: Math.max(parent.width / 10, height)
    signal click


    property string iconSource: ""

    Image {
        source: iconSource
        height: parent.height
        width: parent.width
        MouseArea {
            anchors.fill: parent
            onClicked: click()
        }
    }
}
