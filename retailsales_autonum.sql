SET FOREIGN_KEY_CHECKS=1;



  

#DimProductCategory*/
CREATE TABLE `retailsales_datagenerator`.`DimProductCategory` (
  `CategoryKey` int unsigned NOT NULL AUTO_INCREMENT,
  `Category` nvarchar(50) NOT NULL,
  PRIMARY KEY (`CategoryKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  

#DimProductSubcategory*/
CREATE TABLE `retailsales_datagenerator`.`DimProductSubcategory` (
  `SubcategoryKey` int unsigned NOT NULL AUTO_INCREMENT,
  `Subcategory` nvarchar(50) NOT NULL,
  `CategoryKey` int unsigned NOT NULL,
  PRIMARY KEY (`SubcategoryKey`)
  
, CONSTRAINT `FKretailsales_datagenerator_DimProductSubcategory_CategoryKey` 
  FOREIGN KEY(`CategoryKey`)
  REFERENCES `retailsales_datagenerator`.`DimProductCategory` (`CategoryKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




#DimBrand*/
CREATE TABLE `retailsales_datagenerator`.`DimBrand` (
  `BrandKey` int unsigned NOT NULL,
--  `ProductKey` int unsigned NOT NULL,
  `Brand` nvarchar(50) NOT NULL,
  PRIMARY KEY (`BrandKey`)
  
--, CONSTRAINT `FKretailsales_datagenerator_DimBrand_ProductKey` 
--  FOREIGN KEY(`ProductKey`)
--  REFERENCES `retailsales_datagenerator`.`DimProduct` (`ProductKey`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




#DimProduct*/
CREATE TABLE `retailsales_datagenerator`.`DimProduct` (
  `ProductKey` int unsigned NOT NULL AUTO_INCREMENT,
  `SubcategoryKey` int unsigned NOT NULL,
  `BrandKey` int unsigned NOT NULL,
  `StandardCost` decimal(9,4) NULL,
  `ListPrice` decimal(9,4) NOT NULL,
  `Product` nvarchar(50) NOT NULL,
  `Size` decimal(9,4) NULL,
  `SizeUnitMeasureCode` nchar(3) NULL,
  `Weight` decimal(9,4) NULL,
  `WeightUnitMeasureCode` nchar(3) NULL,
  PRIMARY KEY (`ProductKey`)
  
, CONSTRAINT `FKretailsales_datagenerator_DimProduct_SubcategoryKey` 
  FOREIGN KEY(`SubcategoryKey`)
  REFERENCES `retailsales_datagenerator`.`DimProductSubcategory` (`SubcategoryKey`)
  
, CONSTRAINT `FKretailsales_datagenerator_DimProduct_BrandKey` 
  FOREIGN KEY(`BrandKey`)
  REFERENCES `retailsales_datagenerator`.`DimBrand` (`BrandKey`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  
#DimModel*/
CREATE TABLE `retailsales_datagenerator`.`DimModel` (
  `ModelKey` int unsigned NOT NULL,
  `ProductKey` int unsigned NOT NULL,
  `Model` nvarchar(50) NOT NULL,
  PRIMARY KEY (`ModelKey`)
  
, CONSTRAINT `FKretailsales_datagenerator_DimModel_ProductKey` 
  FOREIGN KEY(`ProductKey`)
  REFERENCES `retailsales_datagenerator`.`DimProduct` (`ProductKey`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



#DimVendor*/
CREATE TABLE `retailsales_datagenerator`.`DimVendor` (
  `VendorKey` int unsigned NOT NULL AUTO_INCREMENT,
  `Vendor` nvarchar(50) NOT NULL,
  PRIMARY KEY (`VendorKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#VendorProduct*/
CREATE TABLE `retailsales_datagenerator`.`VendorProduct` (
  `PK` int unsigned NOT NULL AUTO_INCREMENT,
  `VendorKey` int unsigned NOT NULL,
  `ProductKey` int unsigned NOT NULL,
  PRIMARY KEY (`PK`)
  
, CONSTRAINT `FKretailsales_datagenerator_VendorProduct_ProductKey` 
  FOREIGN KEY(`ProductKey`)
  REFERENCES `retailsales_datagenerator`.`DimProduct` (`ProductKey`)
  
, CONSTRAINT `FKretailsales_datagenerator_VendorProduct_VendorKey` 
  FOREIGN KEY(`VendorKey`)
  REFERENCES `retailsales_datagenerator`.`DimVendor` (`VendorKey`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  



#DimCustomer*/
CREATE TABLE `retailsales_datagenerator`.`DimCustomer` (
  `CustomerKey` int unsigned NOT NULL AUTO_INCREMENT,
  `GeographyKey` int unsigned NOT NULL,
  `FirstName` nvarchar(50) NULL,
  `LastName` nvarchar(50) NULL,
  PRIMARY KEY (`CustomerKey`)
  
, CONSTRAINT `FKretailsales_datagenerator_DimCustomer_GeographyKey` 
  FOREIGN KEY(`GeographyKey`)
  REFERENCES `retailsales_datagenerator`.`DimGeography` (`GeographyKey`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


  

#Sales*/
CREATE TABLE `retailsales_datagenerator`.`Sales` (
  `ProductKey` int unsigned NOT NULL,
  `CustomerKey` int unsigned NOT NULL,
  `SalesOrderNumber` nvarchar(50) NOT NULL,
  `SalesOrderLineNumber` smallint unsigned NOT NULL DEFAULT 1,
  `Quantity` int unsigned NOT NULL DEFAULT 0,
  `UnitPrice` decimal(19,4) NOT NULL DEFAULT 0.0,
  `TransactionDate` datetime NULL,
  PRIMARY KEY (`SalesOrderNumber`,`SalesOrderLineNumber`)
  
, CONSTRAINT `FKretailsales_datagenerator_FactInternetSales_ProductKey` 
  FOREIGN KEY(`ProductKey`)
  REFERENCES `retailsales_datagenerator`.`DimProduct` (`ProductKey`),
  
  CONSTRAINT `FKretailsales_datagenerator_FactInternetSales_CustomerKey` 
  FOREIGN KEY(`CustomerKey`)
  REFERENCES `retailsales_datagenerator`.`DimCustomer` (`CustomerKey`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--INSERT INTO DimGeography (City,StateProvinceCode,StateProvinceName,CountryRegionCode,CountryRegionName,PostalCode) VALUES
-- ('DOWNERS GROVE','IL','ILLINOIS','US','UNITED STATES','60515')
--,('DOWNERS GROVE','IL','ILLINOIS','US','UNITED STATES','60516');

