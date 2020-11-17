SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS `retailsales`.`Sales`;
DROP TABLE IF EXISTS `retailsales`.`VendorProduct`;
DROP TABLE IF EXISTS `retailsales`.`DimVendor`;
--DROP TABLE IF EXISTS `retailsales`.`ModelVendor`;
--DROP TABLE IF EXISTS `retailsales`.`VendorBrand`;
--DROP TABLE IF EXISTS `retailsales`.`ModelVendorBridge`;
--DROP TABLE IF EXISTS `retailsales`.`VendorBrandBridge`;
DROP TABLE IF EXISTS `retailsales`.`DimBrand`;
DROP TABLE IF EXISTS `retailsales`.`DimModel`;
DROP TABLE IF EXISTS `retailsales`.`DimProduct`;
DROP TABLE IF EXISTS `retailsales`.`DimProductSubcategory`;
DROP TABLE IF EXISTS `retailsales`.`DimProductCategory`;
--DROP TABLE IF EXISTS `retailsales`.`DimPromotion`;
--DROP TABLE IF EXISTS `retailsales`.`DimCurrency`;
DROP TABLE IF EXISTS `retailsales`.`DimCustomer`;
DROP TABLE IF EXISTS `retailsales`.`DimDate`;
DROP TABLE IF EXISTS `retailsales`.`DimGeography`;
--DROP TABLE IF EXISTS `retailsales`.`DimSalesTerritory`;




  

#DimProductCategory*/
CREATE TABLE `retailsales`.`DimProductCategory` (
  `CategoryKey` int unsigned NOT NULL AUTO_INCREMENT,
  `Category` nvarchar(50) NOT NULL,
  PRIMARY KEY (`CategoryKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  

#DimProductSubcategory*/
CREATE TABLE `retailsales`.`DimProductSubcategory` (
  `SubcategoryKey` int unsigned NOT NULL AUTO_INCREMENT,
  `Subcategory` nvarchar(50) NOT NULL,
  `CategoryKey` int unsigned NOT NULL,
  PRIMARY KEY (`SubcategoryKey`)
  
, CONSTRAINT `FKretailsales_DimProductSubcategory_CategoryKey` 
  FOREIGN KEY(`CategoryKey`)
  REFERENCES `retailsales`.`DimProductCategory` (`CategoryKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




#DimProduct*/
CREATE TABLE `retailsales`.`DimProduct` (
  `ProductKey` int unsigned NOT NULL AUTO_INCREMENT,
  `SubcategoryKey` int unsigned NOT NULL,
  `StandardCost` decimal(9,4) NULL,
  `ListPrice` decimal(9,4) NOT NULL,
  `Product` nvarchar(50) NOT NULL,
  `Size` decimal(9,4) NULL,
  `SizeUnitMeasureCode` nchar(3) NULL,
  `Weight` decimal(9,4) NULL,
  `WeightUnitMeasureCode` nchar(3) NULL,
  PRIMARY KEY (`ProductKey`)
  
, CONSTRAINT `FKretailsales_DimProduct_SubcategoryKey` 
  FOREIGN KEY(`SubcategoryKey`)
  REFERENCES `retailsales`.`DimProductSubcategory` (`SubcategoryKey`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  
#DimModel*/
CREATE TABLE `retailsales`.`DimModel` (
  `ModelKey` int unsigned NOT NULL,
  `ProductKey` int unsigned NOT NULL,
  `Model` nvarchar(50) NOT NULL,
  PRIMARY KEY (`ModelKey`)
  
, CONSTRAINT `FKretailsales_DimModel_ProductKey` 
  FOREIGN KEY(`ProductKey`)
  REFERENCES `retailsales`.`DimProduct` (`ProductKey`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




#DimBrand*/
CREATE TABLE `retailsales`.`DimBrand` (
  `BrandKey` int unsigned NOT NULL,
  `ProductKey` int unsigned NOT NULL,
  `Brand` nvarchar(50) NOT NULL,
  PRIMARY KEY (`BrandKey`)
  
, CONSTRAINT `FKretailsales_DimBrand_ProductKey` 
  FOREIGN KEY(`ProductKey`)
  REFERENCES `retailsales`.`DimProduct` (`ProductKey`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



#DimVendor*/
CREATE TABLE `retailsales`.`DimVendor` (
  `VendorKey` int unsigned NOT NULL AUTO_INCREMENT,
  `Vendor` nvarchar(50) NOT NULL,
  PRIMARY KEY (`VendorKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#VendorProduct*/
CREATE TABLE `retailsales`.`VendorProduct` (
  `PK` int unsigned NOT NULL AUTO_INCREMENT,
  `VendorKey` int unsigned NOT NULL,
  `ProductKey` int unsigned NOT NULL,
  PRIMARY KEY (`PK`)
  
, CONSTRAINT `FKretailsales_VendorProduct_ProductKey` 
  FOREIGN KEY(`ProductKey`)
  REFERENCES `retailsales`.`DimProduct` (`ProductKey`)
  
, CONSTRAINT `FKretailsales_VendorProduct_VendorKey` 
  FOREIGN KEY(`VendorKey`)
  REFERENCES `retailsales`.`DimVendor` (`VendorKey`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


  
  

  

#Geography*/
CREATE TABLE `retailsales`.`DimGeography` (
  `GeographyKey` int unsigned NOT NULL AUTO_INCREMENT,
  `City` nvarchar(50) NULL,
  `StateProvinceCode` varchar(3) NULL,
  `StateProvinceName` nvarchar(50) NULL,
  `CountryRegionCode` nvarchar(3) NULL,
  `CountryRegionName` nvarchar(50) NULL,
  `PostalCode` nvarchar(15) NOT NULL,
  PRIMARY KEY (`GeographyKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  

  
#DimCustomer*/
CREATE TABLE `retailsales`.`DimCustomer` (
  `CustomerKey` int unsigned NOT NULL AUTO_INCREMENT,
  `GeographyKey` int unsigned NOT NULL,
  `FirstName` nvarchar(50) NULL,
  `LastName` nvarchar(50) NULL,
  PRIMARY KEY (`CustomerKey`)
  
, CONSTRAINT `FKretailsales_DimCustomer_GeographyKey` 
  FOREIGN KEY(`GeographyKey`)
  REFERENCES `retailsales`.`DimGeography` (`GeographyKey`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


  

#Sales*/
CREATE TABLE `retailsales`.`Sales` (
  `ProductKey` int unsigned NOT NULL,
  `CustomerKey` int unsigned NOT NULL,
  `SalesOrderNumber` nvarchar(50) NOT NULL,
  `SalesOrderLineNumber` smallint unsigned NOT NULL DEFAULT 1,
  `Quantity` int unsigned NOT NULL DEFAULT 0,
  `UnitPrice` decimal(19,4) NOT NULL DEFAULT 0.0,
  `TransactionDate` datetime NULL,
  PRIMARY KEY (`SalesOrderNumber`,`SalesOrderLineNumber`)
  
, CONSTRAINT `FKretailsales_FactInternetSales_ProductKey` 
  FOREIGN KEY(`ProductKey`)
  REFERENCES `retailsales`.`DimProduct` (`ProductKey`),
  
  CONSTRAINT `FKretailsales_FactInternetSales_CustomerKey` 
  FOREIGN KEY(`CustomerKey`)
  REFERENCES `retailsales`.`DimCustomer` (`CustomerKey`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO DimGeography (City,StateProvinceCode,StateProvinceName,CountryRegionCode,CountryRegionName,PostalCode) VALUES
 ('DOWNERS GROVE','IL','ILLINOIS','US','UNITED STATES','60515')
,('DOWNERS GROVE','IL','ILLINOIS','US','UNITED STATES','60516');

