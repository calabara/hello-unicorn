import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

ListModel  {

    ListElement { pageId: "listcontact"; filename: "listcontact"; title: "Клиенты"; inMenu: true; }
    ListElement { pageId: "TodoList"; filename: "TodoList"; title: "Органайзер"; inMenu: true; }
    ListElement { pageId: "actuallistdeal"; filename: "listdeal"; title: "Актуальные сделки"; inMenu: true; param: 1}

    ListElement { pageId: "Connections"; filename: "Connections"; title: "Деловые связи"; inMenu: true; }

    ListElement { pageId: "editdeal"; filename: "editdeal"; title: "Редактировать сделку"; inMenu: false; }

    ListElement { pageId: "adddeal"; filename: "adddeal"; title: "Добавить сделку"; inMenu: false; }
    ListElement { pageId: "listdeal"; filename: "listdeal"; title: "Сделки"; inMenu: true;  }
    ListElement { pageId: "addcontact"; filename: "addcontact"; title: "Добавить контакт"; inMenu: false; }
    ListElement { pageId: "editcontact"; filename: "editcontact"; title: "Редактировать контакт"; inMenu: false; }
    ListElement { pageId: "addevent"; filename: "addevent"; title: "Добавить событие"; inMenu: false; }
    ListElement { pageId: "Statistics"; filename: "Statistics"; title: "Стастистика"; inMenu: true; }

    ListElement { pageId: "ListActors"; filename: "ListActors"; title: "Участники"; inMenu: false; }
    ListElement { pageId: "AddActor"; filename: "AddActor"; title: "Выбор участника"; inMenu: false; }

    ListElement { pageId: "viewevent"; filename: "viewevent"; title: "Добавить событие"; inMenu: false; }
    ListElement { pageId: "viewcontact"; filename: "viewcontact"; title: "Добавить событие"; inMenu: false; }
    ListElement { pageId: "viewdeal"; filename: "viewdeal"; title: "Добавить событие"; inMenu: false; }
    ListElement { pageId: "null"; filename: "null"; title: "null"; inMenu: false; }
}

