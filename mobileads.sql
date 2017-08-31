-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mobileads
-- ------------------------------------------------------
-- Server version	5.5.57

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
-- Table structure for table `advertiser`
--

DROP TABLE IF EXISTS `advertiser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertiser` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `fullName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `companyName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `charge` double DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertiser`
--

LOCK TABLES `advertiser` WRITE;
/*!40000 ALTER TABLE `advertiser` DISABLE KEYS */;
INSERT INTO `advertiser` VALUES (2,'tungnv@abcd.com','Tung',NULL,'2323423523','fgfgfgf',NULL,'NEW','2017-08-23 08:33:59'),(3,'tungnv1@abc.com','Tung Nguyen1fggggggggggggggggggggggggggggggggggggggggggggggggggggg',NULL,'0913515759','Fintechviet',500000000,NULL,'2017-08-28 06:51:11'),(4,'tungnv2@abc.com','Tung Nguyen',NULL,'0913515759','abc',NULL,NULL,'2017-08-25 09:39:28'),(5,'tungnv3@abc.com','sdsd',NULL,'0913515759','fsgdg',NULL,NULL,'2017-08-25 09:39:50');
/*!40000 ALTER TABLE `advertiser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `advertiserId` bigint(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `isFreCap` tinyint(1) DEFAULT NULL,
  `freCap` int(11) DEFAULT NULL,
  `freCapDuration` int(11) DEFAULT NULL,
  `freCapType` varchar(10) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `advertiserPK_idx` (`advertiserId`),
  CONSTRAINT `advertiserPK` FOREIGN KEY (`advertiserId`) REFERENCES `advertiser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
INSERT INTO `campaign` VALUES (1,3,'','2017-02-08 00:00:00',NULL,0,5,2,'DAY','','NEW','2017-08-29 03:31:53');
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creative`
--

DROP TABLE IF EXISTS `creative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creative` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `advertiserId` bigint(11) DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `body` text,
  `alt` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `template` varchar(10) DEFAULT NULL,
  `imageLink` varchar(255) DEFAULT NULL,
  `videoLink` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `advertiserPK_idx` (`advertiserId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creative`
--

LOCK TABLES `creative` WRITE;
/*!40000 ALTER TABLE `creative` DISABLE KEYS */;
INSERT INTO `creative` VALUES (1,3,'Test2','<p>https://drive.google.com/drive/u/1/folders/0Bxwc1saAqtz2VkhYQXlQbEVIeUE</p>\r\n','','video',NULL,'https://drive.google.com/drive/u/1/folders/0Bxwc1saAqtz2VkhYQXlQbEVIeUE',NULL,'2017-08-29 09:55:50'),(11,3,'test1','None','alt','image','/abc/IMG_0056_AD.jpg',NULL,NULL,'2017-08-31 02:58:19');
/*!40000 ALTER TABLE `creative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `campaignId` bigint(11) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `isFreCap` tinyint(1) DEFAULT NULL,
  `freCap` int(11) DEFAULT NULL,
  `freCapDuration` int(11) DEFAULT NULL,
  `freCapType` varchar(10) DEFAULT NULL,
  `rateType` varchar(10) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price` double DEFAULT NULL,
  `online_time` datetime DEFAULT NULL,
  `offline_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `device` varchar(20) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `geography` varchar(10) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (1,'offer1',10000000,NULL,NULL,NULL,'ios',NULL,NULL,'none');
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10,'$2a$10$rvoRMKZl1UZZLbIFmTfL8upBobfs/moj1hkX.HDXuPNj473AOkuKO','tungnv@abc.com'),(11,'$2a$10$UFrHg/KA/iX4eLyHO01Xx.lD333aNn6Xrrl0sNRQwXccwa1jFnDXy','tungnv1'),(12,'$2a$10$YS91B2dQYKlhcEVD8eVV6uYncKatTUCxtDlSYMg.CiO/m9fYR.JKW','tungnv2'),(13,'$2a$10$/KK96DcLiO/YqVbZDVJ1Mu63v8QWfLwmWqryLzM2u2MIxsqCSJKbG','tungnv3'),(14,'$2a$10$YoLONPKjgMGKugIcUfnlyuvppJtz6zzX0Q20J3VxUJDoqhHYnDMpi','tungnv4'),(15,'$2a$10$tBFATFZZIMlnMrN.ra8tYO6Ki0LlOLpSmrGWPBFY11ZLgiOkbO7vG','tungnv5'),(16,'$2a$10$u4sKn3H2xq49L/tG2cecoOn9mD096/C/zieXafUEU89JIFMIHFCGa','tungnv6'),(17,'$2a$10$MOtWESY/Lx09F4xTCLc0se4E6NNIJoUMflKg1bgLgHkQaoRU2Oo4O','tungnv7'),(18,'$2a$10$6kHrPerHv9pIK6lfXKH71egaGDw8wNvet.I9/Qv2xZrkdPtf8CVt2','tungnv8'),(19,'$2a$10$2kcgrvMYVvwtAZdm.OeX2.owNtnmFssV8HwmeMJkyWL5zX3EW2H8a','tungnv9'),(20,'$2a$10$EHoFHAMe/nTJvWAsx.O.LO22yxtXrdkHlYxRxk258hc2Xl3uuyAzq','tungnv10'),(21,'$2a$10$CykW8XVbft36/afVz9uxD.Ttrer.fbDlAanw9LQs1xB/eN9kESmiK','tungnv11'),(22,'$2a$10$TVLVIw8Ym18MLqKiYApCsuYl/OuRFR/Faz4qw/LGExyyuQparncne','tungnv1@abc.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-31 10:55:10
