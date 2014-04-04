import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

Rectangle {
    anchors.fill: parent
    width: parent.width
    height: parent.height
    
    property string currentPage : "listdeal";
    
    Repeater {
        model: pageList;
        delegate: Loader {
            id: pageLoader
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
