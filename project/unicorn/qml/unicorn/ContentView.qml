import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0


Rectangle {
    anchors.fill: parent
    width: parent.width
    height: parent.height
    
    property string currentPage : null
    property variant pageStack: []
    property variant params: { }

    Component.onCompleted: {
        contentView.show("TodoList");
    }

    property bool isDealActors: true

    function show(view, param) {        
        if (typeof param === 'undefined') {
            param = -1;
            console.log(param);
        }
        contentView.setViewParam(view, param);
        
        contentView.currentPage = 'null';
        contentView.currentPage = view;
    }

    function setViewParam(paramId, value) {
        var p = {};

        for (var prop in contentView.params) {
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
            currentPage = page;
        }

        stack.push(page);
        contentView.pageStack = stack;
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
