SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `retailsales_datagenerator`.`_zip`;



create table `retailsales_datagenerator`.`_zip` (
--  `PK` int unsigned NOT NULL AUTO_INCREMENT,
  `zip` nvarchar(15) NOT NULL,
  `primary_city` nvarchar(50) NULL,
  `state` nvarchar(2) NULL,
  `country` varchar(3) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- COPY DATA FILE TO MYSQL SECURE DIR FIRST
-- docker cp ./assets.docker/retailsales_datagenerator/retailsales_datagenerator/zip-codes.csv \
--    3586ebc62166:/var/lib/mysql-files/zip-codes.csv
  
load data infile '/var/lib/mysql-files/zip-codes.csv'
into table `retailsales_datagenerator`.`_zip`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  


  
  

#Geography*/
CREATE TABLE `retailsales_datagenerator`.`DimGeography` (
  `GeographyKey` int unsigned NOT NULL AUTO_INCREMENT,
  `City` nvarchar(50) NULL,
  `StateProvinceCode` nvarchar(3) NULL,
  `StateProvinceName` nvarchar(50) NULL,
  `CountryRegionCode` nvarchar(3) NULL,
  `CountryRegionName` nvarchar(50) NULL,
  `PostalCode` nvarchar(15) NOT NULL,
  PRIMARY KEY (`GeographyKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



insert into `retailsales_datagenerator`.`DimGeography`
  (`City`,`StateProvinceCode`,`CountryRegionCode`,`PostalCode`)
  select `primary_city`,`state`,`country`,`zip`
  from  `retailsales_datagenerator`.`_zip`
  where `state`='IL' AND `zip` like '600%';
  




DROP TABLE IF EXISTS `retailsales_datagenerator`.`_zip`;

