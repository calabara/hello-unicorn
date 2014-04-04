import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

//
// area for swipe events
// signal swipe with direction: up, down, left, right
//
MouseArea {
    property bool press : false
    property point origin
    //
    property int threshold: 150
    property bool disableVerticalSwipe: true

    signal swipe(string direction)
    signal move(int x, int y)

    function swipeOnX(origina, mouse) {
        swipe(mouse.x - origin.x < 0 ? "left" : "right");
    }

    function swipeOnY(origina, mouse) {
        if (!disableVerticalSwipe)
            swipe(mouse.y - origin.y < 0 ? "up" : "down");
    }
    
    onPressed: {
        drag.axis = Drag.XAndYAxis;
        origin = Qt.point(mouse.x, mouse.y);
    }

    onPositionChanged: {
        switch (drag.axis) {
        case Drag.XAndYAxis:
            var diffX = Math.abs(mouse.x - origin.x);
            var diffY = Math.abs(mouse.y - origin.y);
            if (diffX > threshold) {
                swipeOnX(origin, mouse);
            } else if (diffY > threshold) {
                swipeOnY(origin, mouse);
            }
            break;
        }
    }
}
