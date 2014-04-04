import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "."

Rectangle {
    id: menuView
    anchors.fill: parent
    color: "#303030";
    opacity: root.menuShow ? 1 : 0
    enabled: root.menuShow

    function getOpacity(curTitle) {
        if (getCurrentTitle() == curTitle)
            return 1.0;
        return 0.5;
    }

    function getCurrentTitle() {
        var curPage = contentView.currentPage;
        for (var i = 0; pageList.count ; ++i) {
            var page = pageList.get(i).filename;
            if (page == curPage) {
                return pageList.get(i).title;
            }
        }
    }

    Behavior on opacity { NumberAnimation { duration: 300 } }
    
    ListView {
        anchors { fill: parent; topMargin: 20;}
        model: pageList
        spacing: 5
        delegate:
            Component {
            Rectangle {
                height: textTitle.height * 2
                visible: inMenu
                width: parent.width
                color: "transparent"
                
                Rectangle {
                    anchors.fill: parent
                    anchors.rightMargin: 4
                    color: "gray"
                    opacity: getOpacity(textTitle.text);

                    radius: 2
                    border.width: 1
                    border.color: "black"
                }

                Text {
                    id: textTitle
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "white";
                    text: title
                    renderType: Text.NativeRendering
                    font.bold: true
                    scale: 1.3
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
