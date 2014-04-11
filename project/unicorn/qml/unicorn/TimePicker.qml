import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    property alias hour: timeH.value
    property alias minute: timeM.value

    width: timeLayout.width
    height: timeLayout.height

    RowLayout{
        id: timeLayout
        spacing: 3

        SpinBox{
            id: timeH
            anchors.left: parent.left
            maximum: 23

        }
        SpinBox{
            id: timeM
            anchors.left: timeH.right
            maximum: 59
        }
    }
}
