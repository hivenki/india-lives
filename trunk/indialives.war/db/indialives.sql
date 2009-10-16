-- MYSQL ADMINISTRATOR DUMP 1.4
--
-- ------------------------------------------------------
-- SERVER VERSION	5.0.18-NT


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES UTF8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- CREATE SCHEMA INDIALIVES
--

CREATE DATABASE IF NOT EXISTS INDIALIVES;
USE INDIALIVES;

--
-- DEFINITION OF TABLE `AD_BOARD_ENUM`
--

DROP TABLE IF EXISTS `AD_BOARD_ENUM`;
CREATE TABLE `AD_BOARD_ENUM` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `AD_BOARD_ENUM`
--

/*!40000 ALTER TABLE `AD_BOARD_ENUM` DISABLE KEYS */;
/*!40000 ALTER TABLE `AD_BOARD_ENUM` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `AD_TYPE`
--

DROP TABLE IF EXISTS `AD_TYPE`;
CREATE TABLE `AD_TYPE` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(100) NOT NULL,
  `WIDTH` INT(10) UNSIGNED NOT NULL,
  `HEIGHT` INT(10) UNSIGNED NOT NULL,
  `FILE_FORMAT` VARCHAR(4) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `AD_TYPE`
--

/*!40000 ALTER TABLE `AD_TYPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AD_TYPE` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `ADVERTISEMENTS`
--

DROP TABLE IF EXISTS `ADVERTISEMENTS`;
CREATE TABLE `ADVERTISEMENTS` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `COMMUNITY_ID` INT(10) UNSIGNED NOT NULL,
  `AD_BOARD_ID` INT(10) UNSIGNED NOT NULL,
  `POSTED_DATE` DATETIME NOT NULL,
  `VADLID_FROM` DATETIME NOT NULL,
  `VALID_TILL` DATETIME NOT NULL,
  `POSTED_BY` INT(10) UNSIGNED NOT NULL,
  `AD_TYPE_ID` INT(10) UNSIGNED NOT NULL,
  `CONTENT` BLOB NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_ADVERTISEMENTS_1` (`COMMUNITY_ID`),
  KEY `FK_ADVERTISEMENTS_2` (`AD_BOARD_ID`),
  KEY `FK_ADVERTISEMENTS_3` (`POSTED_BY`),
  KEY `FK_ADVERTISEMENTS_4` (`AD_TYPE_ID`),
  CONSTRAINT `FK_ADVERTISEMENTS_1` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `COMMUNITIES` (`ID`),
  CONSTRAINT `FK_ADVERTISEMENTS_2` FOREIGN KEY (`AD_BOARD_ID`) REFERENCES `AD_BOARD_ENUM` (`ID`),
  CONSTRAINT `FK_ADVERTISEMENTS_3` FOREIGN KEY (`POSTED_BY`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `FK_ADVERTISEMENTS_4` FOREIGN KEY (`AD_TYPE_ID`) REFERENCES `AD_TYPE` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `ADVERTISEMENTS`
--

/*!40000 ALTER TABLE `ADVERTISEMENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADVERTISEMENTS` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `AMENITIES`
--

DROP TABLE IF EXISTS `AMENITIES`;
CREATE TABLE `AMENITIES` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `COMMUNITY_ID` INT(10) UNSIGNED NOT NULL,
  `AMENITY_TYPE_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_AMENITIES_1` (`COMMUNITY_ID`),
  KEY `FK_AMENITIES_2` (`AMENITY_TYPE_ID`),
  CONSTRAINT `FK_AMENITIES_1` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `COMMUNITIES` (`ID`),
  CONSTRAINT `FK_AMENITIES_2` FOREIGN KEY (`AMENITY_TYPE_ID`) REFERENCES `AMENITY_TYPE_ENUM` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `AMENITIES`
--

/*!40000 ALTER TABLE `AMENITIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `AMENITIES` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `AMENITY_BOOKINGS`
--

DROP TABLE IF EXISTS `AMENITY_BOOKINGS`;
CREATE TABLE `AMENITY_BOOKINGS` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `AMENITY_ID` INT(10) UNSIGNED NOT NULL,
  `BOOKED_BY` INT(10) UNSIGNED NOT NULL,
  `BOOKING_TIME` DATETIME NOT NULL,
  `START_TIME` DATETIME NOT NULL,
  `END_TIME` DATETIME NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_AMENITY_BOOKINGS_1` (`AMENITY_ID`),
  KEY `FK_AMENITY_BOOKINGS_2` (`BOOKED_BY`),
  CONSTRAINT `FK_AMENITY_BOOKINGS_1` FOREIGN KEY (`AMENITY_ID`) REFERENCES `AMENITY_TYPE_ENUM` (`ID`),
  CONSTRAINT `FK_AMENITY_BOOKINGS_2` FOREIGN KEY (`BOOKED_BY`) REFERENCES `USERS` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `AMENITY_BOOKINGS`
--

/*!40000 ALTER TABLE `AMENITY_BOOKINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AMENITY_BOOKINGS` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `AMENITY_TYPE_ENUM`
--

DROP TABLE IF EXISTS `AMENITY_TYPE_ENUM`;
CREATE TABLE `AMENITY_TYPE_ENUM` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `AMENITY_TYPE_ENUM`
--

/*!40000 ALTER TABLE `AMENITY_TYPE_ENUM` DISABLE KEYS */;
/*!40000 ALTER TABLE `AMENITY_TYPE_ENUM` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `BLOCKS`
--

DROP TABLE IF EXISTS `BLOCKS`;
CREATE TABLE `BLOCKS` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(100) NOT NULL,
  `COMMUNITY_ID` INT(10) UNSIGNED NOT NULL,
  `NO_OF_FLOORS` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_BLOCKS_1` (`COMMUNITY_ID`),
  CONSTRAINT `FK_BLOCKS_1` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `COMMUNITIES` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `BLOCKS`
--

/*!40000 ALTER TABLE `BLOCKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLOCKS` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `CITIES`
--

DROP TABLE IF EXISTS `CITIES`;
CREATE TABLE `CITIES` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(50) NOT NULL,
  `STATE_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_CITIES_1` (`STATE_ID`),
  CONSTRAINT `FK_CITIES_1` FOREIGN KEY (`STATE_ID`) REFERENCES `STATES` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `CITIES`
--

/*!40000 ALTER TABLE `CITIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `CITIES` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `COMMUNITIES`
--

DROP TABLE IF EXISTS `COMMUNITIES`;
CREATE TABLE `COMMUNITIES` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(100) NOT NULL,
  `ADDRESS` VARCHAR(300) NOT NULL,
  `CITY_ID` INT(10) UNSIGNED NOT NULL,
  `PIN_CODE` VARCHAR(10) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_COMMUNITIES_1` (`CITY_ID`),
  CONSTRAINT `FK_COMMUNITIES_1` FOREIGN KEY (`CITY_ID`) REFERENCES `CITIES` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `COMMUNITIES`
--

/*!40000 ALTER TABLE `COMMUNITIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMMUNITIES` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `COMPLAINT_TYPE_ENUM`
--

DROP TABLE IF EXISTS `COMPLAINT_TYPE_ENUM`;
CREATE TABLE `COMPLAINT_TYPE_ENUM` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `COMPLAINT_TYPE_ENUM`
--

/*!40000 ALTER TABLE `COMPLAINT_TYPE_ENUM` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMPLAINT_TYPE_ENUM` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `COMPLAINTS`
--

DROP TABLE IF EXISTS `COMPLAINTS`;
CREATE TABLE `COMPLAINTS` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` INT(10) UNSIGNED NOT NULL,
  `RAISED_BY` INT(10) UNSIGNED NOT NULL,
  `RAISED_TIME` DATETIME NOT NULL,
  `TYPE_ID` INT(10) UNSIGNED NOT NULL,
  `DESCRIPTION` VARCHAR(1000) NOT NULL,
  `AVAILABLE_START_TIME` DATETIME NOT NULL,
  `AVAILABLE_END_TIME` DATETIME NOT NULL,
  `SEVERITY_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_COMPLAINTS_1` (`RAISED_BY`),
  KEY `FK_COMPLAINTS_2` (`PROPERTY_ID`),
  KEY `FK_COMPLAINTS_3` (`SEVERITY_ID`),
  KEY `FK_COMPLAINTS_4` (`TYPE_ID`),
  CONSTRAINT `FK_COMPLAINTS_1` FOREIGN KEY (`RAISED_BY`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `FK_COMPLAINTS_2` FOREIGN KEY (`PROPERTY_ID`) REFERENCES `FLATS` (`ID`),
  CONSTRAINT `FK_COMPLAINTS_3` FOREIGN KEY (`SEVERITY_ID`) REFERENCES `SEVERITY_ENUM` (`ID`),
  CONSTRAINT `FK_COMPLAINTS_4` FOREIGN KEY (`TYPE_ID`) REFERENCES `COMPLAINT_TYPE_ENUM` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `COMPLAINTS`
--

/*!40000 ALTER TABLE `COMPLAINTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMPLAINTS` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `COUNTRIES`
--

DROP TABLE IF EXISTS `COUNTRIES`;
CREATE TABLE `COUNTRIES` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(50) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `COUNTRIES`
--

/*!40000 ALTER TABLE `COUNTRIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `COUNTRIES` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `FLATS`
--

DROP TABLE IF EXISTS `FLATS`;
CREATE TABLE `FLATS` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `BLOCK_ID` INT(10) UNSIGNED NOT NULL,
  `FLOOR` INT(10) UNSIGNED NOT NULL,
  `FLAT_NO` VARCHAR(10) NOT NULL,
  `FLAT_TYPE_ID` INT(10) UNSIGNED NOT NULL,
  `NO_OF_BED_ROOMS` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_FLATS_1` (`BLOCK_ID`),
  KEY `FK_FLATS_2` (`FLAT_TYPE_ID`),
  CONSTRAINT `FK_FLATS_1` FOREIGN KEY (`BLOCK_ID`) REFERENCES `BLOCKS` (`ID`),
  CONSTRAINT `FK_FLATS_2` FOREIGN KEY (`FLAT_TYPE_ID`) REFERENCES `FLAT_TYPE_ENUM` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `FLATS`
--

/*!40000 ALTER TABLE `FLATS` DISABLE KEYS */;
/*!40000 ALTER TABLE `FLATS` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `NOTICE_BOARD_ENUM`
--

DROP TABLE IF EXISTS `NOTICE_BOARD_ENUM`;
CREATE TABLE `NOTICE_BOARD_ENUM` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;


--
-- DUMPING DATA FOR TABLE `NOTICE_BOARD_ENUM`
--

/*!40000 ALTER TABLE `NOTICE_BOARD_ENUM` DISABLE KEYS */;
/*!40000 ALTER TABLE `NOTICE_BOARD_ENUM` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `NOTICES`
--

DROP TABLE IF EXISTS `NOTICES`;
CREATE TABLE `NOTICES` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `COMMUNITY_ID` INT(10) UNSIGNED NOT NULL,
  `NOTICE_BOARD_ID` INT(10) UNSIGNED NOT NULL,
  `POSTED_DATE` DATETIME NOT NULL,
  `SUBJECT` VARCHAR(100) NOT NULL,
  `DESCRIPTION` VARCHAR(1000) NOT NULL,
  `POSTED_BY` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_NOTICES_1` (`COMMUNITY_ID`),
  KEY `FK_NOTICES_2` (`NOTICE_BOARD_ID`),
  KEY `FK_NOTICES_3` (`POSTED_BY`),
  CONSTRAINT `FK_NOTICES_1` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `COMMUNITIES` (`ID`),
  CONSTRAINT `FK_NOTICES_2` FOREIGN KEY (`NOTICE_BOARD_ID`) REFERENCES `NOTICE_BOARD_ENUM` (`ID`),
  CONSTRAINT `FK_NOTICES_3` FOREIGN KEY (`POSTED_BY`) REFERENCES `USERS` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `NOTICES`
--

/*!40000 ALTER TABLE `NOTICES` DISABLE KEYS */;
/*!40000 ALTER TABLE `NOTICES` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `PARKING_SLOTS`
--

DROP TABLE IF EXISTS `PARKING_SLOTS`;
CREATE TABLE `PARKING_SLOTS` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `PARKING_ID` INT(10) UNSIGNED NOT NULL,
  `LOCATION` VARCHAR(10) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_PARKING_SLOTS_1` (`PARKING_ID`),
  CONSTRAINT `FK_PARKING_SLOTS_1` FOREIGN KEY (`PARKING_ID`) REFERENCES `PARKINGS` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `PARKING_SLOTS`
--

/*!40000 ALTER TABLE `PARKING_SLOTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARKING_SLOTS` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `PARKINGS`
--

DROP TABLE IF EXISTS `PARKINGS`;
CREATE TABLE `PARKINGS` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(45) NOT NULL,
  `COMMUNITY_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_PARKINGS_1` (`COMMUNITY_ID`),
  CONSTRAINT `FK_PARKINGS_1` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `COMMUNITIES` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `PARKINGS`
--

/*!40000 ALTER TABLE `PARKINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARKINGS` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `PRIVILEGES`
--

DROP TABLE IF EXISTS `PRIVILEGES`;
CREATE TABLE `PRIVILEGES` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `PRIVILEGES`
--

/*!40000 ALTER TABLE `PRIVILEGES` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRIVILEGES` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `PROPERTY_OWNERS`
--

DROP TABLE IF EXISTS `PROPERTY_OWNERS`;
CREATE TABLE `PROPERTY_OWNERS` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` INT(10) UNSIGNED NOT NULL,
  `PROPERTY_TYPE_ID` INT(10) UNSIGNED NOT NULL,
  `OWNER_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_PROPERTY_OWNERS_1` (`PROPERTY_TYPE_ID`),
  KEY `FK_PROPERTY_OWNERS_2` (`OWNER_ID`),
  KEY `FK_PROPERTY_OWNERS_3` (`PROPERTY_ID`),
  CONSTRAINT `FK_PROPERTY_OWNERS_1` FOREIGN KEY (`PROPERTY_TYPE_ID`) REFERENCES `PROPERTY_TYPE_ENUM` (`ID`),
  CONSTRAINT `FK_PROPERTY_OWNERS_2` FOREIGN KEY (`OWNER_ID`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `FK_PROPERTY_OWNERS_3` FOREIGN KEY (`PROPERTY_ID`) REFERENCES `FLATS` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `PROPERTY_OWNERS`
--

/*!40000 ALTER TABLE `PROPERTY_OWNERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROPERTY_OWNERS` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `PROPERTY_TYPE_ENUM`
--

DROP TABLE IF EXISTS `PROPERTY_TYPE_ENUM`;
CREATE TABLE `PROPERTY_TYPE_ENUM` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `PROPERTY_TYPE_ENUM`
--

/*!40000 ALTER TABLE `PROPERTY_TYPE_ENUM` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROPERTY_TYPE_ENUM` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `ROLE_CONTEXTS`
--

DROP TABLE IF EXISTS `ROLE_CONTEXTS`;
CREATE TABLE `ROLE_CONTEXTS` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `USER_ID` INT(10) UNSIGNED NOT NULL,
  `COMMUNITY_ID` INT(10) UNSIGNED NOT NULL,
  `ROLE_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `UNIQUE_ROLE_CONTEXT` USING BTREE (`USER_ID`,`COMMUNITY_ID`,`ROLE_ID`),
  KEY `FK_ROLE_CONTEXTS_2` (`COMMUNITY_ID`),
  KEY `FK_ROLE_CONTEXTS_3` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_CONTEXTS_1` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `FK_ROLE_CONTEXTS_2` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `COMMUNITIES` (`ID`),
  CONSTRAINT `FK_ROLE_CONTEXTS_3` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLES` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `ROLE_CONTEXTS`
--

/*!40000 ALTER TABLE `ROLE_CONTEXTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_CONTEXTS` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `ROLE_PRIVILEGES`
--

DROP TABLE IF EXISTS `ROLE_PRIVILEGES`;
CREATE TABLE `ROLE_PRIVILEGES` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ROLE_ID` INT(10) UNSIGNED NOT NULL,
  `PRIVILEGE_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_ROLE_PRIVILEGES_1` (`ROLE_ID`),
  KEY `FK_ROLE_PRIVILEGES_2` (`PRIVILEGE_ID`),
  CONSTRAINT `FK_ROLE_PRIVILEGES_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLES` (`ID`),
  CONSTRAINT `FK_ROLE_PRIVILEGES_2` FOREIGN KEY (`PRIVILEGE_ID`) REFERENCES `PRIVILEGES` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `ROLE_PRIVILEGES`
--

/*!40000 ALTER TABLE `ROLE_PRIVILEGES` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_PRIVILEGES` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `ROLES`
--

DROP TABLE IF EXISTS `ROLES`;
CREATE TABLE `ROLES` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `ROLES`
--

/*!40000 ALTER TABLE `ROLES` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLES` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `SEVERITY_ENUM`
--

DROP TABLE IF EXISTS `SEVERITY_ENUM`;
CREATE TABLE `SEVERITY_ENUM` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `SEVERITY_ENUM`
--

/*!40000 ALTER TABLE `SEVERITY_ENUM` DISABLE KEYS */;
/*!40000 ALTER TABLE `SEVERITY_ENUM` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `STATES`
--

DROP TABLE IF EXISTS `STATES`;
CREATE TABLE `STATES` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(50) NOT NULL,
  `COUNTRY_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_STATES_1` (`COUNTRY_ID`),
  CONSTRAINT `FK_STATES_1` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `COUNTRIES` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `STATES`
--

/*!40000 ALTER TABLE `STATES` DISABLE KEYS */;
/*!40000 ALTER TABLE `STATES` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `USERS`
--

DROP TABLE IF EXISTS `USERS`;
CREATE TABLE `USERS` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `EMAIL_ID` VARCHAR(50) NOT NULL,
  `PASSWORD` VARCHAR(20) NOT NULL,
  `MOBILE_NO` VARCHAR(12) NOT NULL,
  `FIRST_NAME` VARCHAR(20) NOT NULL,
  `LAST_NAME` VARCHAR(20) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `USERS`
--

/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;


--
-- DEFINITION OF TABLE `VILLAS`
--

DROP TABLE IF EXISTS `VILLAS`;
CREATE TABLE `VILLAS` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `COMMUNITY_ID` INT(10) UNSIGNED NOT NULL,
  `PLOT_NO` VARCHAR(10) NOT NULL,
  `NO_OF_FLOORS` INT(10) UNSIGNED NOT NULL,
  `NAME` VARCHAR(45) NOT NULL,
  `NO_OF_BED_ROOMS` INT(10) UNSIGNED NOT NULL,
  `NO_OF_PARKINGS` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_VILLAS_1` (`COMMUNITY_ID`),
  CONSTRAINT `FK_VILLAS_1` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `COMMUNITIES` (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;


DROP TABLE IF EXISTS `FLAT_TYPE_ENUM`;
CREATE TABLE `FLAT_TYPE_ENUM` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

--
-- DUMPING DATA FOR TABLE `VILLAS`
--

/*!40000 ALTER TABLE `VILLAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `VILLAS` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
