import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

Rectangle {
    width: 260
    height: 360
    id: root

    property variant pagesList  : [
        "editdeal",
        "listdeal",
        "editevent",
        "listevent"
    ];

    // Set this property to another file name to change page
    property string  currentPage : "editdeal";

    Repeater {
        model: pagesList;
        delegate: Loader {
            active: false;
            asynchronous: true;
            anchors.fill: parent;
            visible: (currentPage === modelData);
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


}

