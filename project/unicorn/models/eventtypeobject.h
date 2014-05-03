#ifndef EVETTYPE_SKFJHSJDF
#define EVETTYPE_SKFJHSJDF

#include <QtCore/QObject>

class EventTypeObject : public QObject {
    Q_OBJECT

    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)
    Q_PROPERTY(int idType READ idType WRITE setIdType NOTIFY idTypeChanged)

public:
    EventTypeObject(QObject * parent = NULL);

    QString title() const
    {
        return m_title;
    }

    int idType() const
    {
        return m_idType;
    }

public slots:
    void setTitle(QString arg)
    {
        if (m_title != arg) {
            m_title = arg;
            emit titleChanged(arg);
        }
    }

    void setIdType(int arg)
    {
        if (m_idType != arg) {
            m_idType = arg;
            emit idTypeChanged(arg);
        }
    }

signals:
    void titleChanged(QString arg);

    void idTypeChanged(int arg);

private:
    QString m_title;
    int m_idType;
};

#endif
