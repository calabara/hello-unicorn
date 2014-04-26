#include "orgcontroller.h"

OrgController::OrgController(QQmlContext * context) :
    mContext(context) {
    DBaseConnector::Instance()->initConnection();
    model = new OrgSqlModel();
}

OrgController::~OrgController() {
    DBaseConnector::Instance()->closeConnection();
    delete model;
}

bool OrgController::getAllDeals() {
    model->setQuery("select * from deal");
    mContext->setContextProperty("dealModel", model);
    // mContext->setContextProperty("dealModel", model);
    if (model->lastError().isValid()) {
        return false;
    }
    return true;
}

