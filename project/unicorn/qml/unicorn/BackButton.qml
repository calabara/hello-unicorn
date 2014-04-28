import QtQuick 2.0


Item {
    anchors.left: parent.left
    anchors.rightMargin: 3
    anchors.verticalCenter: parent.verticalCenter
    height: parent.height
    width: Math.max(parent.width / 10, height)

    Image {
        anchors.fill: parent
        source: "qrc:/icons/back.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                contentView.goBack();
            }
        }
    }
}
