import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "."

///
Item {
    id: pageContent
    anchors.top: toolbar.bottom
    width: parent.width
    height: parent.height - toolbar.height
}
