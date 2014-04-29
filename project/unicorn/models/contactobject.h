#ifndef CONTACTOBJECT_H
#define CONTACTOBJECT_H

#include <QtCore/QObject>

class ContactObject : public QObject
{
    Q_OBJECT

    QString m_name;
    QString m_surname;
    QString m_phone_number;
    int m_type_id;
    QString m_additional_info;
    int m_id_contact = -1;

public:
    explicit ContactObject(QObject *parent = 0);

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString surname READ surname WRITE setSurname NOTIFY surnameChanged)
    Q_PROPERTY(int id_contact READ id_contact WRITE setId_contact NOTIFY id_contactChanged)
    Q_PROPERTY(QString phone_number READ phone_number WRITE setPhone_number NOTIFY phone_numberChanged)
    Q_PROPERTY(int type_id READ type_id WRITE setType_id NOTIFY type_idChanged)
    Q_PROPERTY(QString additional_info READ additional_info WRITE setAdditional_info NOTIFY additional_infoChanged)

    QString name() const
    {
        return m_name;
    }

    QString surname() const
    {
        return m_surname;
    }

    QString phone_number() const
    {
        return m_phone_number;
    }

    int type_id() const
    {
        return m_type_id;
    }

    QString additional_info() const
    {
        return m_additional_info;
    }

    int id_contact() const
    {
        return m_id_contact;
    }

signals:

    void nameChanged(QString arg);

    void surnameChanged(QString arg);

    void phone_numberChanged(QString arg);

    void type_idChanged(int arg);

    void additional_infoChanged(QString arg);

    void id_contactChanged(int arg);

public slots:
    void setName(QString arg)
    {
        if (m_name != arg) {
            m_name = arg;
            emit nameChanged(arg);
        }
    }
    void setSurname(QString arg)
    {
        if (m_surname != arg) {
            m_surname = arg;
            emit surnameChanged(arg);
        }
    }

    void setPhone_number(QString arg)
    {
        if (m_phone_number != arg) {
            m_phone_number = arg;
            emit phone_numberChanged(arg);
        }
    }
    void setType_id(int arg)
    {
        if (m_type_id != arg) {
            m_type_id = arg;
            emit type_idChanged(arg);
        }
    }
    void setAdditional_info(QString arg)
    {
        if (m_additional_info != arg) {
            m_additional_info = arg;
            emit additional_infoChanged(arg);
        }
    }

    void setId_contact(int arg)
    {
        if (m_id_contact != arg) {
            m_id_contact = arg;
            emit id_contactChanged(arg);
        }
    }

    /// if id == -1 create else update exist 
    /// @return true if success write to DB
    bool save();

    /// Empty all field in this object
    void empty();
};

#endif // CONTACTOBJECT_H
