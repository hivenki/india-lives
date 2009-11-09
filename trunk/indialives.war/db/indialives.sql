-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.18-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema indialives
--

CREATE DATABASE IF NOT EXISTS indialives;
USE indialives;

--
-- Temporary table structure for view `properties`
--
DROP TABLE IF EXISTS `properties`;
DROP VIEW IF EXISTS `properties`;
CREATE TABLE `properties` (
  `PROPERTY_ID` int(11) unsigned,
  `PROPERTY_TYPE_ID` bigint(20),
  `PROPERTY_NAME` varchar(45),
  `COMMUNITY_ID` int(11) unsigned
);

--
-- Definition of table `ad_board_enum`
--

DROP TABLE IF EXISTS `ad_board_enum`;
CREATE TABLE `ad_board_enum` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad_board_enum`
--

/*!40000 ALTER TABLE `ad_board_enum` DISABLE KEYS */;
INSERT INTO `ad_board_enum` (`ID`,`NAME`,`DESCRIPTION`) VALUES 
 (1,'IndiaLives Wide','All IndiaLives users will be able to see this ad'),
 (2,'City Wide','All Indialives users belongs to the city will be able to see this ad'),
 (3,'Community Wide','All Indialives user belongs to the community will be able to see this ad');
/*!40000 ALTER TABLE `ad_board_enum` ENABLE KEYS */;


--
-- Definition of table `ad_type`
--

DROP TABLE IF EXISTS `ad_type`;
CREATE TABLE `ad_type` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `WIDTH` int(10) unsigned NOT NULL,
  `HEIGHT` int(10) unsigned NOT NULL,
  `FILE_FORMAT` varchar(4) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad_type`
--

/*!40000 ALTER TABLE `ad_type` DISABLE KEYS */;
INSERT INTO `ad_type` (`ID`,`NAME`,`DESCRIPTION`,`WIDTH`,`HEIGHT`,`FILE_FORMAT`) VALUES 
 (1,'Text Ad','HTML Only AD',200,465,'html');
/*!40000 ALTER TABLE `ad_type` ENABLE KEYS */;


--
-- Definition of table `advertisements`
--

DROP TABLE IF EXISTS `advertisements`;
CREATE TABLE `advertisements` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `COMMUNITY_ID` int(10) unsigned default NULL,
  `AD_BOARD_ID` int(10) unsigned NOT NULL,
  `POSTED_DATE` datetime NOT NULL,
  `VADLID_FROM` datetime NOT NULL,
  `VALID_TILL` datetime NOT NULL,
  `POSTED_BY` int(10) unsigned NOT NULL,
  `AD_TYPE_ID` int(10) unsigned NOT NULL,
  `CONTENT` blob NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_ADVERTISEMENTS_1` (`COMMUNITY_ID`),
  KEY `FK_ADVERTISEMENTS_2` (`AD_BOARD_ID`),
  KEY `FK_ADVERTISEMENTS_3` (`POSTED_BY`),
  KEY `FK_ADVERTISEMENTS_4` (`AD_TYPE_ID`),
  CONSTRAINT `FK_ADVERTISEMENTS_1` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `communities` (`ID`),
  CONSTRAINT `FK_ADVERTISEMENTS_2` FOREIGN KEY (`AD_BOARD_ID`) REFERENCES `ad_board_enum` (`ID`),
  CONSTRAINT `FK_ADVERTISEMENTS_3` FOREIGN KEY (`POSTED_BY`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_ADVERTISEMENTS_4` FOREIGN KEY (`AD_TYPE_ID`) REFERENCES `ad_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advertisements`
--

/*!40000 ALTER TABLE `advertisements` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertisements` ENABLE KEYS */;


--
-- Definition of table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
CREATE TABLE `amenities` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `COMMUNITY_ID` int(10) unsigned NOT NULL,
  `AMENITY_TYPE_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_AMENITIES_1` (`COMMUNITY_ID`),
  KEY `FK_AMENITIES_2` (`AMENITY_TYPE_ID`),
  CONSTRAINT `FK_AMENITIES_1` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `communities` (`ID`),
  CONSTRAINT `FK_AMENITIES_2` FOREIGN KEY (`AMENITY_TYPE_ID`) REFERENCES `amenity_type_enum` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amenities`
--

/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;


--
-- Definition of table `amenity_bookings`
--

DROP TABLE IF EXISTS `amenity_bookings`;
CREATE TABLE `amenity_bookings` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `AMENITY_ID` int(10) unsigned NOT NULL,
  `BOOKED_BY` int(10) unsigned NOT NULL,
  `BOOKING_TIME` datetime NOT NULL,
  `START_TIME` datetime NOT NULL,
  `END_TIME` datetime NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_AMENITY_BOOKINGS_1` (`AMENITY_ID`),
  KEY `FK_AMENITY_BOOKINGS_2` (`BOOKED_BY`),
  CONSTRAINT `FK_AMENITY_BOOKINGS_1` FOREIGN KEY (`AMENITY_ID`) REFERENCES `amenity_type_enum` (`ID`),
  CONSTRAINT `FK_AMENITY_BOOKINGS_2` FOREIGN KEY (`BOOKED_BY`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amenity_bookings`
--

/*!40000 ALTER TABLE `amenity_bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `amenity_bookings` ENABLE KEYS */;


--
-- Definition of table `amenity_type_enum`
--

DROP TABLE IF EXISTS `amenity_type_enum`;
CREATE TABLE `amenity_type_enum` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amenity_type_enum`
--

/*!40000 ALTER TABLE `amenity_type_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `amenity_type_enum` ENABLE KEYS */;


--
-- Definition of table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
CREATE TABLE `blocks` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `COMMUNITY_ID` int(10) unsigned NOT NULL,
  `NO_OF_FLOORS` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_BLOCKS_1` (`COMMUNITY_ID`),
  CONSTRAINT `FK_BLOCKS_1` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `communities` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blocks`
--

/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` (`ID`,`NAME`,`DESCRIPTION`,`COMMUNITY_ID`,`NO_OF_FLOORS`) VALUES 
 (1,'Block A','Block A',1,10),
 (2,'Block B','Block B',1,8),
 (3,'Block East','Block East',2,12),
 (4,'Block West','Block West',2,10);
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;


--
-- Definition of table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(50) NOT NULL,
  `STATE_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_CITIES_1` (`STATE_ID`),
  CONSTRAINT `FK_CITIES_1` FOREIGN KEY (`STATE_ID`) REFERENCES `states` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`ID`,`NAME`,`STATE_ID`) VALUES 
 (1,'Chennai',1),
 (2,'Bangalore',2),
 (3,'Hyderabad',3);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;


--
-- Definition of table `communities`
--

DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(100) NOT NULL,
  `ADDRESS` varchar(300) NOT NULL,
  `CITY_ID` int(10) unsigned NOT NULL,
  `PIN_CODE` varchar(10) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_COMMUNITIES_1` (`CITY_ID`),
  CONSTRAINT `FK_COMMUNITIES_1` FOREIGN KEY (`CITY_ID`) REFERENCES `cities` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `communities`
--

/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` (`ID`,`NAME`,`ADDRESS`,`CITY_ID`,`PIN_CODE`) VALUES 
 (1,'Manasarovar','12, III Seaward Road, Valmiki Nagar',1,'600041'),
 (2,'Mantri Espana','Outer Ring Road, Belandur',2,'5600037'),
 (3,'Aparna Palm Meadows','Kompally',3,'500055');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;


--
-- Definition of table `complaint_status_enum`
--

DROP TABLE IF EXISTS `complaint_status_enum`;
CREATE TABLE `complaint_status_enum` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint_status_enum`
--

/*!40000 ALTER TABLE `complaint_status_enum` DISABLE KEYS */;
INSERT INTO `complaint_status_enum` (`ID`,`NAME`,`DESCRIPTION`) VALUES 
 (1,'Open','Open'),
 (2,'In Progress','In Progress'),
 (3,'Closed','Closed');
/*!40000 ALTER TABLE `complaint_status_enum` ENABLE KEYS */;


--
-- Definition of table `complaint_type_enum`
--

DROP TABLE IF EXISTS `complaint_type_enum`;
CREATE TABLE `complaint_type_enum` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `complaint_type_enum`
--

/*!40000 ALTER TABLE `complaint_type_enum` DISABLE KEYS */;
INSERT INTO `complaint_type_enum` (`ID`,`NAME`,`DESCRIPTION`) VALUES 
 (1,'Plumbing','Plumbing'),
 (2,'Electrical','Electrical'),
 (3,'Others','Others');
/*!40000 ALTER TABLE `complaint_type_enum` ENABLE KEYS */;


--
-- Definition of table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
CREATE TABLE `complaints` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `PROPERTY_CONTEXT_ID` int(10) unsigned NOT NULL,
  `RAISED_BY` int(10) unsigned NOT NULL,
  `RAISED_TIME` datetime NOT NULL,
  `TYPE_ID` int(10) unsigned NOT NULL,
  `DESCRIPTION` varchar(1000) NOT NULL,
  `AVAILABLE_START_TIME` datetime NOT NULL,
  `AVAILABLE_END_TIME` datetime NOT NULL,
  `SEVERITY_ID` int(10) unsigned NOT NULL,
  `STATUS_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_COMPLAINTS_1` (`RAISED_BY`),
  KEY `FK_COMPLAINTS_2` (`PROPERTY_CONTEXT_ID`),
  KEY `FK_COMPLAINTS_3` (`SEVERITY_ID`),
  KEY `FK_COMPLAINTS_4` (`TYPE_ID`),
  KEY `FK_complaints_5` (`STATUS_ID`),
  CONSTRAINT `FK_COMPLAINTS_1` FOREIGN KEY (`RAISED_BY`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_COMPLAINTS_2` FOREIGN KEY (`PROPERTY_CONTEXT_ID`) REFERENCES `property_owners` (`ID`),
  CONSTRAINT `FK_COMPLAINTS_3` FOREIGN KEY (`SEVERITY_ID`) REFERENCES `severity_enum` (`ID`),
  CONSTRAINT `FK_COMPLAINTS_4` FOREIGN KEY (`TYPE_ID`) REFERENCES `complaint_type_enum` (`ID`),
  CONSTRAINT `FK_complaints_5` FOREIGN KEY (`STATUS_ID`) REFERENCES `complaint_status_enum` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `complaints`
--

/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;


--
-- Definition of table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`ID`,`NAME`) VALUES 
 (1,'India');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;


--
-- Definition of table `flat_type_enum`
--

DROP TABLE IF EXISTS `flat_type_enum`;
CREATE TABLE `flat_type_enum` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flat_type_enum`
--

/*!40000 ALTER TABLE `flat_type_enum` DISABLE KEYS */;
INSERT INTO `flat_type_enum` (`ID`,`NAME`,`DESCRIPTION`) VALUES 
 (1,'2 Bedroom','2 Bedroom'),
 (2,'3 Bedroom','3 Bedroom'),
 (3,'5 Bedroom','5 Bedroom');
/*!40000 ALTER TABLE `flat_type_enum` ENABLE KEYS */;


--
-- Definition of table `flats`
--

DROP TABLE IF EXISTS `flats`;
CREATE TABLE `flats` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `BLOCK_ID` int(10) unsigned NOT NULL,
  `FLOOR` int(10) unsigned NOT NULL,
  `FLAT_NO` varchar(10) NOT NULL,
  `FLAT_TYPE_ID` int(10) unsigned NOT NULL,
  `NO_OF_BED_ROOMS` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_FLATS_1` (`BLOCK_ID`),
  KEY `FK_FLATS_2` (`FLAT_TYPE_ID`),
  CONSTRAINT `FK_FLATS_1` FOREIGN KEY (`BLOCK_ID`) REFERENCES `blocks` (`ID`),
  CONSTRAINT `FK_FLATS_2` FOREIGN KEY (`FLAT_TYPE_ID`) REFERENCES `flat_type_enum` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flats`
--

/*!40000 ALTER TABLE `flats` DISABLE KEYS */;
INSERT INTO `flats` (`ID`,`BLOCK_ID`,`FLOOR`,`FLAT_NO`,`FLAT_TYPE_ID`,`NO_OF_BED_ROOMS`) VALUES 
 (1,1,1,'FLAT A-001',1,2),
 (2,2,1,'FLAT B-001',2,3),
 (3,3,1,'FLAT E-001',2,3),
 (4,4,1,'FLAT W-001',3,5);
/*!40000 ALTER TABLE `flats` ENABLE KEYS */;


--
-- Definition of table `notice_board_enum`
--

DROP TABLE IF EXISTS `notice_board_enum`;
CREATE TABLE `notice_board_enum` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notice_board_enum`
--

/*!40000 ALTER TABLE `notice_board_enum` DISABLE KEYS */;
INSERT INTO `notice_board_enum` (`ID`,`NAME`,`DESCRIPTION`) VALUES 
 (1,'Regual Notice Board','Regular notices will be displayed'),
 (2,'Emergency Notice Board','Emergency notices will be displayed');
/*!40000 ALTER TABLE `notice_board_enum` ENABLE KEYS */;


--
-- Definition of table `notices`
--

DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `COMMUNITY_ID` int(10) unsigned NOT NULL,
  `NOTICE_BOARD_ID` int(10) unsigned NOT NULL,
  `POSTED_DATE` datetime NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(1000) NOT NULL,
  `POSTED_BY` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_NOTICES_1` (`COMMUNITY_ID`),
  KEY `FK_NOTICES_2` (`NOTICE_BOARD_ID`),
  KEY `FK_NOTICES_3` (`POSTED_BY`),
  CONSTRAINT `FK_NOTICES_1` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `communities` (`ID`),
  CONSTRAINT `FK_NOTICES_2` FOREIGN KEY (`NOTICE_BOARD_ID`) REFERENCES `notice_board_enum` (`ID`),
  CONSTRAINT `FK_NOTICES_3` FOREIGN KEY (`POSTED_BY`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notices`
--

/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;


--
-- Definition of table `parking_slots`
--

DROP TABLE IF EXISTS `parking_slots`;
CREATE TABLE `parking_slots` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `PARKING_ID` int(10) unsigned NOT NULL,
  `LOCATION` varchar(10) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_PARKING_SLOTS_1` (`PARKING_ID`),
  CONSTRAINT `FK_PARKING_SLOTS_1` FOREIGN KEY (`PARKING_ID`) REFERENCES `parkings` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parking_slots`
--

/*!40000 ALTER TABLE `parking_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `parking_slots` ENABLE KEYS */;


--
-- Definition of table `parkings`
--

DROP TABLE IF EXISTS `parkings`;
CREATE TABLE `parkings` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(45) NOT NULL,
  `COMMUNITY_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_PARKINGS_1` (`COMMUNITY_ID`),
  CONSTRAINT `FK_PARKINGS_1` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `communities` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parkings`
--

/*!40000 ALTER TABLE `parkings` DISABLE KEYS */;
INSERT INTO `parkings` (`ID`,`NAME`,`DESCRIPTION`,`COMMUNITY_ID`) VALUES 
 (1,'Parking A','Parking A',1),
 (2,'Parking B','Parking B',1),
 (3,'Parking East','Parking East',2),
 (4,'Parking West','Parking West',2);
/*!40000 ALTER TABLE `parkings` ENABLE KEYS */;


--
-- Definition of table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
CREATE TABLE `privileges` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `URL` varchar(150) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privileges`
--

/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
INSERT INTO `privileges` (`ID`,`NAME`,`DESCRIPTION`,`URL`) VALUES 
 (1,'Properties','Properties','eventhandler?event=propertiesList'),
 (2,'Complaints','Complaints','eventhandler?event=complaintsList'),
 (3,'Notice Board','Notice Board','eventhandler?event=noticeBoardList'),
 (4,'Parking','Parking','eventhandler?event=parkingList'),
 (5,'Admin','Admin','eventhandler?event=communityAdmin'),
 (6,'Amenities','Amenities','eventhandler?event=handleAmenities'),
 (7,'Visitors','Visitors','eventhandler?event=handleVisitors'),
 (8,'Payments','Payments','eventhandler?event=handlePayments'),
 (9,'SocietyManagement','Society Management','eventhandler?event=handleSocietyManagement'),
 (10,'ValueAddedServices','Value Added Services','eventhandler?event=handleValueAddedServices'),
 (11,'Security','Gate Security','eventhandler?event=handleSecurity');
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;


--
-- Definition of table `property_owners`
--

DROP TABLE IF EXISTS `property_owners`;
CREATE TABLE `property_owners` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `PROPERTY_ID` int(10) unsigned NOT NULL,
  `PROPERTY_TYPE_ID` int(10) unsigned NOT NULL,
  `OWNER_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_PROPERTY_OWNERS_1` (`PROPERTY_TYPE_ID`),
  KEY `FK_PROPERTY_OWNERS_2` (`OWNER_ID`),
  KEY `FK_PROPERTY_OWNERS_3` (`PROPERTY_ID`),
  CONSTRAINT `FK_PROPERTY_OWNERS_1` FOREIGN KEY (`PROPERTY_TYPE_ID`) REFERENCES `property_type_enum` (`ID`),
  CONSTRAINT `FK_PROPERTY_OWNERS_2` FOREIGN KEY (`OWNER_ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_PROPERTY_OWNERS_3` FOREIGN KEY (`PROPERTY_ID`) REFERENCES `flats` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `property_owners`
--

/*!40000 ALTER TABLE `property_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `property_owners` ENABLE KEYS */;


--
-- Definition of table `property_type_enum`
--

DROP TABLE IF EXISTS `property_type_enum`;
CREATE TABLE `property_type_enum` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `property_type_enum`
--

/*!40000 ALTER TABLE `property_type_enum` DISABLE KEYS */;
INSERT INTO `property_type_enum` (`ID`,`NAME`,`DESCRIPTION`) VALUES 
 (1,'Flat','Flat'),
 (2,'Villa','Villa'),
 (3,'Parking','Parking');
/*!40000 ALTER TABLE `property_type_enum` ENABLE KEYS */;


--
-- Definition of table `role_contexts`
--

DROP TABLE IF EXISTS `role_contexts`;
CREATE TABLE `role_contexts` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `USER_ID` int(10) unsigned NOT NULL,
  `COMMUNITY_ID` int(10) unsigned NOT NULL,
  `ROLE_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `UNIQUE_ROLE_CONTEXT` USING BTREE (`USER_ID`,`COMMUNITY_ID`,`ROLE_ID`),
  KEY `FK_ROLE_CONTEXTS_2` (`COMMUNITY_ID`),
  KEY `FK_ROLE_CONTEXTS_3` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_CONTEXTS_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_ROLE_CONTEXTS_2` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `communities` (`ID`),
  CONSTRAINT `FK_ROLE_CONTEXTS_3` FOREIGN KEY (`ROLE_ID`) REFERENCES `roles` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_contexts`
--

/*!40000 ALTER TABLE `role_contexts` DISABLE KEYS */;
INSERT INTO `role_contexts` (`ID`,`USER_ID`,`COMMUNITY_ID`,`ROLE_ID`) VALUES 
 (1,1,1,1),
 (2,1,2,2),
 (3,2,1,2),
 (4,2,2,1);
/*!40000 ALTER TABLE `role_contexts` ENABLE KEYS */;


--
-- Definition of table `role_privileges`
--

DROP TABLE IF EXISTS `role_privileges`;
CREATE TABLE `role_privileges` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `ROLE_ID` int(10) unsigned NOT NULL,
  `PRIVILEGE_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_ROLE_PRIVILEGES_1` (`ROLE_ID`),
  KEY `FK_ROLE_PRIVILEGES_2` (`PRIVILEGE_ID`),
  CONSTRAINT `FK_ROLE_PRIVILEGES_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `roles` (`ID`),
  CONSTRAINT `FK_ROLE_PRIVILEGES_2` FOREIGN KEY (`PRIVILEGE_ID`) REFERENCES `privileges` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_privileges`
--

/*!40000 ALTER TABLE `role_privileges` DISABLE KEYS */;
INSERT INTO `role_privileges` (`ID`,`ROLE_ID`,`PRIVILEGE_ID`) VALUES 
 (1,1,1),
 (2,1,2),
 (3,1,3),
 (4,1,4),
 (5,1,5),
 (6,2,1),
 (7,2,2),
 (8,2,3),
 (9,2,4),
 (10,1,6),
 (11,1,7),
 (12,1,8),
 (13,1,9),
 (14,1,10),
 (15,1,11),
 (16,2,6),
 (17,2,7),
 (19,2,8),
 (20,2,9),
 (21,2,10),
 (22,2,11);
 
/*!40000 ALTER TABLE `role_privileges` ENABLE KEYS */;


--
-- Definition of table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`ID`,`NAME`,`DESCRIPTION`) VALUES 
 (1,'Community Admin','Community Admin'),
 (2,'Property Owner','Property Owner');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


--
-- Definition of table `severity_enum`
--

DROP TABLE IF EXISTS `severity_enum`;
CREATE TABLE `severity_enum` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `severity_enum`
--

/*!40000 ALTER TABLE `severity_enum` DISABLE KEYS */;
INSERT INTO `severity_enum` (`ID`,`NAME`,`DESCRIPTION`) VALUES 
 (1,'High','High'),
 (2,'Medium','Medium'),
 (3,'Low','Low');
/*!40000 ALTER TABLE `severity_enum` ENABLE KEYS */;


--
-- Definition of table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(50) NOT NULL,
  `COUNTRY_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_STATES_1` (`COUNTRY_ID`),
  CONSTRAINT `FK_STATES_1` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `countries` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `states`
--

/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` (`ID`,`NAME`,`COUNTRY_ID`) VALUES 
 (1,'TamilNadu',1),
 (2,'Karanataka',1),
 (3,'Andrapradesh',1);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `EMAIL_ID` varchar(50) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `MOBILE_NO` varchar(12) NOT NULL,
  `FIRST_NAME` varchar(20) NOT NULL,
  `LAST_NAME` varchar(20) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`ID`,`EMAIL_ID`,`PASSWORD`,`MOBILE_NO`,`FIRST_NAME`,`LAST_NAME`) VALUES 
 (1,'gopinath.dhanapal@gmail.com','il@123','9916958269','Gopinath','Dhanapal'),
 (2,'vijayan.srinivasan@gmail.com','vijayan$786','9986508767','Vijayan','Srinivasan'),
 (3,'hivenki@gmail.com','il@123','9849948728','Venky','Reddy');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Definition of table `villas`
--

DROP TABLE IF EXISTS `villas`;
CREATE TABLE `villas` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `COMMUNITY_ID` int(10) unsigned NOT NULL,
  `PLOT_NO` varchar(10) NOT NULL,
  `NO_OF_FLOORS` int(10) unsigned NOT NULL,
  `NAME` varchar(45) NOT NULL,
  `NO_OF_BED_ROOMS` int(10) unsigned NOT NULL,
  `NO_OF_PARKINGS` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_VILLAS_1` (`COMMUNITY_ID`),
  CONSTRAINT `FK_VILLAS_1` FOREIGN KEY (`COMMUNITY_ID`) REFERENCES `communities` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `villas`
--

/*!40000 ALTER TABLE `villas` DISABLE KEYS */;
/*!40000 ALTER TABLE `villas` ENABLE KEYS */;


--
-- Definition of view `properties`
--

DROP TABLE IF EXISTS `properties`;
DROP VIEW IF EXISTS `properties`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `properties` AS select `f`.`ID` AS `PROPERTY_ID`,1 AS `PROPERTY_TYPE_ID`,`f`.`FLAT_NO` AS `PROPERTY_NAME`,`b`.`COMMUNITY_ID` AS `COMMUNITY_ID` from (`flats` `F` join `blocks` `B` on((`f`.`BLOCK_ID` = `b`.`ID`))) union all select `villas`.`ID` AS `PROPERTY_ID`,2 AS `PROPERTY_TYPE_ID`,`villas`.`NAME` AS `PROPERTY_NAME`,`villas`.`COMMUNITY_ID` AS `COMMUNITY_ID` from `villas`;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;