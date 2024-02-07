namespace com.electronics;

// Master Data Entities
entity BusinessPartner {
  key BusinessPartnerNumber   : UUID;
  Name                        : String;
  Address1                    : String;
  Address2                    : String;
  City                        : String;
  State                       : String @cds.persistence.skip;
  PINCode                     : String;
  Is_gstn_registered          : Boolean;
  GSTINNumber                 : String @cds.validating.match(/[0-9A-Z]{15}/);
  Is_vendor                   : Boolean;
  Is_customer                 : Boolean;
}

entity Store {
  key StoreID                  : UUID;
  Name                        : String;
  Address1                    : String;
  Address2                    : String;
  City                        : String;
  State                       : String @cds.persistence.skip;
  PINCode                     : String;
}

entity Product {
  key ProductID                : UUID;
  ProductName                 : String;
  ProductImageURL             : String @cds.validating.url;
  ProductCostPrice            : Decimal(10,2);
  ProductSellPrice            : Decimal(10,2);
}

// Transactional Data Entities
entity StockData {
  key store_id                  : UUID;
  key product_id                : UUID;
  stock_qty                    : Integer;
}

entity PurchaseApp {
  key PurchaseOrderNumber       : UUID;
  BusinessPartner               : Association to BusinessPartner;
  PurchaseOrderDate            : DateTime;
  Items                        : Composition of many PurchaseItem on many PurchaseApp;
}

entity PurchaseItem {
  key purchase_item_id         : UUID;
  product_id                   : UUID;
  qty                          : Integer;
  price                        : Decimal(10,2);
  store_id                     : UUID;
}

entity SalesApp {
  key SalesOrderNumber          : UUID;
  BusinessPartner               : Association to BusinessPartner;
  SalesDate                    : DateTime;
  Items                        : Composition of many SalesItem on many SalesApp;
}

entity SalesItem {
  key sales_item_id            : UUID;
  product_id                   : UUID;
  qty                          : Integer;
  price                        : Decimal(10,2);
  store_id                     : UUID;
}
