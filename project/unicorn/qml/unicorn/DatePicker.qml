import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    property alias day: dateD.value
    property alias month: dateM.value
    property alias year: dateY.value

    width: dateLayout.width
    height: dateLayout.height

    function checkDaysInMonth(){
        var daysInMonth = new Date(year, month, 0);
        daysInMonth = daysInMonth.getDate();

        day = Math.min(day, daysInMonth);
        dateD.maximum = daysInMonth;
    }

    Component.onCompleted: {
        var date = new Date();

        day = date.getDay();
        month = date.getMonth() + 1;
        year = date.getFullYear();
    }

    RowLayout{
        id: dateLayout


        SpinBox{
            id: dateD
            minimum: 1
        }

        Text {
            renderType: Text.NativeRendering
            text: "."
            font.pointSize: 30
        }

        SpinBox{
            id: dateM
            maximum: 12
            minimum: 1

            onChanged: checkDaysInMonth()

        }

        Text {
            renderType: Text.NativeRendering
            text: "."
            font.pointSize: 30
        }

        SpinBox{
            id: dateY
            maximum: 2099
            minimum: 1

            onChanged: checkDaysInMonth()
        }
    }
}
