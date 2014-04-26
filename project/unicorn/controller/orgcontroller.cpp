#include "orgcontroller.h"

#include "models/orgsqlmodel.h"

OrgController::OrgController(QQmlContext * context) :
    mContext(context) {
    DBaseConnector::Instance()->initConnection();
}

OrgController::~OrgController() {
    DBaseConnector::Instance()->closeConnection();
}

bool OrgController::getAllDeals() {

    return true;
}

