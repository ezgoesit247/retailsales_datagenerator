SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS `retailsales`.`Sales`;
DROP TABLE IF EXISTS `retailsales`.`ModelVendor`;
DROP TABLE IF EXISTS `retailsales`.`VendorBrand`;
DROP TABLE IF EXISTS `retailsales`.`ModelVendorBridge`;
DROP TABLE IF EXISTS `retailsales`.`VendorBrandBridge`;
DROP TABLE IF EXISTS `retailsales`.`DimProduct`;
DROP TABLE IF EXISTS `retailsales`.`DimProductSubcategory`;
DROP TABLE IF EXISTS `retailsales`.`DimProductCategory`;
DROP TABLE IF EXISTS `retailsales`.`DimVendor`;
DROP TABLE IF EXISTS `retailsales`.`DimBrand`;
DROP TABLE IF EXISTS `retailsales`.`DimModel`;
DROP TABLE IF EXISTS `retailsales`.`DimPromotion`;
DROP TABLE IF EXISTS `retailsales`.`DimCurrency`;
DROP TABLE IF EXISTS `retailsales`.`DimCustomer`;
DROP TABLE IF EXISTS `retailsales`.`DimDate`;
DROP TABLE IF EXISTS `retailsales`.`DimGeography`;
DROP TABLE IF EXISTS `retailsales`.`DimSalesTerritory`;


#DimBrand*/
CREATE TABLE `retailsales`.`DimBrand` (
  `BrandKey` int unsigned NOT NULL, #AUTO_INCREMENT
  `Brand` nvarchar(50) NOT NULL,
  PRIMARY KEY (`BrandKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



  
  
#DimModel*/
CREATE TABLE `retailsales`.`DimModel` (
  `ModelKey` int unsigned NOT NULL, #AUTO_INCREMENT
  `Model` nvarchar(50) NOT NULL,
  PRIMARY KEY (`ModelKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




#DimVendor*/
CREATE TABLE `retailsales`.`DimVendor` (
  `VendorKey` int unsigned NOT NULL DEFAULT 0,
  `Vendor` nvarchar(50) NOT NULL,
  PRIMARY KEY (`VendorKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




#VendorBrand*/
CREATE TABLE `retailsales`.`VendorBrand` (
  `VendorKey` int unsigned NOT NULL DEFAULT 0,
  `BrandKey` int unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`VendorKey`,`BrandKey`)



, CONSTRAINT `FKretailsales_VendorBrand_BrandKey`
  FOREIGN KEY(`BrandKey`)
  REFERENCES `retailsales`.`DimBrand` (`BrandKey`)

, CONSTRAINT `FKretailsales_VendorBrand_VendorKey`
  FOREIGN KEY(`VendorKey`)
  REFERENCES `retailsales`.`DimVendor` (`VendorKey`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



#ModelVendor*/
CREATE TABLE `retailsales`.`ModelVendor` (
  `ModelKey` int unsigned NOT NULL DEFAULT 0,
  `VendorKey` int unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ModelKey`,`VendorKey`)



, CONSTRAINT `FKretailsales_ModelVendor_ModelKey`
  FOREIGN KEY(`ModelKey`)
  REFERENCES `retailsales`.`DimModel` (`ModelKey`)

, CONSTRAINT `FKretailsales_ModelVendor_VendorKey`
  FOREIGN KEY(`VendorKey`)
  REFERENCES `retailsales`.`DimVendor` (`VendorKey`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


  

#DimProductCategory*/
CREATE TABLE `retailsales`.`DimProductCategory` (
  `CategoryKey` int unsigned NOT NULL, #AUTO_INCREMENT
  `Category` nvarchar(50) NOT NULL,
  PRIMARY KEY (`CategoryKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  

#DimProductSubcategory*/
CREATE TABLE `retailsales`.`DimProductSubcategory` (
  `SubcategoryKey` int unsigned NOT NULL, #AUTO_INCREMENT
  `Subcategory` nvarchar(50) NOT NULL,
  `CategoryKey` int unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`SubcategoryKey`)
  
, CONSTRAINT `FKretailsales_DimProductSubcategory_DimCategory` 
  FOREIGN KEY(`CategoryKey`)
  REFERENCES `retailsales`.`DimProductCategory` (`CategoryKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


  

#DimProduct*/
CREATE TABLE `retailsales`.`DimProduct` (
  `ProductKey` int unsigned NOT NULL, #AUTO_INCREMENT
  `SubcategoryKey` int unsigned NOT NULL DEFAULT 0,
  `StandardCost` decimal(9,4) NULL,
  `ListPrice` decimal(9,4) NOT NULL,
  `Product` nvarchar(50) NOT NULL,
  `BrandKey` int unsigned NOT NULL DEFAULT 0,
  `ModelKey` int unsigned NOT NULL DEFAULT 0,
  `Size` decimal(9,4) NULL,
  `SizeUnitMeasureCode` nchar(3) NULL,
  `Weight` decimal(9,4) NULL,
  `WeightUnitMeasureCode` nchar(3) NULL,
  PRIMARY KEY (`ProductKey`)
  
, CONSTRAINT `FKretailsales_DimProduct_DimProductSubcategory` 
  FOREIGN KEY(`SubcategoryKey`)
  REFERENCES `retailsales`.`DimProductSubcategory` (`SubcategoryKey`)
  
,  CONSTRAINT `FKretailsales_DimProduct_DimModel` 
  FOREIGN KEY(`ModelKey`)
  REFERENCES `retailsales`.`DimModel` (`ModelKey`)
  
,  CONSTRAINT `FKretailsales_DimProduct_DimBrand` 
  FOREIGN KEY(`BrandKey`)
  REFERENCES `retailsales`.`DimBrand` (`BrandKey`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  

#Geography*/
CREATE TABLE `retailsales`.`DimGeography` (
  `GeographyKey` int unsigned NOT NULL, #AUTO_INCREMENT
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
  `CustomerKey` int unsigned NOT NULL, #AUTO_INCREMENT
  `GeographyKey` int unsigned NOT NULL DEFAULT 0,
  `FirstName` nvarchar(50) NULL,
  `LastName` nvarchar(50) NULL,
  PRIMARY KEY (`CustomerKey`)
  
, CONSTRAINT `FKretailsales_DimCustomer_DimGeography` 
  FOREIGN KEY(`GeographyKey`)
  REFERENCES `retailsales`.`DimGeography` (`GeographyKey`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


  

#Sales*/
CREATE TABLE `retailsales`.`Sales` (
  `ProductKey` int unsigned NOT NULL DEFAULT 0,
  `CustomerKey` int unsigned NOT NULL DEFAULT 0,
  `SalesOrderNumber` nvarchar(50) NOT NULL,
  `SalesOrderLineNumber` smallint unsigned NOT NULL DEFAULT 1,
  `Quantity` int unsigned NOT NULL DEFAULT 0,
  `UnitPrice` decimal(19,4) NOT NULL DEFAULT 0.0,
  `TransactionDate` datetime NULL,
  PRIMARY KEY (`SalesOrderNumber`,`SalesOrderLineNumber`)
  
, CONSTRAINT `FKretailsales_FactInternetSales_DimProduct` 
  FOREIGN KEY(`ProductKey`)
  REFERENCES `retailsales`.`DimProduct` (`ProductKey`),
  
  CONSTRAINT `FKretailsales_FactInternetSales_DimCustomer` 
  FOREIGN KEY(`CustomerKey`)
  REFERENCES `retailsales`.`DimCustomer` (`CustomerKey`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


  INSERT INTO `retailsales`.`DimBrand` (BrandKey,Brand) VALUES (0,'No Brand');
  INSERT INTO `retailsales`.`DimModel` (ModelKey,Model) VALUES (0,'No Model');
  INSERT INTO `retailsales`.`DimVendor` (VendorKey,Vendor) VALUES (0,'No Vendor');
  INSERT INTO `retailsales`.`VendorBrand` (VendorKey,BrandKey) VALUES (0,0);
  INSERT INTO `retailsales`.`ModelVendor` (ModelKey,VendorKey) VALUES (0,0);
  INSERT INTO `retailsales`.`DimProductCategory` (CategoryKey,Category) VALUES (0,'No Category');
  INSERT INTO `retailsales`.`DimProductSubcategory` (SubcategoryKey,CategoryKey,Subcategory) VALUES (0,0,'No Subcategory');
  INSERT INTO `retailsales`.`DimProduct` (ProductKey,SubcategoryKey,Product,ListPrice) VALUES (0,0,'No Product',0.0);
  INSERT INTO `retailsales`.`DimGeography` (GeographyKey,City,StateProvinceCode,StateProvinceName,CountryRegionCode,CountryRegionName,PostalCode)
  	VALUES (0,'No City','XXX','Nowhere','XXX','No Country','00000');
  INSERT INTO `retailsales`.`DimCustomer` (CustomerKey,GeographyKey,FirstName,LastName) VALUES (0,0,'No First','No Last');



INSERT INTO `retailsales`.`DimGeography` (
	`GeographyKey`
	,`PostalCode`
	,`StateProvinceCode`
	,`CountryRegionCode`
) VALUES
	 (1,"03470","NH","US")
	,(2,"03561","NH","US")
	,(3,"05647","VT","US")
	,(4,"05649","VT","US")
	;
  
