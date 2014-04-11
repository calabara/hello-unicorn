import QtQuick 2.0
import QtQuick.Layouts 1.1

Rectangle {
    width: 600
    height: 400

    ColumnLayout{
        spacing: 50
        anchors.centerIn: parent
        TimePicker{
            id: time
        }
        DatePicker{
        }
    }

}
