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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_score`
--

LOCK TABLES `class_score` WRITE;
/*!40000 ALTER TABLE `class_score` DISABLE KEYS */;
INSERT INTO `class_score` VALUES (1,1,80,80.00),(2,2,70,70.00),(3,3,90,90.00),(4,4,40,40.00),(5,5,85,85.00),(6,6,75,75.00),(7,5,85,85.00),(8,6,75,75.00),(9,7,92,92.00),(10,8,88,88.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classpro`
--

LOCK TABLES `classpro` WRITE;
/*!40000 ALTER TABLE `classpro` DISABLE KEYS */;
INSERT INTO `classpro` VALUES (1,'一班'),(2,'二班'),(3,'三班'),(4,'四班'),(5,'23级计算机技术5班'),(6,'23级计算机技术6班'),(7,'23级计算机技术5班'),(8,'23级计算机技术6班'),(9,'24级计算机技术1班'),(10,'24级计算机技术2班');
/*!40000 ALTER TABLE `classpro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `operator` varchar(50) DEFAULT NULL COMMENT '操作员',
  `type` varchar(100) DEFAULT NULL COMMENT '操作类型',
  `time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'admin','登录系统','2026-09-20 20:05:08'),(2,'admin','添加学生：姜维','2026-09-20 20:05:08'),(3,'admin','删除学生：张三','2026-09-20 20:05:08'),(4,'admin','登录系统','2026-09-20 20:11:18'),(5,'pro','登录系统','2026-09-20 20:22:57'),(6,'pro','添加学生：郭嘉','2026-09-20 20:22:57'),(7,'admin','修改学生：姜维','2026-09-20 20:22:57'),(8,'admin','查询学生列表','2026-09-20 20:22:57'),(9,'pro','删除学生：测试','2026-09-20 20:22:57'),(10,'admin','登录系统','2026-09-20 20:22:57'),(11,'admin','导出学生数据','2026-09-20 20:22:57'),(12,'pro','修改学生：庞统','2026-09-20 20:22:57'),(13,'pro','登录系统','2026-09-20 20:23:47'),(14,'pro','添加学生：王小明','2026-09-20 20:23:47'),(15,'admin','修改学生：姜维','2026-09-20 20:23:47'),(16,'admin','查询学生列表','2026-09-20 20:23:47'),(17,'pro','删除学生：测试数据','2026-09-20 20:23:47'),(18,'admin','登录系统','2026-09-20 20:23:47'),(19,'admin','导出学生数据','2026-09-20 20:23:47'),(20,'pro','修改学生：庞统','2026-09-20 20:23:47'),(21,'admin','查看课程统计','2026-09-20 20:23:47'),(22,'pro','查看成绩统计','2026-09-20 20:23:47');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'姜维',29,'计算机科学与技术','23级计算机技术3班','2025-12-01'),(2,'庞统',55,'计算机科学与技术','23级计算机技术4班','2025-12-01'),(3,'郭嘉',66,'人工智能','23级计算机技术4班','2025-12-01'),(4,'张数',55,'软件工程','23级计算机技术4班','2025-12-01'),(5,'刘杰可',22,'人工智能','23级计算机技术4班','2025-12-01'),(6,'张佳飞',66,'计算机科学与技术','23级计算机技术3班','2025-12-01'),(7,'维斯',23,'人工智能','23级计算机技术2班','2025-12-09'),(8,'国网',33,'软件工程','23级计算机技术4班','2025-12-20'),(9,'乔安',45,'软件工程','23级计算机技术4班','2020-01-24'),(10,'王小明',21,'计算机科学与技术','23级计算机技术3班','2025-09-01'),(11,'李小红',22,'人工智能','23级计算机技术4班','2025-09-01'),(12,'赵小刚',20,'软件工程','23级计算机技术2班','2025-09-01'),(13,'孙小美',23,'人工智能','23级计算机技术3班','2025-09-01'),(14,'周小天',21,'软件工程','23级计算机技术4班','2025-09-01'),(15,'王小明',21,'计算机科学与技术','23级计算机技术3班','2026-03-01'),(16,'李小红',22,'人工智能','23级计算机技术4班','2026-03-05'),(17,'赵小刚',20,'软件工程','23级计算机技术2班','2026-03-10'),(18,'孙小美',23,'人工智能','23级计算机技术3班','2026-03-15'),(19,'周小天',21,'软件工程','23级计算机技术4班','2026-03-20'),(20,'吴大伟',22,'计算机科学与技术','23级计算机技术2班','2026-04-01'),(21,'郑小芳',20,'人工智能','23级计算机技术3班','2026-04-05'),(22,'冯小强',23,'软件工程','23级计算机技术4班','2026-04-10');
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

-- Dump completed on 2026-09-20 20:24:57
