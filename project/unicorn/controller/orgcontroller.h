#include <QtCore/QObject>
#include <QtQml/QQmlContext>


class OrgController : public QObject {
    Q_OBJECT
public:
    OrgController(QQmlContext * context);

    Q_INVOKABLE
    QString getAllDeals();
    Q_INVOKABLE
    QString getAllDeals(QString str);
private:
    QQmlContext * mContext;
};
