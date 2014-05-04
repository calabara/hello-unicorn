#ifndef DEALSTATEOBJECT_H
#define DEALSTATEOBJECT_H

#include <QObject>

class DealStateObject : public QObject
{
    Q_OBJECT
    int m_idState;

    QString m_title;

public:
    explicit DealStateObject(QObject *parent = 0);

    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)
    Q_PROPERTY(int idState READ idState WRITE setIdState NOTIFY idStateChanged)

    int idState() const
    {
        return m_idState;
    }

    QString title() const
    {
        return m_title;
    }

signals:

    void idStateChanged(int arg);

    void titleChanged(QString arg);

public slots:

    void setIdState(int arg)
    {
        if (m_idState != arg) {
            m_idState = arg;
            emit idStateChanged(arg);
        }
    }
    void setTitle(QString arg)
    {
        if (m_title != arg) {
            m_title = arg;
            emit titleChanged(arg);
        }
    }
};

#endif // DEALSTATEOBJECT_H
