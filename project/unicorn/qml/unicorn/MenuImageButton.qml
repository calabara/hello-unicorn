import QtQuick 2.0

Item {

    anchors.right: parent.right
    anchors.rightMargin: 3
    anchors.verticalCenter: parent.verticalCenter

    height: parent.height * 0.7
    width: Math.max(parent.width / 10, height)

    function click() {
        console.log("clicked");
    }

    property string iconSource: ""

    Image {

        source: iconSource

        MouseArea {
            anchors.fill: parent
            onClicked: click()
        }
    }
}
