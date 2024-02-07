namespace sap.btp.electronics;

using { UUID } from '@sap/cds/common';

entity BusinessPartner {
  key BusinessPartnerNumber       : UUID;
  name                            : String;
  address1                        : String;
  address2                        : String;
  city                            : String;
  state                           : String @cds.persistence.skip;
  pincode                         : String;
  isGstnRegistered               : Boolean;
  gstinNumber                     : String;
  isVendor                        : Boolean;
  isCustomer                      : Boolean;
}

entity Store {
  key StoreID                      : UUID;
  name                            : String;
  address1                        : String;
  address2                        : String;
  city                            : String;
  state                           : String @cds.persistence.skip;
  pincode                         : String;
}

entity Product {
  key ProductID                    : UUID;
  name                            : String;
  imageURL                        : String;
  costPrice                       : Decimal(15,2);
  sellPrice                       : Decimal(15,2);
}

entity StockData {
  key stockDataID                  : UUID;
  store_id                        : Association to Store;
  product_id                      : Association to Product;
  stockQty                        : Integer;
}

entity PurchaseOrder {
  key PurchaseOrderNumber          : UUID;
  businessPartner                 : Association to BusinessPartner;
  purchaseOrderDate               : DateTime;
  items                           : Composition of many PurchaseOrderItem on parent.purchaseOrder;
}

entity PurchaseOrderItem {
  key purchaseOrderItemID          : UUID;
  product_id                      : Association to Product;
  qty                             : Integer;
  price                           : Decimal(15,2);
  store_id                        : Association to Store;
}

entity SalesOrder {
  key SalesOrderNumber             : UUID;
  businessPartner                 : Association to BusinessPartner;
  salesDate                       : DateTime;
  items                           : Composition of many SalesOrderItem on parent.salesOrder;
}

entity SalesOrderItem {
  key salesOrderItemID             : UUID;
  product_id                      : Association to Product;
  qty                             : Integer;
  price                           : Decimal(15,2);
  store_id                        : Association to Store;
}
