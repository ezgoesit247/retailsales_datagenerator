
DROP TABLE IF EXISTS `datagen`.`zip_code_import`;

#zip_code_import*/

CREATE TABLE `datagen`.`zip_code_import` (
  `zip` nvarchar(5) NOT NULL,
  `type` nvarchar(10),
  `state` nvarchar(2),
  `latitude` decimal(9,6) NULL,
  `longitude` decimal(9,6) NULL,
  `region` nvarchar(2),
  `country` nvarchar(2),
  PRIMARY KEY (`zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `datagen`.`zip_code_import` (
  `zip` nvarchar(5) NOT NULL,
  `type` nvarchar(10),
  `primary_city` nvarchar(255),
  `acceptable_cities` nvarchar(255),
  `unacceptable_cities` nvarchar(1024),
  `state` nvarchar(2),
  `county` nvarchar(50),
  `timezone` nvarchar(30),
  `areacodes` nvarchar(27),
  `latitude` decimal(9,6) NULL,
  `longitude` decimal(9,6) NULL,
  `region` nvarchar(2),
  `country` nvarchar(2),
  `decommissioned` nvarchar(255),
  `estimated_population` nvarchar(255),
  `notes` nvarchar(255),
  PRIMARY KEY (`zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `datagen`.`zip_code` (
  `PK` int unsigned NOT NULL AUTO_INCREMENT,
  `zip` nvarchar(5) NOT NULL,
  `type` nvarchar(10),
  `primary_city` nvarchar(255),
  `acceptable_cities` nvarchar(255),
  `unacceptable_cities` nvarchar(255),
  `state` nvarchar(2),
  `county` nvarchar(50),
  `timezone` nvarchar(30),
  `areacodes` nvarchar(27),
  `latitude` decimal(9,6) NULL,
  `longitude` decimal(9,6) NULL,
  `region` nvarchar(2),
  `country` nvarchar(2),
  `decommissioned` nvarchar(255),
  `estimated_population` nvarchar(255),
  `notes` nvarchar(255),
  PRIMARY KEY (`PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOAD DATA LOCAL INFILE '/Users/brandonindia/JAVA/indata/zip_code_database.csv'
INTO TABLE `datagen`.`zip_code_import` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

