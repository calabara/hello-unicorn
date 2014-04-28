import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0


Rectangle {
    anchors.fill: parent
    width: parent.width
    height: parent.height
    
    property string currentPage : "TodoList"
    property variant pageStack: []
    property variant params: { }


    function setViewParam(paramId, value) {

        var p = {};

        for (prop in contentView.params) {
            p[prop] = contentView.params[prop];
        }

        p[paramId] = value;
        contentView.params = p;
    }
    function getViewParam(paramId) {
        return contentView.params[paramId];
    }

    function goBack() {

        var stack = contentView.pageStack;
        stack.pop();
        var page = stack.pop();

        if (page !== undefined) {
            contentView.currentPage = page;
        }

        stack.push(page);
        contentView.pageStack = stack;

        // console.log(contentView.pageStack, contentView.currentPage);
    }

    Keys.onReleased: {
        if (event.key == Qt.Key_Back) {
            contentView.goBack();
            event.accepted = true
        }
    }

    Repeater {
        model: pageList;
        delegate: Loader {
            id: pageLoader
            active: false;
            asynchronous: true;
            anchors.fill: parent;
            visible: (contentView.currentPage === filename);
            source: "%1.qml".arg(filename)
            onVisibleChanged:      { loadIfNotLoaded(); pushPageStack(); }
            Component.onCompleted: { loadIfNotLoaded(); pushPageStack(); }
            
            function pushPageStack () {
                if(visible) {

                    var stack = contentView.pageStack;

                    stack.push(contentView.currentPage);
                    contentView.pageStack = stack;

                    // console.log(contentView.pageStack, contentView.currentPage);
                }
            }

            function loadIfNotLoaded () {
                // to load the file at first show
                if (visible && !active) {
                    active = true;

                }

            }
        }
    }
}
