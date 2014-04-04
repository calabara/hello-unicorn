import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

Rectangle {
    id: menuView
    anchors.fill: parent
    color: "#303030";
    opacity: root.menuShow ? 1 : 0
    enabled: root.menuShow
    Behavior on opacity { NumberAnimation { duration: 300 } }
    
    ListView {
        anchors { fill: parent; margins: 22 }
        model: pageList
        delegate:
            Component {
            Rectangle {
                height: 40
                visible: inMenu
                width: parent.width
                color: "transparent"
                Text {
                    anchors {
                        left: parent.left
                        leftMargin: 12
                        verticalCenter: parent.verticalCenter
                    }

                    color: "white"; font.pixelSize: 14;
                    text: title
                }
                
                Rectangle {
                    height: 2; width: parent.width * 0.7;
                    color: "gray";
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        bottom: parent.bottom
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        contentView.currentPage = filename;
                        onMenu();
                    }
                }
            }
        }
        SwipeArea {
            anchors.fill: parent
            propagateComposedEvents: true
            onSwipe: {
                if (direction == "left"){
                    onMenu();
                }
            }
        }
    }
}
