import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

ListModel  {

    ListElement { filename: "listcontact"; title: "Клиенты"; inMenu: true; }
    ListElement { filename: "TodoList"; title: "Органайзер"; inMenu: true; }
    ListElement { filename: "listdeal"; title: "Актуальные сделки"; inMenu: true; }

    ListElement { filename: "Connections"; title: "Деловые связи"; inMenu: true; }

    ListElement { filename: "editdeal"; title: "Редактировать сделку"; inMenu: false; }
    ListElement { filename: "adddeal"; title: "Добавить сделку"; inMenu: false; }
    ListElement { filename: "listdeal"; title: "Сделки"; inMenu: true; }
    ListElement { filename: "addcontact"; title: "Добавить контакт"; inMenu: false; }
    ListElement { filename: "addevent"; title: "Добавить событие"; inMenu: false; }

    ListElement { filename: "ListActors"; title: "Участники"; inMenu: false; }
    ListElement { filename: "AddActor"; title: "Выбор участника"; inMenu: false; }

    ListElement { filename: "viewevent"; title: "Добавить событие"; inMenu: false; }
    ListElement { filename: "viewcontact"; title: "Добавить событие"; inMenu: false; }
    ListElement { filename: "viewdeal"; title: "Добавить событие"; inMenu: false; }
}
