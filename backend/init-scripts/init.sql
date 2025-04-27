-- MySQL dump 10.13  Distrib 8.0.41, for Linux (aarch64)
--
-- Host: localhost    Database: my_database
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_code` varchar(100) NOT NULL,
  `teacher` varchar(100) NOT NULL,
  `week` varchar(100) NOT NULL DEFAULT '1,1',
  `location` varchar(200) NOT NULL DEFAULT '[]',
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'REGISTRATION',
  `exam` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'date|time|location',
  `time` varchar(200) NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`),
  KEY `subject_code` (`subject_code`),
  KEY `fk_classes_teacher` (`teacher`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`subject_code`) REFERENCES `subjects` (`code`),
  CONSTRAINT `fk_classes_teacher` FOREIGN KEY (`teacher`) REFERENCES `teacher_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (9,'P-I','T01001','3,15','[\"A101\",\"A201\"]','COMPLETED','2021/12/15|0830-1030|A101','[[1,3,6],[3,3,6]]'),(10,'C-I','T01002','3,10','[\"B101\",\"B201\"]','COMPLETED','2021/12/16|0830-1030|A101','[[2,3,6],[4,3,6]]'),(11,'LA-I','T01002','3,10','[\"B301\",\"B301\"]','COMPLETED','2021/12/17|0830-1030|A101','[[2,6,8],[4,6,8]]'),(12,'P-II','T01001','3,15','[\"A101\",\"A201\"]','COMPLETED','2022/6/15|0830-1030|A101','[[1,3,6],[3,3,6]]'),(13,'PaS-I','T01002','3,10','[\"B301\",\"B301\"]','COMPLETED','2022/6/16|0830-1030|A101','[[2,6,8],[4,6,8]]'),(14,'CPL-I','T01001','3,15','[\"D101\"]','COMPLETED','2022/6/17|0830-1030|A101','[[5,6,11]]'),(15,'DM','T01001','3,15','[\"A101\",\"A201\"]','COMPLETED','2022/12/15|0830-1030|A101','[[1,3,6],[3,3,6]]'),(16,'DS','T01002','3,15','[\"A101\",\"A201\"]','COMPLETED','2023/6/15|0830-1030|A101','[[1,3,6],[3,3,6]]'),(17,'DSaA','T01002','3,15','[\"B101\",\"B201\"]','COMPLETED','2023/6/16|0830-1030|A101','[[2,6,8],[4,6,8]]'),(18,'CN','T01001','3,15','[\"A101\",\"A201\"]','COMPLETED','2023/12/15|0830-1030|A101','[[1,3,6],[3,3,6]]'),(19,'ML','T01002','3,15','[\"B101\",\"B201\"]','COMPLETED','2024/6/15|0830-1030|A101','[[2,6,8],[4,6,8]]'),(20,'SP','T01001','3,15','[\"A101\",\"A201\"]','COMPLETED','2024/6/15|0830-1030|A101','[[2,6,8],[4,6,8]]'),(21,'Thesis','T01001','1,1','[]','IN_PROGRESS','2025/6/15|0830-1030|A101','[]'),(22,'SDL','T01001','3,15','[\"A101\",\"A201\"]','COMPLETED','2023/12/15|0830-1030|A101','[[2,6,8],[4,6,8]]'),(23,'WD','T01001','3,15','[\"A101\",\"A201\"]','COMPLETED','2024/12/15|0830-1030|A101','[[2,6,8],[4,6,8]]'),(24,'MLwP','T01002','3,15','[\"A101\",\"A201\"]','COMPLETED','2023/12/15|0830-1030|A101','[[2,6,8],[4,6,8]]'),(25,'DLaNN','T01002','3,15','[\"A101\",\"A201\"]','COMPLETED','2024/12/15|0830-1030|A101','[[2,6,8],[4,6,8]]'),(26,'PoM','T02002','3,15','[\"C101\",\"C201\"]','COMPLETED','2021/12/15|0830-1030|C101','[[1,3,6],[3,3,6]]'),(27,'PoA-I','T02002','3,15','[\"C301\",\"C301\"]','COMPLETED','2021/12/18|0830-1030|C101','[[1,6,8],[3,6,8]]'),(28,'PoA-II','T02002','3,15','[\"C301\",\"C301\"]','COMPLETED','2022/6/15|0830-1030|A101','[[1,3,6],[3,3,6]]'),(29,'IL','T02001','3,15','[\"C102\",\"C102\"]','COMPLETED','2022/12/15|0830-1030|C101','[[1,3,6],[3,3,6]]'),(30,'DaFP','T02001','3,15','[\"C102\",\"C102\"]','COMPLETED','2023/6/15|0830-1030|C101','[[1,3,6],[3,3,6]]'),(31,'HRaIJ','T02001','3,15','[\"C102\",\"C102\"]','COMPLETED','2023/12/15|0830-1030|C101','[[1,3,6],[3,3,6]]'),(32,'PT','T02001','3,15','[\"C102\",\"C102\"]','COMPLETED','2024/6/15|0830-1030|C101','[[1,3,6],[3,3,6]]'),(33,'MaMe','T02002','3,15','[\"C101\",\"C101\"]','COMPLETED','2022/12/16|0830-1030|C101','[[1,3,6],[3,3,6]]'),(34,'MIS','T02002','3,15','[\"C101\",\"C101\"]','COMPLETED','2023/6/16|0830-1030|C101','[[1,3,6],[3,3,6]]'),(35,'HRM','T02002','3,15','[\"C101\",\"C101\"]','COMPLETED','2023/12/16|0830-1030|C101','[[1,3,6],[3,3,6]]'),(36,'BA','T02002','3,15','[\"C101\",\"C101\"]','COMPLETED','2024/6/16|0830-1030|C101','[[1,3,6],[3,3,6]]'),(37,'ICR','T02001','3,15','[\"C102\",\"C102\"]','COMPLETED','2023/12/18|0830-1030|C101','[[2,6,8],[4,6,8]]'),(38,'GPE','T02001','3,15','[\"C102\",\"C102\"]','COMPLETED','2024/12/18|0830-1030|C101','[[2,6,8],[4,6,8]]'),(39,'DAaBA','T02002','3,15','[\"C101\",\"C101\"]','COMPLETED','2023/12/18|0830-1030|C101','[[2,6,8],[4,6,8]]'),(40,'DMaSMS','T02002','3,15','[\"C101\",\"C101\"]','COMPLETED','2024/12/18|0830-1030|C101','[[2,6,8],[4,6,8]]'),(41,'DF','T03001','3,15','[\"E103\",\"E103\"]','COMPLETED','2022/12/15|0830-1030|E101','[[1,3,6],[3,3,6]]'),(42,'CT','T03001','3,15','[\"E104\",\"E104\"]','COMPLETED','2022/12/16|0830-1030|E101','[[2,3,6],[4,3,6]]'),(43,'AH','T03002','3,15','[\"E203\",\"E203\"]','COMPLETED','2022/12/17|0830-1030|E101','[[2,6,8],[4,6,8]]'),(44,'2a3D-I','T03002','3,15','[\"E103\"]','COMPLETED','2023/6/15|0830-1030|E101','[[5,6,11]]'),(45,'PR','T03001','3,15','[\"E103\",\"E103\"]','COMPLETED','2023/12/15|0830-1030|E101','[[1,3,6],[3,3,6]]'),(46,'MR','T03001','3,15','[\"E103\",\"E103\"]','COMPLETED','2024/6/15|0830-1030|E101','[[1,3,6],[3,3,6]]'),(47,'BJaP','T03001','3,15','[\"E103\",\"E103\"]','COMPLETED','2024/12/15|0830-1030|E101','[[1,3,6],[3,3,6]]'),(48,'DF','T03001','3,15','[\"E103\",\"E103\"]','COMPLETED','2023/12/15|0830-1030|E101','[[1,3,6],[3,3,6]]'),(49,'CT','T03001','3,15','[\"E104\",\"E104\"]','COMPLETED','2023/12/16|0830-1030|E101','[[2,3,6],[4,3,6]]'),(50,'AH','T03002','3,15','[\"E203\",\"E203\"]','COMPLETED','2023/12/17|0830-1030|E101','[[2,6,8],[4,6,8]]'),(51,'2a3D-I','T03002','3,15','[\"E103\"]','COMPLETED','2024/6/15|0830-1030|E101','[[5,6,11]]'),(52,'VGaI','T03002','3,15','[\"E103\",\"E103\"]','COMPLETED','2024/12/15|0830-1030|E101','[[1,3,6],[3,3,6]]'),(53,'SMCCaS','T03001','3,15','[\"E103\",\"E103\"]','REGISTRATION','2025/6/15|0830-1030|E101','[[1,3,6],[3,3,6]]'),(54,'LaC','T03002','3,15','[\"E105\",\"E105\"]','REGISTRATION','2025/6/16|0830-1030|E101','[[2,3,6],[4,3,6]]'),(55,'LOS','T01001','3,15','[\"A103\",\"A103\"]','REGISTRATION','2025/6/15|0830-1030|A101','[[1,3,6],[3,3,6]]'),(56,'PRA','T01002','3,15','[\"A105\",\"A105\"]','REGISTRATION','2025/6/16|0830-1030|A101','[[2,3,6],[4,3,6]]'),(57,'MDM','T01001','3,15','[\"A303\",\"A303\"]','REGISTRATION','2025/6/17|0830-1030|A101','[[1,6,8],[3,6,8]]'),(58,'CC','T01001','3,15','[\"A305\",\"A305\"]','REGISTRATION','2025/6/18|0830-1030|A101','[[2,6,8],[4,6,8]]'),(59,'PS','T03001','3,15','[\"E103\",\"E103\"]','REGISTRATION','2025/6/17|0830-1030|E101','[[1,3,6],[3,3,6]]'),(60,'CS','T03001','3,15','[\"E105\",\"E105\"]','REGISTRATION','2025/6/18|0830-1030|E101','[[2,3,6],[4,3,6]]'),(61,'AF','T03002','3,15','[\"E303\",\"E303\"]','REGISTRATION','2025/6/19|0830-1030|E101','[[1,6,8],[3,6,8]]'),(62,'CaHL','T03002','3,15','[\"E305\",\"E305\"]','REGISTRATION','2025/6/20|0830-1030|E101','[[2,6,8],[4,6,8]]'),(63,'IM','T02001','3,15','[\"C103\",\"C103\"]','REGISTRATION','2025/6/15|0830-1030|C101','[[1,3,6],[3,3,6]]'),(64,'ITaF','T02001','3,15','[\"C105\",\"C105\"]','REGISTRATION','2025/6/16|0830-1030|C101','[[2,3,6],[4,3,6]]'),(65,'CCC','T02002','3,15','[\"C303\",\"C303\"]','REGISTRATION','2025/6/17|0830-1030|C101','[[1,6,8],[3,6,8]]'),(66,'IaPM','T02002','3,15','[\"C305\",\"C305\"]','REGISTRATION','2025/6/18|0830-1030|C101','[[2,6,8],[4,6,8]]'),(67,'PSaC','T01001','7,14','[\"B101\"]','REGISTRATION','2025/6/21|0830-1030|B101','[[1,11,13]]'),(68,'TaLD','T01002','7,14','[\"B101\"]','REGISTRATION','2025/6/22|0830-1030|B101','[[2,11,13]]'),(69,'TMaP','T02001','7,14','[\"B101\"]','REGISTRATION','2025/6/23|0830-1030|B101','[[3,11,13]]'),(70,'CTaPS','T02002','7,14','[\"B101\"]','REGISTRATION','2025/6/24|0830-1030|B101','[[4,11,13]]'),(71,'CWaCC','T03001','7,14','[\"B101\"]','REGISTRATION','2025/6/25|0830-1030|B101','[[5,11,13]]');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colleges` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `colleges_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colleges`
--

LOCK TABLES `colleges` WRITE;
/*!40000 ALTER TABLE `colleges` DISABLE KEYS */;
INSERT INTO `colleges` VALUES ('03','Faculty of Art'),('02','Faculty of Business and Administration'),('01','Faculty of Computer Science and Information Technology');
/*!40000 ALTER TABLE `colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `get_credit_by_subject`
--

DROP TABLE IF EXISTS `get_credit_by_subject`;
/*!50001 DROP VIEW IF EXISTS `get_credit_by_subject`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_credit_by_subject` AS SELECT 
 1 AS `id`,
 1 AS `code`,
 1 AS `name`,
 1 AS `semester`,
 1 AS `credit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_credit_distribution`
--

DROP TABLE IF EXISTS `get_credit_distribution`;
/*!50001 DROP VIEW IF EXISTS `get_credit_distribution`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_credit_distribution` AS SELECT 
 1 AS `id`,
 1 AS `distribution_FMEPC`,
 1 AS `group`,
 1 AS `credit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_credit_profile`
--

DROP TABLE IF EXISTS `get_credit_profile`;
/*!50001 DROP VIEW IF EXISTS `get_credit_profile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_credit_profile` AS SELECT 
 1 AS `id`,
 1 AS `required_credit`,
 1 AS `current_gpa`,
 1 AS `acquired_credit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_credit_to_be_earned`
--

DROP TABLE IF EXISTS `get_credit_to_be_earned`;
/*!50001 DROP VIEW IF EXISTS `get_credit_to_be_earned`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_credit_to_be_earned` AS SELECT 
 1 AS `id`,
 1 AS `code`,
 1 AS `name`,
 1 AS `credit`,
 1 AS `group`,
 1 AS `grade`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_exam`
--

DROP TABLE IF EXISTS `get_exam`;
/*!50001 DROP VIEW IF EXISTS `get_exam`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_exam` AS SELECT 
 1 AS `id`,
 1 AS `class_id`,
 1 AS `subject_code`,
 1 AS `subject_name`,
 1 AS `exam`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_registrable_courses`
--

DROP TABLE IF EXISTS `get_registrable_courses`;
/*!50001 DROP VIEW IF EXISTS `get_registrable_courses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_registrable_courses` AS SELECT 
 1 AS `class_id`,
 1 AS `subject_code`,
 1 AS `subject_name`,
 1 AS `group`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_results`
--

DROP TABLE IF EXISTS `get_results`;
/*!50001 DROP VIEW IF EXISTS `get_results`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_results` AS SELECT 
 1 AS `id`,
 1 AS `code`,
 1 AS `score`,
 1 AS `semester`,
 1 AS `grade`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_suggest_course`
--

DROP TABLE IF EXISTS `get_suggest_course`;
/*!50001 DROP VIEW IF EXISTS `get_suggest_course`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_suggest_course` AS SELECT 
 1 AS `id`,
 1 AS `subject_code`,
 1 AS `subject_name`,
 1 AS `group`,
 1 AS `credit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_timetable`
--

DROP TABLE IF EXISTS `get_timetable`;
/*!50001 DROP VIEW IF EXISTS `get_timetable`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_timetable` AS SELECT 
 1 AS `id`,
 1 AS `class_id`,
 1 AS `subject_code`,
 1 AS `teacher_name`,
 1 AS `subject_name`,
 1 AS `credit`,
 1 AS `time`,
 1 AS `location`,
 1 AS `week`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_user_profile`
--

DROP TABLE IF EXISTS `get_user_profile`;
/*!50001 DROP VIEW IF EXISTS `get_user_profile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_user_profile` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `college`,
 1 AS `major`,
 1 AS `year`,
 1 AS `nationality`,
 1 AS `contact`,
 1 AS `picture`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `majors`
--

DROP TABLE IF EXISTS `majors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `majors` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `college` varchar(100) NOT NULL,
  `required_credit` smallint unsigned NOT NULL,
  `distribution_FMEPC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `majors_unique` (`name`),
  KEY `fk_college` (`college`),
  CONSTRAINT `fk_college` FOREIGN KEY (`college`) REFERENCES `colleges` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majors`
--

LOCK TABLES `majors` WRITE;
/*!40000 ALTER TABLE `majors` DISABLE KEYS */;
INSERT INTO `majors` VALUES ('001','Software Engineering','01',100,'30,20,15,30,5'),('002','Artificial Intelligence','01',100,'30,25,15,25,5'),('003','International Relations','02',90,'20,20,15,30,5'),('004','Business','02',90,'20,20,15,30,5'),('005','Mass Communication','03',75,'20,10,10,30,5'),('006','Graphic Design','03',75,'20,10,15,25,5');
/*!40000 ALTER TABLE `majors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `majors_subjects`
--

DROP TABLE IF EXISTS `majors_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `majors_subjects` (
  `major_id` varchar(100) NOT NULL,
  `subject_code` varchar(100) NOT NULL,
  PRIMARY KEY (`major_id`,`subject_code`),
  KEY `fk_subjects_major_subject` (`subject_code`),
  CONSTRAINT `fk_subjects_major_major` FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_subjects_major_subject` FOREIGN KEY (`subject_code`) REFERENCES `subjects` (`code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majors_subjects`
--

LOCK TABLES `majors_subjects` WRITE;
/*!40000 ALTER TABLE `majors_subjects` DISABLE KEYS */;
INSERT INTO `majors_subjects` VALUES ('005','2a3D-I'),('006','2a3D-I'),('005','AF'),('006','AF'),('005','AH'),('006','AH'),('006','APaIfD'),('004','BA'),('005','BJaP'),('001','C-I'),('002','C-I'),('003','C-I'),('004','C-I'),('005','CaHL'),('006','CaHL'),('001','CC'),('002','CC'),('003','CCC'),('004','CCC'),('001','CN'),('002','CN'),('001','CPL-I'),('002','CPL-I'),('005','CS'),('006','CS'),('005','CT'),('006','CT'),('001','CTaPS'),('002','CTaPS'),('003','CTaPS'),('004','CTaPS'),('005','CTaPS'),('006','CTaPS'),('001','CWaCC'),('002','CWaCC'),('003','CWaCC'),('004','CWaCC'),('005','CWaCC'),('006','CWaCC'),('004','DAaBA'),('003','DaFP'),('005','DF'),('006','DF'),('002','DLaNN'),('001','DM'),('002','DM'),('004','DMaSMS'),('001','DS'),('002','DS'),('002','DSaA'),('003','GPE'),('003','HRaIJ'),('004','HRM'),('003','IaPM'),('004','IaPM'),('003','ICR'),('003','IL'),('003','IM'),('004','IM'),('003','ITaF'),('004','ITaF'),('001','LA-I'),('002','LA-I'),('003','LA-I'),('004','LA-I'),('006','LaC'),('001','LOS'),('002','LOS'),('004','MaME'),('001','MDM'),('002','MDM'),('004','MIS'),('002','ML'),('002','MLwP'),('005','MR'),('001','P-I'),('002','P-I'),('001','P-II'),('002','P-II'),('001','PaS-I'),('002','PaS-I'),('003','PaS-I'),('004','PaS-I'),('003','PoA-I'),('004','PoA-I'),('003','PoA-II'),('004','PoA-II'),('003','PoM'),('004','PoM'),('005','PR'),('001','PRA'),('002','PRA'),('005','PS'),('006','PS'),('001','PSaC'),('002','PSaC'),('003','PSaC'),('004','PSaC'),('005','PSaC'),('006','PSaC'),('003','PT'),('001','SDL'),('005','SMCCaS'),('001','SP'),('001','TaLD'),('002','TaLD'),('003','TaLD'),('004','TaLD'),('005','TaLD'),('006','TaLD'),('001','Thesis'),('002','Thesis'),('003','Thesis'),('004','Thesis'),('005','Thesis'),('006','Thesis'),('001','TMaP'),('002','TMaP'),('003','TMaP'),('004','TMaP'),('005','TMaP'),('006','TMaP'),('006','UIaUXD'),('006','VGaI'),('001','WD');
/*!40000 ALTER TABLE `majors_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `group` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('Sports Day','Join us in celebrating the 100th NUAA Sports Day! Unleash your energy, ignite your passion, and showcase your spirit in a century-strong tradition of excellence.','/','EVENT'),('Graduation Night','Class of 2021, it’s time to celebrate! Join us for an unforgettable Grad Night full of memories, laughter, and one last big moment together.','/','EVENT'),('Pending School Fees','Pending School Fees for Semester 5 due 1st May 2025.','/','NOTIFICATION');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameters`
--

DROP TABLE IF EXISTS `parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameters` (
  `key` varchar(100) NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameters`
--

LOCK TABLES `parameters` WRITE;
/*!40000 ALTER TABLE `parameters` DISABLE KEYS */;
INSERT INTO `parameters` VALUES ('isSelectionOpen','true','Is Course Selection Open');
/*!40000 ALTER TABLE `parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `user_id` varchar(100) NOT NULL,
  `class_code` int NOT NULL,
  `score` varchar(100) NOT NULL DEFAULT '0',
  `semester` smallint NOT NULL,
  `grade` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`user_id`,`class_code`),
  KEY `class_code` (`class_code`),
  CONSTRAINT `fk_results_user` FOREIGN KEY (`user_id`) REFERENCES `user_auth` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`class_code`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES ('S001001',9,'95',1,5.00),('S001001',10,'96',1,5.00),('S001001',11,'92',1,5.00),('S001001',12,'90',2,5.00),('S001001',13,'97',2,5.00),('S001001',14,'99',2,5.00),('S001001',15,'92',3,5.00),('S001001',16,'91',4,5.00),('S001001',18,'98',5,5.00),('S001001',20,'90',6,5.00),('S001001',21,'0',7,0.00),('S001001',22,'92',5,5.00),('S001001',23,'93',7,5.00),('S001001',55,'0',8,0.00),('S001001',56,'0',8,0.00),('S001001',57,'0',8,0.00),('S001001',58,'0',8,0.00),('S001001',67,'0',8,0.00),('S001001',68,'0',8,0.00),('S001001',69,'0',8,0.00),('S001001',70,'0',8,0.00),('S001001',71,'0',8,0.00),('S002001',9,'75',1,3.50),('S002001',10,'82',1,4.00),('S002001',11,'85',1,4.50),('S002001',12,'78',2,3.50),('S002001',13,'82',2,4.00),('S002001',14,'81',2,4.00),('S002001',15,'72',3,3.00),('S002001',16,'70',4,3.00),('S002001',17,'77',4,3.50),('S002001',18,'81',5,4.00),('S002001',19,'89',6,4.50),('S002001',21,'0',7,0.00),('S002001',24,'72',5,3.00),('S002001',25,'71',7,3.00),('S003001',10,'88',1,4.50),('S003001',11,'92',1,5.00),('S003001',12,'80',2,4.00),('S003001',21,'0',7,0.00),('S003001',26,'81',1,4.00),('S003001',27,'73',1,3.00),('S003001',28,'71',2,3.00),('S003001',29,'70',3,3.00),('S003001',30,'71',4,3.00),('S003001',31,'88',5,4.50),('S003001',32,'78',6,3.50),('S003001',37,'C',5,3.00),('S003001',38,'B',7,4.00),('S004001',10,'85',1,4.50),('S004001',11,'91',1,5.00),('S004001',12,'89',2,4.50),('S004001',21,'0',7,0.00),('S004001',26,'95',1,5.00),('S004001',27,'93',1,5.00),('S004001',28,'82',2,4.00),('S004001',33,'90',3,5.00),('S004001',34,'95',4,5.00),('S004001',35,'88',5,4.50),('S004001',36,'92',6,5.00),('S004001',39,'A',5,5.00),('S004001',40,'A',7,5.00),('S005001',41,'62',1,1.00),('S005001',42,'68',1,2.00),('S005001',43,'70',1,3.00),('S005001',44,'72',2,3.00),('S005001',45,'65',3,2.00),('S005001',46,'66',4,2.00),('S005001',47,'60',5,1.00),('S006001',48,'60',1,1.00),('S006001',49,'55',1,0.00),('S006001',50,'62',1,1.00),('S006001',51,'45',2,0.00),('S006001',52,'65',3,2.00);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) NOT NULL,
  `semester` int unsigned NOT NULL DEFAULT '1',
  `credit` decimal(10,1) NOT NULL,
  `group` varchar(100) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `subjects_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES ('2a3D-I','2D and 3D Design I',2,8.0,'Foundation'),('AF','Animation Fundamentals',3,5.0,'Elective'),('AH','Art History',1,3.0,'Foundation'),('APaIfD','Adobe Photoshop and Illustrator for Design',5,5.0,'Practical'),('BA','Business Analytics',6,5.0,'Major'),('BJaP','Broadcast Journalism and Production',5,10.0,'Practical'),('C-I','Calculus I',1,3.0,'Foundation'),('CaHL','Caligraphy and Hand-Lettering',3,5.0,'Elective'),('CC','Cloud Computing',3,5.0,'Elective'),('CCC','Cross-Cultural Communications',3,5.0,'Elective'),('CN','Computer Network',5,5.0,'Major'),('CPL-I','C Programming Language I',2,9.0,'Foundation'),('CS','Ceramics Skills',3,5.0,'Elective'),('CT','Color Theory',1,6.0,'Foundation'),('CTaPS','Critical Thinking and Problem Solving',3,2.5,'Coacademic'),('CWaCC','Creative Writing and Content Creation',3,2.5,'Coacademic'),('DAaBA','Data Analysis and Business Analytics',5,10.0,'Practical'),('DaFP','Diplomacy and Foreign Policy',4,5.0,'Major'),('DF','Drawing Fundamentals',1,3.0,'Foundation'),('DLaNN','Deep Learning and Neural Networks',7,5.0,'Practical'),('DM','Discrete Mathematics',3,5.0,'Major'),('DMaSMS','Digital Marketing and Social Media Strategy',7,5.0,'Practical'),('DS','Database System',4,5.0,'Major'),('DSaA','Data Structure and Algorithm',4,5.0,'Major'),('GPE','Global Political Economy',7,5.0,'Practical'),('HRaIJ','Human Rights and International Justice',5,5.0,'Major'),('HRM','Human Resource Management',5,5.0,'Major'),('IaPM','Investment and Portfolio Management',3,5.0,'Elective'),('ICR','International Conflict Resolution',5,10.0,'Practical'),('IL','International Law',3,5.0,'Major'),('IM','International Marketing',3,5.0,'Elective'),('ITaF','International Trade and Finance',3,5.0,'Elective'),('LA-I','Linear Algebra I',1,3.0,'Foundation'),('LaC','Layout and Composition',4,5.0,'Major'),('LOS','Linux Operating Systems',3,5.0,'Elective'),('MaME','Macro and Micro Economics',3,5.0,'Major'),('MDM','Modern Data Managements',3,5.0,'Elective'),('MIS','Management Information System',4,5.0,'Major'),('ML','Machine Learning',6,5.0,'Major'),('MLwP','Machine Learning with Python',5,5.0,'Practical'),('MR','Media Writing',4,5.0,'Major'),('P-I','Physics I',1,6.0,'Foundation'),('P-II','Physics II',2,6.0,'Foundation'),('PaS-I','Probability and Statistics I',2,3.0,'Foundation'),('PoA-I','Principle of Accounting I',1,5.0,'Foundation'),('PoA-II','Principle of Accounting II',2,5.0,'Foundation'),('PoM','Principle of Management',1,6.0,'Foundation'),('PR','Public Relations',3,5.0,'Major'),('PRA','Pattern Recognition Algorithms',3,5.0,'Elective'),('PS','Printmaking Skills',3,5.0,'Elective'),('PSaC','Public Speaking and Communication',3,2.5,'Coacademic'),('PT','Political Theory',6,5.0,'Major'),('SDL','Software Development Lifecycle',5,10.0,'Practical'),('SMCCaS','Social Media Content Creation and Strategy',6,5.0,'Practical'),('SP','Software Programming',6,5.0,'Major'),('TaLD','Teamwork and Leadership Development',3,2.5,'Coacademic'),('Thesis','Graduation Thesis',7,15.0,'Practical'),('TMaP','Time Management and Productivity',3,2.5,'Coacademic'),('UIaUXD','User Interface and User Experience Design',6,5.0,'Practical'),('VGaI','Vector Graphics and Illustration',3,5.0,'Major'),('WD','Web Development',7,5.0,'Practical');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_information`
--

DROP TABLE IF EXISTS `teacher_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_information` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `college` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `picture` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_information_unique` (`picture`),
  KEY `fk_teachers_college` (`college`),
  CONSTRAINT `fk_teacher_id` FOREIGN KEY (`id`) REFERENCES `user_auth` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_teachers_college` FOREIGN KEY (`college`) REFERENCES `colleges` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_information`
--

LOCK TABLES `teacher_information` WRITE;
/*!40000 ALTER TABLE `teacher_information` DISABLE KEYS */;
INSERT INTO `teacher_information` VALUES ('T01001','Xukun Cai','01','T01001.jpg'),('T01002','Yaxuan Song','01','T01002.jpg'),('T02001','Jiaqi Ma','02','T02001.jpg'),('T02002','Qianxi Yiyang','02','T02002.jpg'),('T03001','Dilraba Dilmurat','03','T03001.jpg'),('T03002','Junkai Wang','03','T03002.jpg');
/*!40000 ALTER TABLE `teacher_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_auth` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'password',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
INSERT INTO `user_auth` VALUES ('S001001','password'),('S002001','password'),('S003001','password'),('S004001','password'),('S005001','password'),('S006001','password'),('T01001','notallowed'),('T01002','notallowed'),('T02001','notallowed'),('T02002','notallowed'),('T03001','notallowed'),('T03002','notallowed');
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_information`
--

DROP TABLE IF EXISTS `user_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_information` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `major` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `year` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nationality` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contact` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `picture` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `semester` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_information_unique` (`picture`),
  KEY `fk_students_major` (`major`),
  CONSTRAINT `fk_student_id` FOREIGN KEY (`id`) REFERENCES `user_auth` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_students_major` FOREIGN KEY (`major`) REFERENCES `majors` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_information`
--

LOCK TABLES `user_information` WRITE;
/*!40000 ALTER TABLE `user_information` DISABLE KEYS */;
INSERT INTO `user_information` VALUES ('S001001','Oscar Wong','001','2021','Malaysia','999','S001001.webp',8),('S002001','Esther Yu','002','2021','China','15166663333','S002001.jpeg',8),('S003001','Mengyan Bai','003','2021','China','18866662222','S003001.jpeg',8),('S004001','Joey Kow','004','2021','Malaysia','18851870935','S004001.jpeg',8),('S005001','Kris Wu','005','2022','South Korea','15199998888','S005001.jpg',6),('S006001','Sehun Oh','006','2023','South Korea','15188887777','S006001.jpeg',4);
/*!40000 ALTER TABLE `user_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `get_credit_by_subject`
--

/*!50001 DROP VIEW IF EXISTS `get_credit_by_subject`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_credit_by_subject` AS select `ui`.`id` AS `id`,`c`.`subject_code` AS `code`,`s`.`name` AS `name`,`r`.`semester` AS `semester`,`s`.`credit` AS `credit` from ((((`user_information` `ui` join `majors` `m` on((`ui`.`major` = `m`.`id`))) join `results` `r` on((`r`.`user_id` = `ui`.`id`))) join `classes` `c` on((`r`.`class_code` = `c`.`id`))) join `subjects` `s` on((`c`.`subject_code` = `s`.`code`))) where (`r`.`grade` <> 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_credit_distribution`
--

/*!50001 DROP VIEW IF EXISTS `get_credit_distribution`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_credit_distribution` AS select `a`.`id` AS `id`,`a`.`distribution_FMEPC` AS `distribution_FMEPC`,`a`.`group` AS `group`,`b`.`credit` AS `credit` from ((select `ui`.`id` AS `id`,`m`.`distribution_FMEPC` AS `distribution_FMEPC`,`s`.`group` AS `group` from (((`user_information` `ui` join `majors` `m` on((`ui`.`major` = `m`.`id`))) join `majors_subjects` `ms` on((`m`.`id` = `ms`.`major_id`))) join `subjects` `s` on((`ms`.`subject_code` = `s`.`code`))) group by `s`.`group`,`ui`.`id`,`m`.`distribution_FMEPC`) `a` left join (select `ui`.`id` AS `id`,`s`.`group` AS `group`,sum(`s`.`credit`) AS `credit` from (((`user_information` `ui` join `results` `r` on((`ui`.`id` = `r`.`user_id`))) join `classes` `c` on((`c`.`id` = `r`.`class_code`))) join `subjects` `s` on((`s`.`code` = `c`.`subject_code`))) where (`r`.`grade` <> 0) group by `ui`.`id`,`s`.`group`) `b` on(((`a`.`group` = `b`.`group`) and (`a`.`id` = `b`.`id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_credit_profile`
--

/*!50001 DROP VIEW IF EXISTS `get_credit_profile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_credit_profile` AS select `a`.`id` AS `id`,`a`.`required_credit` AS `required_credit`,`b`.`current_gpa` AS `current_gpa`,`b`.`acquired_credit` AS `acquired_credit` from ((select `ui`.`id` AS `id`,`m`.`required_credit` AS `required_credit` from (`user_information` `ui` join `majors` `m` on((`ui`.`major` = `m`.`id`)))) `a` left join (select `ui`.`id` AS `id`,avg(`r`.`grade`) AS `current_gpa`,sum(`s`.`credit`) AS `acquired_credit` from ((((`user_information` `ui` join `majors` `m` on((`ui`.`major` = `m`.`id`))) join `results` `r` on((`r`.`user_id` = `ui`.`id`))) join `classes` `c` on((`c`.`id` = `r`.`class_code`))) join `subjects` `s` on((`c`.`subject_code` = `s`.`code`))) where (`r`.`grade` <> 0) group by `ui`.`id`) `b` on((`a`.`id` = `b`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_credit_to_be_earned`
--

/*!50001 DROP VIEW IF EXISTS `get_credit_to_be_earned`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_credit_to_be_earned` AS select `ui`.`id` AS `id`,`s`.`code` AS `code`,`s`.`name` AS `name`,`s`.`credit` AS `credit`,`s`.`group` AS `group`,`a`.`grade` AS `grade` from (((`user_information` `ui` join `majors_subjects` `ms` on((`ui`.`major` = `ms`.`major_id`))) join `subjects` `s` on((`ms`.`subject_code` = `s`.`code`))) left join (select `r`.`grade` AS `grade`,`c`.`subject_code` AS `subject_code`,`r`.`user_id` AS `user_id` from (`results` `r` join `classes` `c` on((`c`.`id` = `r`.`class_code`)))) `a` on(((`a`.`subject_code` = `s`.`code`) and (`ui`.`id` = `a`.`user_id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_exam`
--

/*!50001 DROP VIEW IF EXISTS `get_exam`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_exam` AS select `r`.`user_id` AS `id`,`c`.`id` AS `class_id`,`c`.`subject_code` AS `subject_code`,`s`.`name` AS `subject_name`,`c`.`exam` AS `exam` from ((`results` `r` join `classes` `c` on((`c`.`id` = `r`.`class_code`))) join `subjects` `s` on((`c`.`subject_code` = `s`.`code`))) where (`c`.`status` = 'PENDING_EXAM') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_registrable_courses`
--

/*!50001 DROP VIEW IF EXISTS `get_registrable_courses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_registrable_courses` AS select `c`.`id` AS `class_id`,`s`.`code` AS `subject_code`,`s`.`name` AS `subject_name`,`s`.`group` AS `group` from (`classes` `c` join `subjects` `s` on((`c`.`subject_code` = `s`.`code`))) where (`c`.`status` = 'REGISTRATION') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_results`
--

/*!50001 DROP VIEW IF EXISTS `get_results`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_results` AS select `r`.`user_id` AS `id`,`c`.`subject_code` AS `code`,`r`.`score` AS `score`,`r`.`semester` AS `semester`,`r`.`grade` AS `grade`,`s`.`name` AS `name` from ((`results` `r` join `classes` `c` on((`c`.`id` = `r`.`class_code`))) join `subjects` `s` on((`c`.`subject_code` = `s`.`code`))) where (`r`.`score` <> '0') order by `r`.`semester` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_suggest_course`
--

/*!50001 DROP VIEW IF EXISTS `get_suggest_course`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_suggest_course` AS select `ui`.`id` AS `id`,`s`.`code` AS `subject_code`,`s`.`name` AS `subject_name`,`s`.`group` AS `group`,`s`.`credit` AS `credit` from ((((`user_information` `ui` join `majors` `m` on((`ui`.`major` = `m`.`id`))) join `majors_subjects` `ms` on((`ms`.`major_id` = `m`.`id`))) join `subjects` `s` on((`ms`.`subject_code` = `s`.`code`))) left join (select `r`.`grade` AS `grade`,`c`.`subject_code` AS `sc`,`r`.`user_id` AS `user_id` from (`results` `r` join `classes` `c` on((`c`.`id` = `r`.`class_code`)))) `a` on(((`a`.`sc` = `s`.`code`) and (`a`.`user_id` = `ui`.`id`)))) where ((`a`.`grade` is null) and (`s`.`semester` <= `ui`.`semester`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_timetable`
--

/*!50001 DROP VIEW IF EXISTS `get_timetable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_timetable` AS select `r`.`user_id` AS `id`,`c`.`id` AS `class_id`,`c`.`subject_code` AS `subject_code`,`ti`.`name` AS `teacher_name`,`s`.`name` AS `subject_name`,`s`.`credit` AS `credit`,`c`.`time` AS `time`,`c`.`location` AS `location`,`c`.`week` AS `week` from (((`results` `r` join `classes` `c` on((`c`.`id` = `r`.`class_code`))) join `teacher_information` `ti` on((`ti`.`id` = `c`.`teacher`))) join `subjects` `s` on((`s`.`code` = `c`.`subject_code`))) where ((`r`.`score` = 0) and (`r`.`grade` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_user_profile`
--

/*!50001 DROP VIEW IF EXISTS `get_user_profile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_user_profile` AS select `ui`.`id` AS `id`,`ui`.`name` AS `name`,concat(`c`.`id`,' - ',`c`.`name`) AS `college`,concat(`m`.`id`,' - ',`m`.`name`) AS `major`,`ui`.`year` AS `year`,`ui`.`nationality` AS `nationality`,`ui`.`contact` AS `contact`,`ui`.`picture` AS `picture` from ((`user_information` `ui` join `majors` `m` on((`ui`.`major` = `m`.`id`))) join `colleges` `c` on((`m`.`college` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-27 11:57:21
