#ifndef EVENTOBJECT_H
#define EVENTOBJECT_H

#include <QtCore/QObject>
#include <QtCore/QDate>

class EventObject : public QObject
{
    Q_OBJECT

    QString m_title;
    QString m_place;
    int m_deal_id;
    int m_type_id;
    int m_id = -1;

    QDateTime m_dateEvent;

public:
    explicit EventObject(QObject *parent = 0);

    Q_PROPERTY(int idEvent READ idEvent WRITE setIdEvent NOTIFY idEventChanged)
    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)
    Q_PROPERTY(QDateTime dateEvent READ dateEvent WRITE setDateEvent NOTIFY dateEventChanged)
    Q_PROPERTY(QString place READ place WRITE setPlace NOTIFY placeChanged)
    Q_PROPERTY(int deal_id READ deal_id WRITE setDeal_id NOTIFY deal_idChanged)
    Q_PROPERTY(int type_id READ type_id WRITE setType_id NOTIFY type_idChanged)


    QString title() const
    {
        return m_title;
    }

    QString place() const
    {
        return m_place;
    }

    int deal_id() const
    {
        return m_deal_id;
    }

    int type_id() const
    {
        return m_type_id;
    }

    int idEvent() const
    {
        return m_id;
    }

    QDateTime dateEvent() const
    {
        return m_dateEvent;
    }

signals:

    void titleChanged(QString arg);
    void placeChanged(QString arg);
    void deal_idChanged(int arg);
    void type_idChanged(int arg);
    void idEventChanged(int arg);

    void dateEventChanged(QDateTime arg);

public slots:

    void setTitle(QString arg)
    {
        if (m_title != arg) {
            m_title = arg;
            emit titleChanged(arg);
        }
    }

    void setPlace(QString arg)
    {
        if (m_place != arg) {
            m_place = arg;
            emit placeChanged(arg);
        }
    }

    void setDeal_id(int arg)
    {
        if (m_deal_id != arg) {
            m_deal_id = arg;
            emit deal_idChanged(arg);
        }
    }

    void setType_id(int arg)
    {
        if (m_type_id != arg) {
            m_type_id = arg;
            emit type_idChanged(arg);
        }
    }

    void setIdEvent(int arg)
    {
        if (m_id != arg) {
            m_id = arg;
            emit idEventChanged(arg);
        }
    }

    void setDateEvent(QDateTime arg)
    {
        if (m_dateEvent != arg) {
            m_dateEvent = arg;
            emit dateEventChanged(arg);
        }
    }


    /// update object to DataBase if id != -1
    /// else create new object and write
    bool save();

    /// fill all fields to empty and set id to -1
    void empty();
};

#endif // EVENTOBJECT_H
