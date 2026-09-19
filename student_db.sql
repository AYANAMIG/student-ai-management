-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: student_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Current Database: `student_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `student_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `student_db`;

--
-- Table structure for table `class_score`
--

DROP TABLE IF EXISTS `class_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_score` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `class_id` int NOT NULL COMMENT '班级ID',
  `total_score` int NOT NULL COMMENT '班级总成绩',
  `avg_score` decimal(5,2) NOT NULL COMMENT '班级平均成绩',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_score`
--

LOCK TABLES `class_score` WRITE;
/*!40000 ALTER TABLE `class_score` DISABLE KEYS */;
INSERT INTO `class_score` VALUES (1,1,80,80.00),(2,2,70,70.00),(3,3,90,90.00),(4,4,40,40.00);
/*!40000 ALTER TABLE `class_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classpro`
--

DROP TABLE IF EXISTS `classpro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classpro` (
  `class_id` int NOT NULL AUTO_INCREMENT COMMENT '班级ID',
  `class_name` varchar(50) NOT NULL COMMENT '班级名称',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classpro`
--

LOCK TABLES `classpro` WRITE;
/*!40000 ALTER TABLE `classpro` DISABLE KEYS */;
INSERT INTO `classpro` VALUES (1,'一班'),(2,'二班'),(3,'三班'),(4,'四班');
/*!40000 ALTER TABLE `classpro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) NOT NULL,
  `upwd` varchar(50) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (1,'pro','pro'),(2,'admin','123456');
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` int DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `classp` varchar(100) DEFAULT NULL,
  `enrol` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'姜维',29,'计算机科学与技术','23级计算机技术3班','2025-12-01'),(2,'庞统',55,'计算机科学与技术','23级计算机技术4班','2025-12-01'),(3,'郭嘉',66,'人工智能','23级计算机技术4班','2025-12-01'),(4,'张数',55,'软件工程','23级计算机技术4班','2025-12-01'),(5,'刘杰可',22,'人工智能','23级计算机技术4班','2025-12-01'),(6,'张佳飞',66,'计算机科学与技术','23级计算机技术3班','2025-12-01'),(7,'维斯',23,'人工智能','23级计算机技术2班','2025-12-09'),(8,'国网',33,'软件工程','23级计算机技术4班','2025-12-20'),(9,'乔安',45,'软件工程','23级计算机技术4班','2020-01-24');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-20  2:19:23
