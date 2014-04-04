import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

ListModel  {
    id: pageList
    
    ListElement { filename: "listdeal"; title: "Сделки"; inMenu: true; }
    ListElement { filename: "listevent"; title: "События"; inMenu: true; } 
    ListElement { filename: "TodoList"; title: "Органайзер"; inMenu: true; }
    ListElement { filename: "editdeal"; title: "Добавить сделку"; inMenu: false; }
    
}
