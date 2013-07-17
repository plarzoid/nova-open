DROP DATABASE IF EXISTS `owen_nova_open`;

CREATE DATABASE  IF NOT EXISTS `owen_nova_open` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `owen_nova_open`;
SET FOREIGN_KEY_CHECKS = 0; 

-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: nova_open
-- ------------------------------------------------------
-- Server version	5.5.29-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appearance_entry`
--

DROP TABLE IF EXISTS `appearance_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appearance_entry` (
  `ID` int(11) NOT NULL,
  `ARTIST_ID` int(11) NOT NULL,
  `EVENT_ID` int(11) NOT NULL,
  `LABEL` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  `MANUFACTURER_ID` int(11) DEFAULT NULL,
  `ARMY_FACTION_ID` int(11) DEFAULT NULL,
  `NOTE` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_APP_ENTRY_MAN_ID` (`MANUFACTURER_ID`),
  KEY `FK_APP_ENTRY_ARM_FAC_ID` (`ARMY_FACTION_ID`),
  CONSTRAINT `FK_APP_ENTRY_MAN_ID` FOREIGN KEY (`MANUFACTURER_ID`) REFERENCES `ref_manufacturer` (`ID`),
  CONSTRAINT `FK_APP_ENTRY_ARM_FAC_ID` FOREIGN KEY (`ARMY_FACTION_ID`) REFERENCES `ref_army_faction` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appearance_entry`
--

LOCK TABLES `appearance_entry` WRITE;
/*!40000 ALTER TABLE `appearance_entry` DISABLE KEYS */;
INSERT INTO `appearance_entry` VALUES (1,1,7,'SM Army','Space Marine Army',1,1,1,'This is a super sweet army of dudes','Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(2,1,25,'Awesome Mini','A kickass mini',2,8,8,NULL,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(3,2,25,'Another scifi model','A small scifi model',2,1,3,NULL,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(4,2,25,'Fantasty diorama','A bunch of minis',7,1,12,NULL,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(5,2,25,'Another fantasty diorama','This person is prolific',7,1,11,NULL,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(6,3,7,'Eldar FTW','An eldar army',1,1,3,NULL,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46');
/*!40000 ALTER TABLE `appearance_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appearance_score`
--

DROP TABLE IF EXISTS `appearance_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appearance_score` (
  `ID` int(11) NOT NULL,
  `ENTRY_ID` int(11) NOT NULL,
  `JUDGE_ID` int(11) NOT NULL,
  `BASE_SCORE` int(11) NOT NULL,
  `SCORE_MODIFIER` int(11) DEFAULT NULL,
  `JUDGE_COMMENT` text,
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_APP_SCORE_ENTRY_ID` (`ENTRY_ID`),
  KEY `FK_APP_SCORE_JUDGE_ID` (`JUDGE_ID`),
  CONSTRAINT `FK_APP_SCORE_ENTRY_ID` FOREIGN KEY (`ENTRY_ID`) REFERENCES `appearance_entry` (`ID`),
  CONSTRAINT `FK_APP_SCORE_JUDGE_ID` FOREIGN KEY (`JUDGE_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appearance_score`
--

LOCK TABLES `appearance_score` WRITE;
/*!40000 ALTER TABLE `appearance_score` DISABLE KEYS */;
INSERT INTO `appearance_score` VALUES (1,1,1,70,4,'This is a super long comment because why not, this field is a memo field so it can be rull long','Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(2,1,2,80,-3,'This seemed pretty good at first, but loses points on closer examination','Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(3,1,3,70,-1,'No comment','Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(4,2,1,90,-4,NULL,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(5,2,3,80,5,NULL,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(6,3,2,80,2,NULL,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(7,3,3,80,-1,NULL,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(8,4,1,50,5,NULL,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(9,4,2,50,2,NULL,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(10,4,3,20,4,'Does not meet basic standards','Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(11,5,1,70,2,NULL,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(12,6,2,90,3,'Awesome!','Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(13,6,3,80,-1,NULL,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46');
/*!40000 ALTER TABLE `appearance_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changelog`
--

DROP TABLE IF EXISTS `changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changelog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SCRIPT` varchar(100) NOT NULL,
  `RUN_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changelog`
--

LOCK TABLES `changelog` WRITE;
/*!40000 ALTER TABLE `changelog` DISABLE KEYS */;
INSERT INTO `changelog` VALUES (1,'001_nova_baseline.sql','2013-07-02 23:06:41'),(2,'002_insert_baseline_data.sql','2013-07-02 23:06:42'),(3,'010001001_Update_Seminars.sql','2013-07-02 23:06:42'),(4,'010001002_Insert_Multi_discount_events.sql','2013-07-02 23:06:42'),(5,'010001003_Insert_Infinity_Events.sql','2013-07-02 23:06:42'),(6,'010001014_Insert_Warma_Evenets.sql','2013-07-02 23:06:42'),(7,'010001005_Delete_unamed_magic_events.sql','2013-07-02 23:06:42'),(8,'010001007_Rebaseline_Event_Update_Registration.sql','2013-07-02 23:06:42'),(9,'010001008_Create_Table_Event_Discount.sql','2013-07-02 23:06:43'),(10,'010001009_Insert_version_properties.sql','2013-07-02 23:06:43'),(11,'010001010_Update_Weekend_Badge_Req_Values.sql','2013-07-02 23:06:43'),(12,'010001011_update_event_type_to_pass.sql','2013-07-02 23:06:43'),(13,'010001012_Rename_Discount_To_Bundle.sql','2013-07-02 23:06:43'),(14,'010001013_remove_early_bird_badges_from_bundle_table.sql','2013-07-02 23:06:43'),(15,'010001014_insert_new_seminars.sql','2013-07-02 23:06:43'),(16,'010001015_insert_comp_badge_into_events.sql','2013-07-02 23:06:43'),(17,'010001016_update_new_seminar_prices.sql','2013-07-02 23:06:43'),(18,'010002001_create_user_management_tables.sql','2013-07-02 23:06:43'),(19,'010002002_create_capital_palette_tables.sql','2013-07-02 23:06:43');
/*!40000 ALTER TABLE `changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `WEBSITE_URL` varchar(50) DEFAULT NULL,
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TYPE_ID` int(11) NOT NULL,
  `GAME_SYSTEM_ID` int(11) DEFAULT NULL,
  `NOVA_YEAR` year(4) NOT NULL,
  `EVENT_START` datetime DEFAULT NULL,
  `EVENT_END` datetime DEFAULT NULL,
  `IS_UNIQUE` tinyint(1) NOT NULL DEFAULT '1',
  `IS_WEEKEND_BADGE_REQ` tinyint(1) NOT NULL DEFAULT '1',
  `PRICE` decimal(5,2) DEFAULT '0.00',
  `AVAILABLE_QTY` int(11) DEFAULT NULL,
  `NOTE` varchar(1000) DEFAULT NULL,
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_GAME_SYS_ID` (`GAME_SYSTEM_ID`),
  KEY `FK_TYPE_ID` (`TYPE_ID`),
  CONSTRAINT `FK_GAME_SYS_ID` FOREIGN KEY (`GAME_SYSTEM_ID`) REFERENCES `lt_game_system` (`ID`),
  CONSTRAINT `FK_TYPE_ID` FOREIGN KEY (`TYPE_ID`) REFERENCES `lt_event_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Weekend Badge','NULL',8,NULL,2013,'2013-08-29 00:00:00','2013-09-02 00:00:00',1,0,45.00,NULL,'coupon code NOVA 2013 - $10 DISCOUNT UNTIL April 15, $5 discount April 15 - August 18','root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(2,'Friday Day Pass','NULL',8,NULL,2013,'2013-08-30 00:00:00','2013-08-30 00:00:00',1,0,15.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(3,'Saturday Day Pass','NULL',8,NULL,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,0,15.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(4,'Sunday Day Pass','NULL',8,NULL,2013,'2013-09-02 00:00:00','2013-09-13 00:00:00',1,0,15.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(5,'Pre order - NOVA Open 2013 t-shirt','NULL',1,NULL,2013,NULL,NULL,1,0,12.00,NULL,'only available for pre-order WITH a weekend badge - needs comment box  for t-shirt size','root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(6,'VIP bag','NULL',1,NULL,2013,NULL,NULL,1,0,80.00,78,'needs comment box labeled t-shirt size; + area for identifying army for army-spec swag','root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(7,'40K GT','NULL',2,1,2013,'2013-08-30 00:00:00','2013-09-02 00:00:00',1,1,65.00,256,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(8,'40K Narrative','NULL',2,1,2013,'2013-08-29 00:00:00','2013-09-02 00:00:00',1,1,40.00,60,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(9,'40K Trios','NULL',2,1,2013,'2013-08-30 00:00:00','2013-09-02 00:00:00',1,1,90.00,20,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(10,'40K Invitational','NULL',2,1,2013,'2013-08-30 00:00:00','2013-09-02 00:00:00',1,1,50.00,32,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(11,'Fantasy','NULL',2,6,2013,'2013-09-01 00:00:00','2013-09-02 00:00:00',1,1,65.00,64,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(12,'Warmachine - all tournaments','NULL',7,5,2013,'2013-08-29 00:00:00','2013-09-02 00:00:00',1,1,-50.00,64,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(13,'Warmachine - any single tournament','NULL',2,5,2013,'2013-08-29 00:00:00','2013-09-02 00:00:00',1,1,10.00,64,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(14,'Flames of War - Mid-War','NULL',2,2,2013,'2013-08-30 00:00:00','2013-08-30 00:00:00',1,1,15.00,32,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(15,'Flames of War - Late War','NULL',2,2,2013,'2013-09-01 00:00:00','2013-09-02 00:00:00',1,1,25.00,32,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(16,'Flames of War - Double-feature','Entry into both Mid & Late War tournaments',2,2,2013,'2013-08-30 00:00:00','2013-09-02 00:00:00',1,1,35.00,32,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(17,'Infinity','NULL',2,3,2013,'2013-08-29 00:00:00','2013-08-30 00:00:00',1,1,20.00,24,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(18,'Magic - Last Chance Qualifier','NULL',2,4,2013,'2013-08-29 00:00:00','2013-08-29 00:00:00',1,1,10.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(19,'Magic - Sealed Deck Event ','NULL',2,4,2013,'2013-08-30 00:00:00','2013-08-30 00:00:00',1,1,25.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(20,'Magic - Mega Friday Night Magic','NULL',2,4,2013,'2013-08-30 00:00:00','2013-08-30 00:00:00',1,1,10.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(21,'Magic - Standard Tournament','NULL',2,4,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,25.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(22,'Magic - Modern Tournament','NULL',2,4,2013,'2013-09-02 00:00:00','2013-09-02 00:00:00',1,1,25.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(23,'Magic - Weekend extravaganza','All scheduled Magic events (excluding pickups)',7,4,2013,'2013-08-29 00:00:00','2013-09-02 00:00:00',1,1,-40.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(24,'Capital Palette - Unlimited Entries','NULL',4,NULL,2013,'2013-08-30 00:00:00','2013-09-02 00:00:00',1,1,25.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(25,'Capital Palette - single model','NULL',4,NULL,2013,'2013-08-30 00:00:00','2013-09-02 00:00:00',1,1,5.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(26,'Capital Palette -one  collection','NULL',4,NULL,2013,'2013-08-30 00:00:00','2013-09-02 00:00:00',1,1,10.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(27,'Donation - Fisher House','NULL',5,NULL,2013,NULL,NULL,1,0,NULL,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(28,'Donation - Doctors Without Borders','NULL',5,NULL,2013,NULL,NULL,1,0,NULL,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(29,'GEEK NATION TOURS','NULL',6,NULL,2013,NULL,NULL,1,0,NULL,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(30,'01 - Basic Black Intro','NULL',3,NULL,2013,'2013-08-29 00:00:00','2013-08-29 00:00:00',1,1,25.00,20,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(31,'02 - Airbrushing Minis','NULL',3,NULL,2013,'2013-08-29 00:00:00','2013-08-29 00:00:00',1,1,15.00,15,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(32,'03 - Basic Black Intro','NULL',3,NULL,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,25.00,20,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(33,'04 - Airbrushing Minis','NULL',3,NULL,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,15.00,15,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(34,'05 - Weathering Techniques','NULL',3,NULL,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,15.00,15,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(35,'06 - Basing Your Models','NULL',3,NULL,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,15.00,15,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(36,'07 - Take-home Tectonic Terrain','NULL',3,NULL,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,25.00,20,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(37,'08 - Using Pigments on Minis','NULL',3,NULL,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,15.00,15,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(38,'09 - Basic Black Advanced','Must have attended seminar 1 or 3',3,NULL,2013,'2013-08-31 00:00:00','2013-08-31 00:00:00',1,1,150.00,10,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(39,'10 - Masterclass Painting','NULL',3,NULL,2013,'2013-08-31 00:00:00','2013-08-31 00:00:00',1,1,15.00,15,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(40,'11 - Using Pigments on Minis','NULL',3,NULL,2013,'2013-08-31 00:00:00','2013-08-31 00:00:00',1,1,15.00,15,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(41,'12 - Basing Your Models','NULL',3,NULL,2013,'2013-08-31 00:00:00','2013-08-31 00:00:00',1,1,15.00,15,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(42,'13 - Airbrushing Minis','NULL',3,NULL,2013,'2013-08-31 00:00:00','2013-08-31 00:00:00',1,1,15.00,15,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(43,'14 - Using Pigments on Minis','NULL',3,NULL,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,15.00,15,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(44,'15 - Airbrushing Minis','NULL',3,NULL,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,15.00,15,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(45,'16 - Masterclass Painting','NULL',3,NULL,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,15.00,15,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(46,'17 - Weathering Techniques','NULL',3,NULL,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,15.00,15,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(47,'Infinity Hunger Games #1','NULL',2,3,2013,'2013-08-30 00:00:00','2013-08-30 00:00:00',1,1,10.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(48,'Infinity Main ITS Tournament','NULL',2,3,2013,'2013-08-31 00:00:00','2013-08-31 00:00:00',1,1,30.00,32,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(49,'Infinity Hunger Games #2','NULL',2,3,2013,'2013-08-31 00:00:00','2013-08-31 00:00:00',1,1,10.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(50,'Infinity Team Tournament','NULL',2,3,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,15.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(51,'Infinity Weekend Pass','(Counts as following discounts: $35 (badge), $10 (Deathmatch), $30 (5-Round GT), $10 (Unique deathmatch), $15 (Fusion), $5 (Capital Palette entry)) ~ Total value $105',7,NULL,2013,NULL,'2013-08-31 00:00:00',1,1,-20.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(52,'WM/H - Tierany Tournament','NULL',2,5,2013,NULL,'2013-08-31 00:00:00',1,1,10.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(53,'WM/H - Specialists Tournament','NULL',2,5,2013,NULL,'2013-09-01 00:00:00',1,1,10.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(54,'WM/H - Trifecta Team Tournament','NULL',2,5,2013,NULL,NULL,1,1,10.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(55,'WM/H - Death Race','NULL',2,5,2013,NULL,NULL,1,1,10.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(56,'WM/H - Who is the Boss','NULL',2,5,2013,NULL,NULL,1,1,10.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(57,'WM/H - Harcore Tournament','NULL',2,5,2013,NULL,NULL,1,1,10.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(58,'WM/H - Old-Style Masters','NULL',2,5,2013,NULL,NULL,1,1,10.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(59,'WM/H - Flanks','NULL',2,5,2013,NULL,NULL,1,1,10.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(60,'Deluxe Seminar Pass','NULL',7,NULL,2013,NULL,NULL,1,1,-10.00,15,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(61,'Weekend Badge Early Bird','NULL',8,NULL,2013,NULL,NULL,1,0,-10.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(62,'Weekend Badge Pre-sale','NULL',8,NULL,2013,NULL,NULL,1,0,-5.00,NULL,NULL,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(63,'American Craft Beer Seminar','NULL',3,NULL,2013,'2013-08-31 00:00:00','2013-08-31 00:00:00',1,1,50.00,20,'Not eligible for seminar pass','root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(64,'American Craft Cocktail Seminar','NULL',3,NULL,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,50.00,20,'Not eligible for seminar pass','root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(65,'Seminar 20: Hirst Arts Terrain',NULL,3,NULL,2013,'2013-08-29 00:00:00','2013-08-29 00:00:00',1,1,15.00,NULL,NULL,'root@localhost','2013-07-02 23:06:43','root@localhost','2013-07-02 23:06:43'),(67,'Seminar 21: Build A Display Board','with Chris ÔÇ£JawaballsÔÇØ Dubuque',3,NULL,2013,'2013-08-30 00:00:00','2013-08-30 00:00:00',1,1,15.00,NULL,NULL,'root@localhost','2013-07-02 23:06:43','root@localhost','2013-07-02 23:06:43'),(68,'Seminar 22: Hirst Arts Terrain','Tim Stone',3,NULL,2013,'2013-08-30 00:00:00','2013-08-30 00:00:00',1,1,15.00,NULL,NULL,'root@localhost','2013-07-02 23:06:43','root@localhost','2013-07-02 23:06:43'),(69,'Seminar 26: Blending 101','Caleb Wissenback',3,NULL,2013,'2013-08-30 00:00:00','2013-08-30 00:00:00',1,1,15.00,NULL,NULL,'root@localhost','2013-07-02 23:06:43','root@localhost','2013-07-02 23:06:43'),(70,'Seminar 23: Primer to Tabletop','Caleb Wissenback',3,NULL,2013,'2013-08-31 00:00:00','2013-08-31 00:00:00',1,1,15.00,NULL,NULL,'root@localhost','2013-07-02 23:06:43','root@localhost','2013-07-02 23:06:43'),(71,'Seminar 24: Freehanding Minis','Chris ÔÇ£JawaballsÔÇØ Dubuque',3,NULL,2013,'2013-08-31 00:00:00','2013-08-31 00:00:00',1,1,15.00,NULL,NULL,'root@localhost','2013-07-02 23:06:43','root@localhost','2013-07-02 23:06:43'),(72,'Seminar 25: Max Your Paint Score','Caleb Wissenback',3,NULL,2013,'2013-08-31 00:00:00','2013-08-31 00:00:00',1,1,15.00,NULL,NULL,'root@localhost','2013-07-02 23:06:43','root@localhost','2013-07-02 23:06:43'),(73,'Comp Badge','Complimentary weekend badge',8,NULL,2013,'2013-08-31 00:00:00','2013-09-02 00:00:00',1,0,0.00,NULL,NULL,'root@localhost','2013-07-02 23:06:43','root@localhost','2013-07-02 23:06:43');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_bundle`
--

DROP TABLE IF EXISTS `event_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_bundle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BUNDLE_ID` int(11) DEFAULT NULL,
  `EVENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EVENT_BUNDLE_EVENT_ID` (`EVENT_ID`),
  KEY `FK_EVENT_BUNDLE_BUNDLE_ID` (`BUNDLE_ID`),
  CONSTRAINT `FK_EVENT_BUNDLE_BUNDLE_ID` FOREIGN KEY (`BUNDLE_ID`) REFERENCES `event` (`ID`),
  CONSTRAINT `FK_EVENT_BUNDLE_EVENT_ID` FOREIGN KEY (`EVENT_ID`) REFERENCES `event` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_bundle`
--

LOCK TABLES `event_bundle` WRITE;
/*!40000 ALTER TABLE `event_bundle` DISABLE KEYS */;
INSERT INTO `event_bundle` VALUES (1,16,14),(2,16,15),(3,23,18),(4,23,19),(5,23,20),(6,23,21),(7,23,22),(8,51,47),(9,51,48),(10,51,49),(11,51,50),(12,12,52),(13,12,53),(14,12,54),(15,12,55),(16,12,56),(17,12,57),(18,12,58),(19,12,59);
/*!40000 ALTER TABLE `event_bundle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_match`
--

DROP TABLE IF EXISTS `event_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_match` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERSON_1_ID` int(11) NOT NULL,
  `PERSON_2_ID` int(11) NOT NULL,
  `EVENT_ROUND_ID` int(11) NOT NULL,
  `RESULT_CD` varchar(20) NOT NULL,
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDX_E_M_PERSON_ID_ROUND_ID` (`PERSON_1_ID`,`PERSON_2_ID`,`EVENT_ROUND_ID`),
  KEY `FK_E_M_PERSON_2_ID` (`PERSON_2_ID`),
  KEY `FK_E_M_ROUND_ID` (`EVENT_ROUND_ID`),
  CONSTRAINT `FK_E_M_PERSON_1_ID` FOREIGN KEY (`PERSON_1_ID`) REFERENCES `person` (`ID`),
  CONSTRAINT `FK_E_M_PERSON_2_ID` FOREIGN KEY (`PERSON_2_ID`) REFERENCES `person` (`ID`),
  CONSTRAINT `FK_E_M_ROUND_ID` FOREIGN KEY (`EVENT_ROUND_ID`) REFERENCES `event_round` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_match`
--

LOCK TABLES `event_match` WRITE;
/*!40000 ALTER TABLE `event_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_material`
--

DROP TABLE IF EXISTS `event_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_material` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `MATERIAL_TYPE_ID` int(11) NOT NULL,
  `EVENT_ID` int(11) NOT NULL,
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EVENT_ID` (`EVENT_ID`),
  KEY `FK_MAT_TYPE_ID` (`MATERIAL_TYPE_ID`),
  CONSTRAINT `FK_EVENT_ID` FOREIGN KEY (`EVENT_ID`) REFERENCES `event` (`ID`),
  CONSTRAINT `FK_MAT_TYPE_ID` FOREIGN KEY (`MATERIAL_TYPE_ID`) REFERENCES `lt_event_material_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_material`
--

LOCK TABLES `event_material` WRITE;
/*!40000 ALTER TABLE `event_material` DISABLE KEYS */;
INSERT INTO `event_material` VALUES (1,'Weekend Badge','Standard weekend badge',1,1,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(2,'Swag Bag','Standard swag bag for everyone who buys a weekend pass',4,1,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(3,'VIP Badge','Special badge for VIP members',1,2,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(4,'VIP Bag','Special bag for VIP holders. Upgraded swag.',1,2,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(5,'40k Guidebook','Mission and rules primer for the 40k GT',2,3,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(6,'40k Scoresheet','Scoresheet for the 40k GT',3,3,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(7,'40k Narrative scoresheet','Scoresheet for the 40k Narrative',3,5,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(8,'40k Narrative Guidebook','Mission and rules primer for the 40k Narrative',2,5,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(9,'Fantasy GT Guidebook','Mission and rules primer for the Fantasy GT',2,4,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42'),(10,'Fantasy GT Scoresheet','Scoresheet for the Fantasy GT',3,4,'root@localhost','2013-07-02 23:06:42','root@localhost','2013-07-02 23:06:42');
/*!40000 ALTER TABLE `event_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_round`
--

DROP TABLE IF EXISTS `event_round`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_round` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_ID` int(11) NOT NULL,
  `ROUND_NUM` int(11) NOT NULL,
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_E_EVENT_ID` (`EVENT_ID`),
  CONSTRAINT `FK_E_EVENT_ID` FOREIGN KEY (`EVENT_ID`) REFERENCES `event` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_round`
--

LOCK TABLES `event_round` WRITE;
/*!40000 ALTER TABLE `event_round` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_round` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lt_account_status`
--

DROP TABLE IF EXISTS `lt_account_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lt_account_status` (
  `ID` int(11) NOT NULL,
  `LABEL` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lt_account_status`
--

LOCK TABLES `lt_account_status` WRITE;
/*!40000 ALTER TABLE `lt_account_status` DISABLE KEYS */;
INSERT INTO `lt_account_status` VALUES (1,'Active','User is currently active'),(2,'Inactive','User is inactive and cannot log in'),(3,'Locked','User account is locked'),(4,'Pending','User account is pending approval');
/*!40000 ALTER TABLE `lt_account_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lt_appearance_category`
--

DROP TABLE IF EXISTS `lt_appearance_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lt_appearance_category` (
  `ID` int(11) NOT NULL,
  `LABEL` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lt_appearance_category`
--

LOCK TABLES `lt_appearance_category` WRITE;
/*!40000 ALTER TABLE `lt_appearance_category` DISABLE KEYS */;
INSERT INTO `lt_appearance_category` VALUES (1,'Army Appearance','Game system army appearance score'),(2,'SciFi - Small','Single small miniature'),(3,'SciFi - Large','Single large miniature'),(4,'SciFi - Collection','Multiple miniatures in a collection, squad, or diorama'),(5,'Fantasy - Small','Single small miniature'),(6,'Fantasy - Large','Single large miniature'),(7,'Fantasy - Collection','Multiple miniatures in a collection, squad, or diorama'),(8,'Historical- Small','Single small miniature'),(9,'Historical- Large','Single large miniature'),(10,'Historical- Collection','Multiple miniatures in a collection, squad, or diorama');
/*!40000 ALTER TABLE `lt_appearance_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lt_country`
--

DROP TABLE IF EXISTS `lt_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lt_country` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lt_country`
--

LOCK TABLES `lt_country` WRITE;
/*!40000 ALTER TABLE `lt_country` DISABLE KEYS */;
INSERT INTO `lt_country` VALUES (1,'USA',NULL),(2,'Australia',NULL),(3,'Canada',NULL),(4,'France',NULL),(5,'Germany',NULL),(6,'Ireland',NULL),(7,'New Zealand',NULL),(8,'Russia',NULL),(9,'United Kingdom',NULL);
/*!40000 ALTER TABLE `lt_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lt_event_material_type`
--

DROP TABLE IF EXISTS `lt_event_material_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lt_event_material_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lt_event_material_type`
--

LOCK TABLES `lt_event_material_type` WRITE;
/*!40000 ALTER TABLE `lt_event_material_type` DISABLE KEYS */;
INSERT INTO `lt_event_material_type` VALUES (1,'Badge','Pre-requisite for participation in other events'),(2,'Primer','Basic event primer/guide'),(3,'Scoresheet','Scoresheet for use in the event'),(4,'Swag','Swag bags or other bonus materials, medals, etc.'),(5,'Product','Product such as sealed magic product'),(6,'Other','Other type of material given to player');
/*!40000 ALTER TABLE `lt_event_material_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lt_event_type`
--

DROP TABLE IF EXISTS `lt_event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lt_event_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lt_event_type`
--

LOCK TABLES `lt_event_type` WRITE;
/*!40000 ALTER TABLE `lt_event_type` DISABLE KEYS */;
INSERT INTO `lt_event_type` VALUES (1,'Non-event','Weekend passes, VIP status, and other things people can purchase'),(2,'Tournament','A game tournament'),(3,'Seminar','A single speaker or learning event. No results recorded'),(4,'Art Competition','An art related event'),(5,'Donation','A donation to one of our charitable causes'),(6,'Other','Event type that does not fall into other categories'),(7,'Discount','Special \"event\" is a multi-discount'),(8,'Pass','All weekend badges');
/*!40000 ALTER TABLE `lt_event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lt_game_system`
--

DROP TABLE IF EXISTS `lt_game_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lt_game_system` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lt_game_system`
--

LOCK TABLES `lt_game_system` WRITE;
/*!40000 ALTER TABLE `lt_game_system` DISABLE KEYS */;
INSERT INTO `lt_game_system` VALUES (1,'40k','Warhammer 40,000'),(2,'FOW','Flames of War WW2 Strategy game'),(3,'Infinity','Infinity skirmish game'),(4,'Magic','Magic: The Gathering card game'),(5,'Warmachine','Warmachine/Hordes'),(6,'WHFB','Warhammer Fantasy Battles');
/*!40000 ALTER TABLE `lt_game_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lt_state`
--

DROP TABLE IF EXISTS `lt_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lt_state` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lt_state`
--

LOCK TABLES `lt_state` WRITE;
/*!40000 ALTER TABLE `lt_state` DISABLE KEYS */;
INSERT INTO `lt_state` VALUES (1,'AL','Alabama'),(2,'AK','Alaska'),(3,'AZ','Arizona'),(4,'AR','Arkansas'),(5,'CA','California'),(6,'CO','Colorado'),(7,'CT','Connecticut'),(8,'DE','Delaware'),(9,'DC','District of Columbia'),(10,'FL','Florida'),(11,'GA','Georgia'),(12,'HI','Hawaii'),(13,'ID','Idaho'),(14,'IL','Illinois'),(15,'IN','Indiana'),(16,'IA','Iowa'),(17,'KS','Kansas'),(18,'KY','Kentucky'),(19,'LA','Louisiana'),(20,'ME','Maine'),(21,'MD','Maryland'),(22,'MA','Massachusetts'),(23,'MI','Michigan'),(24,'MN','Minnesota'),(25,'MS','Mississippi'),(26,'MO','Missouri'),(27,'MT','Montana'),(28,'NE','Nebraska'),(29,'NV','Nevada'),(30,'NH','New Hampshire'),(31,'NJ','New Jersey'),(32,'NM','New Mexico'),(33,'NY','New York'),(34,'NC','North Carolina'),(35,'ND','North Dakota'),(36,'OH','Ohio'),(37,'OK','Oklahoma'),(38,'OR','Oregon'),(39,'PA','Pennsylvania'),(40,'RI','Rhode Island'),(41,'SC','South Carolina'),(42,'SD','South Dakota'),(43,'TN','Tennessee'),(44,'TX','Texas'),(45,'UT','Utah'),(46,'VT','Vermont'),(47,'VA','Virginia'),(48,'WA','Washington'),(49,'WV','West Virginia'),(50,'WI','Wisconsin'),(51,'WY','Wyoming'),(52,'N/A','Not Applicable');
/*!40000 ALTER TABLE `lt_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lt_user_role`
--

DROP TABLE IF EXISTS `lt_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lt_user_role` (
  `ID` int(11) NOT NULL,
  `LABEL` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lt_user_role`
--

LOCK TABLES `lt_user_role` WRITE;
/*!40000 ALTER TABLE `lt_user_role` DISABLE KEYS */;
INSERT INTO `lt_user_role` VALUES (1,'Admin','Application administrator'),(2,'User','Basic application user'),(3,'Judge','User with judge permissions');
/*!40000 ALTER TABLE `lt_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_history`
--

DROP TABLE IF EXISTS `password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_history` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `CHANGED_DATE` datetime NOT NULL,
  `PASSWORD_VALUE` varchar(255) NOT NULL,
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PWDHIST_ID_USER_ID` (`USER_ID`),
  CONSTRAINT `FK_PWDHIST_ID_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_history`
--

LOCK TABLES `password_history` WRITE;
/*!40000 ALTER TABLE `password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(20) NOT NULL,
  `MIDDLE_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(20) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `STATE_ID` int(11) DEFAULT NULL,
  `COUNTRY_ID` int(11) DEFAULT NULL,
  `ZIP` varchar(10) DEFAULT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `WEBSITE_URL` varchar(50) DEFAULT NULL,
  `NOTE` varchar(1000) DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) NOT NULL DEFAULT '1',
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ST_STATE_ID` (`STATE_ID`),
  KEY `FK_CNTRY_ID` (`COUNTRY_ID`),
  CONSTRAINT `FK_ST_STATE_ID` FOREIGN KEY (`STATE_ID`) REFERENCES `lt_state` (`ID`),
  CONSTRAINT `FK_CNTRY_ID` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `lt_country` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Joe',NULL,'Smith','joe.smith@test.org',NULL,'Nowhere',35,NULL,'12345',NULL,NULL,NULL,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(2,'Jane',NULL,'Doe','jane.doe@test.org','123 Nowhere Ln','A Place',26,1,'45678','123-456-7891',NULL,NULL,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(3,'Chris',NULL,'Kim','chris.kim@test.com','456 Address','Cityville',10,1,'23847','123-456-7892',NULL,NULL,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(4,'John',NULL,'Connor','john.connor@cyberdyne.com','1 Overseas Address','Township',NULL,NULL,NULL,'123-456-7893',NULL,NULL,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_NAME` varchar(30) NOT NULL,
  `PROPERTY_VALUE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,'client_major_version','1'),(2,'client_minor_version','10'),(3,'db_major_version','9'),(4,'db_minor_version','1');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_army_faction`
--

DROP TABLE IF EXISTS `ref_army_faction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_army_faction` (
  `ID` int(11) NOT NULL,
  `LABEL` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `GAME_SYSTEM_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_FACTION_GAMESYS_ID` (`GAME_SYSTEM_ID`),
  CONSTRAINT `FK_FACTION_GAMESYS_ID` FOREIGN KEY (`GAME_SYSTEM_ID`) REFERENCES `lt_game_system` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_army_faction`
--

LOCK TABLES `ref_army_faction` WRITE;
/*!40000 ALTER TABLE `ref_army_faction` DISABLE KEYS */;
INSERT INTO `ref_army_faction` VALUES (1,'Space Marines','Basic Space Marines',1),(2,'Imperial Guard',NULL,1),(3,'Eldar','GW Eldar',1),(4,'Assorted 40k','Mixed 40k models',1),(5,'German','Wermacht units',2),(6,'Australian','FoW Aussies',2),(7,'Cryx',NULL,5),(8,'Eriadne',NULL,3),(9,'Menoth',NULL,5),(10,'Goblins',NULL,6),(11,'Bretonnians',NULL,6),(12,'High Elves',NULL,6),(13,'Assorted Fantasy','Mixed fantasy models',NULL);
/*!40000 ALTER TABLE `ref_army_faction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_manufacturer`
--

DROP TABLE IF EXISTS `ref_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_manufacturer` (
  `ID` int(11) NOT NULL,
  `LABEL` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_manufacturer`
--

LOCK TABLES `ref_manufacturer` WRITE;
/*!40000 ALTER TABLE `ref_manufacturer` DISABLE KEYS */;
INSERT INTO `ref_manufacturer` VALUES (1,'GW','Games Workshop'),(2,'PP','Privateer Press'),(3,'BF','Battlefront'),(4,'Reaper','Reaper Minis'),(5,'WoC','Wizards of the Coast'),(6,'Victoria','Victoria Miniatures'),(7,'Custom','Custom, scratchbuilt, or self-sculpted'),(8,'Corvus','Corvus Belli');
/*!40000 ALTER TABLE `ref_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERSON_ID` int(11) NOT NULL,
  `EVENT_ID` int(11) NOT NULL,
  `QUANTITY` int(11) NOT NULL DEFAULT '1',
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_P_E_EVENT_ID` (`EVENT_ID`),
  KEY `IDX_R_PERSON_ID_EVENT_ID` (`PERSON_ID`,`EVENT_ID`),
  CONSTRAINT `FK_P_E_PERSON_ID` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`ID`),
  CONSTRAINT `FK_P_E_EVENT_ID` FOREIGN KEY (`EVENT_ID`) REFERENCES `event` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (1,1,1,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(2,1,7,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(3,1,10,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(4,2,1,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(5,2,14,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(6,2,15,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(7,2,16,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(8,2,33,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(9,3,2,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(10,3,48,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(11,3,49,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(12,4,8,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(13,4,9,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(14,4,10,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_ID` int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_T_EVENT_ID` (`EVENT_ID`),
  CONSTRAINT `FK_T_EVENT_ID` FOREIGN KEY (`EVENT_ID`) REFERENCES `event` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `FIRST_NAME` varchar(50) NOT NULL,
  `MIDDLE_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `ACCOUNT_STATUS` int(11) NOT NULL,
  `CNT_LOGIN_FAIL` int(11) NOT NULL,
  `LAST_LOGIN_DATE` datetime NOT NULL,
  `IS_PW_CHANGE_REQUIRED` bit(1) NOT NULL,
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ACTSTATUS_USER_ID` (`ACCOUNT_STATUS`),
  CONSTRAINT `FK_ACTSTATUS_USER_ID` FOREIGN KEY (`ACCOUNT_STATUS`) REFERENCES `lt_account_status` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'joe.smith','Joe','S.','Smith','joe.smith@test.org',1,0,'2013-07-02 23:06:46','\0','Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(2,'captain.judge','Captain',NULL,'Judge','cpt.judge@test.com',1,0,'2013-07-02 23:06:46','\0','Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(3,'super.shades','Shades',NULL,'The Man','shades.theman@test.com',1,0,'2013-07-02 23:06:46','\0','Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_club_person`
--

DROP TABLE IF EXISTS `x_club_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `x_club_person` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERSON_ID` int(11) NOT NULL,
  `CLUB_ID` int(11) NOT NULL,
  `IS_LEAD` tinyint(1) NOT NULL DEFAULT '0',
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDX_CB_P_PERSON_ID_CLUB_ID` (`PERSON_ID`,`CLUB_ID`),
  KEY `FK_CB_P_CLUB_ID` (`CLUB_ID`),
  CONSTRAINT `FK_CB_P_PERSON_ID` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`ID`),
  CONSTRAINT `FK_CB_P_CLUB_ID` FOREIGN KEY (`CLUB_ID`) REFERENCES `club` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_club_person`
--

LOCK TABLES `x_club_person` WRITE;
/*!40000 ALTER TABLE `x_club_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_club_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_person_team`
--

DROP TABLE IF EXISTS `x_person_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `x_person_team` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEAM_ID` int(11) NOT NULL,
  `PERSON_ID` int(11) NOT NULL,
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_P_T_PERSON_ID` (`PERSON_ID`),
  KEY `FK_P_T_TEAM_ID` (`TEAM_ID`),
  CONSTRAINT `FK_P_T_PERSON_ID` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`ID`),
  CONSTRAINT `FK_P_T_TEAM_ID` FOREIGN KEY (`TEAM_ID`) REFERENCES `team` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_person_team`
--

LOCK TABLES `x_person_team` WRITE;
/*!40000 ALTER TABLE `x_person_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_person_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_user_user_role`
--

DROP TABLE IF EXISTS `x_user_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `x_user_user_role` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_ROLE` int(11) NOT NULL,
  `LAST_MODIFIED_BY` varchar(55) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(55) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_USER_ID` (`USER_ID`),
  KEY `FK_USER_ROLE_ID` (`USER_ROLE`),
  CONSTRAINT `FK_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `FK_USER_ROLE_ID` FOREIGN KEY (`USER_ROLE`) REFERENCES `lt_user_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_user_user_role`
--

LOCK TABLES `x_user_user_role` WRITE;
/*!40000 ALTER TABLE `x_user_user_role` DISABLE KEYS */;
INSERT INTO `x_user_user_role` VALUES (1,1,1,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(2,1,3,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(3,2,2,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(4,2,3,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(5,3,2,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46'),(6,3,3,'Admin','2013-07-02 23:06:46','Admin','2013-07-02 23:06:46');
/*!40000 ALTER TABLE `x_user_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-02 23:11:11
SET FOREIGN_KEY_CHECKS = 1; 
