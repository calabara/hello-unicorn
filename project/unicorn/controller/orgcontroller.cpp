#include "orgcontroller.h"

OrgController::OrgController(QQmlContext * context) :
    mContext(context) 
{
}

QString OrgController::getAllDeals() {
    return "getAll";
}

QString OrgController::getAllDeals(QString str) {
    return "get " + str;
}
