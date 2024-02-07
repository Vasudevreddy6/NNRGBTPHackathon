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
  IsGSTNRegistered            : Boolean;
  //GSTINNumber                 : String @cds.validating.match(/[0-9A-Z]{15}/);
  IsVendor                    : Boolean;
  IsCustomer                  : Boolean;
  // Add a comment here to describe the purpose of the BusinessPartner entity
}

entity Store {
  key StoreID                  : UUID;
  Name                        : String;
  Address1                    : String;
  Address2                    : String;
  City                        : String;
  State                       : String @cds.persistence.skip;
  PINCode                     : String;
  // Add a comment here to describe the purpose of the Store entity
}

entity Product {
  key ProductID                : UUID;
  ProductName                 : String;
  ProductImageURL             : String @cds.validating.url;
  ProductCostPrice            : Decimal(10,2);
  ProductSellPrice            : Decimal(10,2);
  // Add a comment here to describe the purpose of the Product entity
}

// Transactional Data Entities
entity StockData {
  key store_id                  : UUID;
  key product_id                : UUID;
  stock_qty                    : Integer;
  // Add a comment here to describe the purpose of the StockData entity
}

entity PurchaseApp {
  key PurchaseOrderNumber       : UUID;
  BusinessPartner               : Association to BusinessPartner;
  PurchaseOrderDate            : DateTime;
  //Items                        : Composition of many PurchaseItem on many PurchaseApp;
  // Add a comment here to describe the purpose of the PurchaseApp entity
}

entity PurchaseItem {
  key purchase_item_id         : UUID;
  product_id                   : UUID;
  qty                          : Integer;
  price                        : Decimal(10,2);
  store_id                     : UUID;
  // Add a comment here to describe the purpose of the PurchaseItem entity
}

entity SalesApp {
  key SalesOrderNumber          : UUID;
  BusinessPartner               : Association to BusinessPartner;
 
}