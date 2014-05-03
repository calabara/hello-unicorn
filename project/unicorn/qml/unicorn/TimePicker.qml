import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    property alias hour: timeH.value
    property alias minute: timeM.value

    width: timeLayout.width
    height: timeLayout.height

    function setTime(targetDate) {
        hour = targetDate.getHours();
        minute = targetDate.getMinutes();
    }

    RowLayout{
        id: timeLayout
        spacing: 3

        SpinBox{
            id: timeH
            maximum: 23
        }

        Text {
            renderType: Text.NativeRendering
            text: ":"
            font.pointSize: 30
        }

        SpinBox{
            id: timeM
            maximum: 59
        }
    }
}
