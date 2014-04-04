import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

Rectangle {
    id: root
    width: 260
    height: 360

    property bool menuShow: false
    function onMenu() {
        gameTranslate.x = root.menuShow ? 0 : root.width * 0.9
        root.menuShow = !root.menuShow;
    }

    PageList {
        id: pageList
    }

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
                            horizontalCenter: parent.horizontalCenter;
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

    Rectangle {
        anchors.fill: parent
        id: pageLayout

        Rectangle {
            id: contentView
            anchors.fill: parent
            width: parent.width
            height: parent.height
//            height: parent.height - toolbar.height

            property string currentPage : "listdeal";

            Repeater {
                model: pageList;
                delegate: Loader {
                    active: false;
                    asynchronous: true;
                    anchors.fill: parent;
                    visible: (contentView.currentPage === filename);
                    source: "%1.qml".arg(filename)
                    onVisibleChanged:      { loadIfNotLoaded(); }
                    Component.onCompleted: { loadIfNotLoaded(); }

                    function loadIfNotLoaded () {
                        // to load the file at first show
                        if (visible && !active) {
                            active = true;
                        }
                    }
                }
            }


        }

        transform: Translate {
            id: gameTranslate
            x: 0
            Behavior on x { NumberAnimation { duration: 400; easing.type: Easing.OutQuad } }
        }
    }
}

