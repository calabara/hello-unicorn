import QtQuick 2.0

Item {

    function click() {
        console.log("save.");
    }

    MenuImageButton {
        iconSource: "qrc:/icons/glyphicons_446_floppy_save.png"
        click: click
    }

}
