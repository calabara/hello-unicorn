import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

Rectangle {
    id: root
    width: 260
    height: 360

    property variant pagesList  : [
        "editdeal",
        "listdeal",
        "editevent",
        "listevent"
    ];

    property bool menuShow: false

    Rectangle {
        id: menuView
        anchors.fill: parent
        color: "#303030";
        opacity: root.menuShow ? 1 : 0
        enabled: root.menuShow
        Behavior on opacity { NumberAnimation { duration: 300 } }

        ListView {
            anchors { fill: parent; margins: 22 }
            model: contentView.pagesList
            delegate:
                Item {
                height: 80
                width: parent.width
                Text {
                    anchors {
                        left: parent.left
                        leftMargin: 12
                        verticalCenter: parent.verticalCenter
                    }
                    color: "white"; font.pixelSize: 32; text: "%1".arg(modelData)
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
                        contentView.currentPage = modelData;
                        onMenu();
                    }
                }
            }
        }
    }

    function onMenu() {
        gameTranslate.x = root.menuShow ? 0 : root.width * 0.9
        root.menuShow = !root.menuShow;
    }


    // Set this property to another file name to change page
    Rectangle {
        anchors.fill: parent
        id: contentView

        property variant pagesList  : [
            "editdeal",
            "listdeal"
        ];

        property string currentPage : "listdeal";


        Repeater {
            model: contentView.pagesList;
            delegate: Loader {
                active: false;
                asynchronous: true;
                anchors.fill: parent;
                visible: (contentView.currentPage === modelData);
                source: "%1.qml".arg(modelData)
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

        MouseArea {
            anchors.fill: parent
            enabled: root.menuShow
            onClicked: root.onMenu();
        }

        transform: Translate {
            id: gameTranslate
            x: 0
            Behavior on x { NumberAnimation { duration: 400; easing.type: Easing.OutQuad } }
        }
    }
}

