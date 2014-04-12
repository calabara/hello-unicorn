import QtQuick 2.0

Item {
    property int value: minimum
    property int maximum: 30
    property int minimum: 0
    property alias bckColor: rect.color

    signal changed

    width: rect.width + 20
    height: rect.height + upper.height * 2 + 50

    function upValue() {
        if (value < maximum) {
            value += 1;
            changed();
        }
    }

    function downValue() {
        if (value > minimum) {
            value -= 1;
            changed();
        }
    }

    property int normalY : rect.width / 2 + 10

    Rectangle {
        id: rect
        anchors.centerIn: parent
        anchors.topMargin: 2
        anchors.bottomMargin: 2
        opacity: .6
        width: outputValue.paintedWidth
        height: outputValue.height

        Text {
            id: outputValue
            anchors.centerIn: rect
            renderType: Text.NativeRendering
            font.pointSize: 30
            color: "black"
            text:{
                if ( value < 10 ) {
                    "0" + value;
                  } else {
                    value;
                  }
            }
        }

        Text {
            id: predValue
            anchors.top: outputValue.bottom
            anchors.topMargin: 1
            anchors.horizontalCenter: outputValue.horizontalCenter
            text: (value != minimum) ? value - 1: value;
            visible: false
            opacity: .5
        }

        Text {
            id: nextValue
            text: (value != maximum) ? value + 1: value;
            anchors.bottom: outputValue.top
            anchors.horizontalCenter: outputValue.horizontalCenter
            anchors.bottomMargin: 1
            visible: false
            opacity: .5
        }

        MouseArea {
            anchors.fill: rect
            drag.target: rect
            drag.axis: Drag.YAxis
            drag.minimumY: 2
            drag.maximumY: 5

            onPressed: {
                predValue.visible = true;
                nextValue.visible = true;
            }

            onPositionChanged: {
                if (mouseY > normalY) {
                    downValue();
                } else {
                    upValue();
                }
            }

            onReleased: {
                outputValue.opacity = 1;
                nextValue.visible = false;
                predValue.visible = false;
            }
        }
    }

    Image {
        id: upper
        width: 40
        height: outputValue.height / 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: rect.top
        anchors.bottomMargin: 25
        source: "qrc:/icons/triangle.png"
        Rectangle {
            width: rect.width
            height: parent.height + 10
            opacity: 0
            MouseArea {
                anchors.fill: parent
                onClicked: upValue();
            }
        }
    }

    Image {
        id: lower
        width: 40
        height: outputValue.height / 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: rect.bottom
        anchors.topMargin: 25
        source: "qrc:/icons/triangle.png"
        rotation: 180

        Rectangle {
            anchors.centerIn: parent
            width: rect.width
            height: parent.height + 10
            opacity: 0
            MouseArea {
                anchors.fill: parent
                onClicked: downValue();
            }
        }
    }

}
