-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cpt103
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `basetower`
--

DROP TABLE IF EXISTS `basetower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basetower` (
  `id` int NOT NULL AUTO_INCREMENT,
  `district_id` int DEFAULT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `basetower_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basetower`
--

LOCK TABLES `basetower` WRITE;
/*!40000 ALTER TABLE `basetower` DISABLE KEYS */;
INSERT INTO `basetower` VALUES (1,1,9.0000000,4.0000000),(2,2,8.0000000,3.0000000),(3,3,8.0000000,4.0000000),(4,4,8.0000000,5.0000000),(5,5,7.0000000,4.0000000),(6,6,6.0000000,1.0000000),(7,7,5.0000000,0.0000000),(8,8,5.0000000,1.0000000),(9,9,5.0000000,2.0000000),(10,10,4.0000000,1.0000000),(11,11,6.0000000,4.0000000),(12,12,5.0000000,3.0000000),(13,13,5.0000000,4.0000000),(14,14,5.0000000,5.0000000),(15,15,4.0000000,4.0000000),(16,16,6.0000000,7.0000000),(17,17,5.0000000,6.0000000),(18,18,5.0000000,7.0000000),(19,19,5.0000000,8.0000000),(20,20,4.0000000,7.0000000),(21,21,3.0000000,4.0000000),(22,22,2.0000000,3.0000000),(23,23,2.0000000,4.0000000),(24,24,2.0000000,5.0000000),(25,25,1.0000000,4.0000000);
/*!40000 ALTER TABLE `basetower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citizen`
--

DROP TABLE IF EXISTS `citizen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citizen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int NOT NULL,
  `gender` tinyint NOT NULL,
  `mobile` int NOT NULL,
  PRIMARY KEY (`mobile`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citizen`
--

LOCK TABLES `citizen` WRITE;
/*!40000 ALTER TABLE `citizen` DISABLE KEYS */;
INSERT INTO `citizen` VALUES (2,'AA',50,1,100000),(3,'AB',40,1,110000),(7,'BB',30,0,111111),(4,'AC',30,1,120000),(5,'AD',15,1,130000),(6,'BA',20,0,140000),(1,'Mark',20,1,233636);
/*!40000 ALTER TABLE `citizen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  `region` int NOT NULL,
  `risk_level` tinyint NOT NULL,
  `risk_level_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'Centre Lukewarm Hillside',1,3,'high'),(2,'N-w',1,1,'low'),(3,'N-m',1,1,'low'),(4,'N-e',1,1,'low'),(5,'N-s',1,1,'low'),(6,'W-n',2,2,'mid'),(7,'W-w',2,1,'low'),(8,'W-m',2,1,'low'),(9,'W-e',2,1,'low'),(10,'W-s',2,1,'low'),(11,'M-n',3,2,'mid'),(12,'M-w',3,3,'high'),(13,'M-m',3,1,'low'),(14,'M-e',3,1,'low'),(15,'M-s',3,1,'low'),(16,'E-n',4,1,'low'),(17,'E-w',4,2,'mid'),(18,'E-m',4,1,'low'),(19,'E-e',4,1,'low'),(20,'E-s',4,1,'low'),(21,'S-n',5,1,'low'),(22,'S-w',5,1,'low'),(23,'S-m',5,1,'low'),(24,'S-e',5,1,'low'),(25,'S-s',5,1,'low'),(26,'N-n',1,3,'high'),(27,'E-w',4,2,'mid'),(28,'M-w',3,3,'high'),(29,'S-w',5,1,'low'),(30,'W-n',2,2,'mid');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_name`
--

DROP TABLE IF EXISTS `doctor_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_name` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_name`
--

LOCK TABLES `doctor_name` WRITE;
/*!40000 ALTER TABLE `doctor_name` DISABLE KEYS */;
INSERT INTO `doctor_name` VALUES (1,'ZA','1sthospital'),(13,'ZAA','1sthospital'),(25,'ZAAA','1sthospital'),(2,'ZB','2ndhospital'),(14,'ZBB','2ndhospital'),(3,'ZC','3rdhospital'),(15,'ZCC','3rdhospital'),(4,'ZD','4thhospital'),(16,'ZDD','4thhospital'),(5,'ZE','5thhospital'),(17,'ZEE','5thhospital'),(6,'ZF','6thhospital'),(18,'ZFF','6thhospital'),(7,'ZG','7thhospital'),(19,'ZGG','7thhospital'),(8,'ZH','8thhospital'),(20,'ZHH','8thhospital'),(9,'ZI','9thhospital'),(21,'ZII','9thhospital'),(10,'ZJ','10thhospital'),(22,'ZJJ','10thhospital'),(11,'ZK','11thhospital'),(23,'ZKK','11thhospital'),(12,'ZL','12thhospital'),(24,'ZLL','12thhospital');
/*!40000 ALTER TABLE `doctor_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sampletype`
--

DROP TABLE IF EXISTS `sampletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sampletype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sampletype`
--

LOCK TABLES `sampletype` WRITE;
/*!40000 ALTER TABLE `sampletype` DISABLE KEYS */;
INSERT INTO `sampletype` VALUES (1,'Coughid-21','Coughid-21 is a newly identified type of virus this year, all patients tested to be positive shuld rest well and avoid going outside.');
/*!40000 ALTER TABLE `sampletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testresult`
--

DROP TABLE IF EXISTS `testresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testresult` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizen_id` int NOT NULL,
  `sample_type` int NOT NULL,
  `is_positive_result` tinyint NOT NULL,
  `sample_collect_time` datetime DEFAULT NULL,
  `sample_report_time` datetime DEFAULT NULL,
  `sample_test_time` datetime DEFAULT NULL,
  `doctor_name` varchar(255) DEFAULT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `district_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizen_id` (`citizen_id`),
  KEY `sample_type` (`sample_type`),
  KEY `doctor_name` (`doctor_name`),
  CONSTRAINT `testresult_ibfk_1` FOREIGN KEY (`citizen_id`) REFERENCES `citizen` (`id`),
  CONSTRAINT `testresult_ibfk_2` FOREIGN KEY (`sample_type`) REFERENCES `sampletype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `testresult_ibfk_3` FOREIGN KEY (`doctor_name`) REFERENCES `doctor_name` (`name`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testresult`
--

LOCK TABLES `testresult` WRITE;
/*!40000 ALTER TABLE `testresult` DISABLE KEYS */;
INSERT INTO `testresult` VALUES (1,1,1,0,'2021-10-09 19:30:00','2021-10-10 10:00:00','2021-10-10 08:00:00','ZA','1sthospital',1),(2,1,1,0,'2021-10-11 19:00:00','2021-10-12 09:00:00','2021-10-12 08:00:00','ZB','1sthospital',2),(3,1,1,0,'2021-10-13 19:30:00','2021-10-14 09:30:00','2021-10-14 08:00:00','ZAA','2ndhospital',1),(4,1,1,0,'2021-10-15 19:30:00','2021-10-16 08:49:50','2021-10-16 08:00:00','ZD','4thhospital',7),(5,1,1,0,'2021-10-17 19:30:00','2021-10-18 09:27:40','2021-10-18 08:00:00','ZBB','2ndhospital',2),(6,1,1,0,'2021-10-19 19:30:00','2021-10-20 11:23:27','2021-10-20 08:00:00','ZDD','4thhospital',7),(7,1,1,0,'2021-10-21 19:30:00','2021-10-22 12:45:00','2021-10-22 08:00:00','ZAAA','1sthospital',1),(8,1,1,1,'2021-10-04 19:30:00','2021-10-05 10:00:00','2021-10-05 08:00:00','ZA','1sthospital',1),(9,2,1,0,'2021-10-04 19:30:00','2021-10-05 09:00:00','2021-10-05 08:00:00','ZA','1sthospital',1),(10,3,1,1,'2021-10-04 19:30:00','2021-10-05 09:30:00','2021-10-05 08:00:00','ZAA','1sthospital',1),(11,4,1,0,'2021-10-05 19:30:00','2021-10-06 08:49:50','2021-10-06 08:00:00','ZA','1sthospital',1),(12,2,1,1,'2021-10-05 19:30:00','2021-10-06 09:27:40','2021-10-06 08:00:00','ZAA','1stdhospital',1),(13,5,1,0,'2021-10-05 19:30:00','2021-10-06 11:23:27','2021-10-06 08:00:00','ZA','1sthospital',1),(14,6,1,1,'2021-10-06 19:30:00','2021-10-07 12:45:00','2021-10-07 08:00:00','ZAAA','1sthospital',1);
/*!40000 ALTER TABLE `testresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `district_id` int DEFAULT NULL,
  `mobile` int NOT NULL,
  `move_in_time` datetime DEFAULT NULL,
  `move_out_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `district_id` (`district_id`),
  KEY `mobile` (`mobile`),
  CONSTRAINT `tracking_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `basetower` (`district_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tracking_ibfk_2` FOREIGN KEY (`mobile`) REFERENCES `citizen` (`mobile`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
INSERT INTO `tracking` VALUES (1,1,233636,'2021-10-09 19:30:00','2021-10-10 10:00:00'),(2,1,100000,'2021-10-06 14:00:00',NULL),(3,2,110000,'2021-10-08 15:00:00','2021-10-09 18:59:59'),(4,1,120000,'2021-10-07 19:30:00','2021-10-09 19:29:59'),(5,1,130000,'2021-10-05 06:00:00','2021-10-07 19:30:01'),(6,1,140000,'2021-10-05 06:00:00','2021-10-09 19:30:01'),(7,1,233636,'2021-10-09 19:30:00','2021-10-10 10:00:00'),(8,1,100000,'2021-10-06 14:00:00',NULL),(9,2,110000,'2021-10-08 15:00:00','2021-10-09 18:59:59'),(10,1,120000,'2021-10-07 19:30:00','2021-10-09 19:29:59'),(11,1,130000,'2021-10-05 06:00:00','2021-10-07 19:30:01'),(12,1,140000,'2021-10-05 06:00:00','2021-10-09 19:30:01'),(13,1,233636,'2021-10-29 19:30:00',NULL),(14,1,100000,'2021-10-28 14:00:00',NULL),(15,1,120000,'2021-10-29 19:30:00',NULL),(16,1,130000,'2021-10-30 06:00:00',NULL),(17,1,140000,'2021-10-29 06:00:00',NULL),(18,1,233636,'2021-10-29 19:30:00',NULL),(19,1,100000,'2021-10-28 14:00:00',NULL),(20,1,110000,'2021-10-29 19:30:00',NULL),(21,1,120000,'2021-10-30 06:00:00',NULL),(22,1,130000,'2021-10-29 06:00:00',NULL),(23,1,140000,'2021-10-30 06:00:00',NULL),(24,1,111111,'2021-10-29 06:00:00',NULL);
/*!40000 ALTER TABLE `tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cpt103'
--

--
-- Dumping routines for database 'cpt103'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-25 18:18:28
