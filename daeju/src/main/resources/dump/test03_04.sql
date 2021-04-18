-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder` (
  `folder_id` int NOT NULL AUTO_INCREMENT,
  `createdat` datetime DEFAULT NULL,
  `folder_name` varchar(255) DEFAULT NULL,
  `updatedat` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`folder_id`),
  KEY `FK5fd2civdi8s832iyrufpk400k` (`user_id`),
  CONSTRAINT `FK5fd2civdi8s832iyrufpk400k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (1,'2021-04-18 22:11:11','사진폴더','2021-04-19 01:53:01',1),(2,'2021-04-18 22:11:32','귀멸의칼날','2021-04-18 22:20:44',1),(3,'2021-04-18 22:11:56','사랑과 우정','2021-04-18 23:30:18',1),(18,'2021-04-19 02:51:48','포인트생성폴더1','2021-04-19 02:53:22',1),(19,'2021-04-19 02:51:56','포인트생성폴더2','2021-04-19 02:54:01',1),(20,'2021-04-19 03:02:02','포인트생성소모없음','2021-04-19 03:02:02',1);
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `img_id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `img_name` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `folder_id` int DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `FK7kd3mgvv9u9pu90wrgldfktgc` (`folder_id`),
  CONSTRAINT `FK7kd3mgvv9u9pu90wrgldfktgc` FOREIGN KEY (`folder_id`) REFERENCES `folder` (`folder_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'2021-04-18 22:19:40','사진1','2021-04-18 23:20:40',1),(2,'2021-04-18 22:19:40','사진2','2021-04-18 23:21:47',1),(3,'2021-04-18 22:20:44','네즈코사진','2021-04-18 23:21:57',2),(4,'2021-04-18 22:20:44','카마도','2021-04-18 23:22:06',2),(5,'2021-04-18 22:20:44','무잔','2021-04-18 23:33:37',2),(6,'2021-04-18 23:30:18','제1장','2021-04-18 23:33:52',3),(7,'2021-04-18 23:30:18','제2장','2021-04-18 23:33:58',3),(8,'2021-04-18 23:30:18','제3장','2021-04-18 23:35:06',3),(9,'2021-04-18 23:30:18','제4장','2021-04-18 23:35:13',3),(10,'2021-04-18 23:30:18','제5장','2021-04-18 23:35:19',3),(11,'2021-04-18 23:30:18','제6장','2021-04-18 23:30:18',3),(12,'2021-04-18 23:30:18','제7장','2021-04-18 23:30:18',3),(13,'2021-04-18 23:30:18','제8장','2021-04-18 23:30:18',3),(14,'2021-04-18 23:30:18','제9장','2021-04-18 23:30:18',3),(15,'2021-04-18 23:30:18','제10장','2021-04-18 23:30:18',3),(16,'2021-04-19 01:53:01','사진3','2021-04-19 01:53:01',1),(17,'2021-04-19 01:53:01','사진4','2021-04-19 01:53:01',1),(60,'2021-04-19 02:53:22','사진1','2021-04-19 02:53:22',18),(61,'2021-04-19 02:53:22','사진2','2021-04-19 02:53:22',18),(62,'2021-04-19 02:53:22','사진3','2021-04-19 02:53:22',18),(63,'2021-04-19 02:53:22','사진4','2021-04-19 02:53:22',18),(64,'2021-04-19 02:53:22','사진5','2021-04-19 02:53:22',18),(65,'2021-04-19 02:53:22','사진6','2021-04-19 02:53:22',18),(66,'2021-04-19 02:53:22','사진7','2021-04-19 02:53:22',18),(67,'2021-04-19 02:53:22','사진8','2021-04-19 02:53:22',18),(68,'2021-04-19 02:53:22','사진9','2021-04-19 02:53:22',18),(69,'2021-04-19 02:53:22','사진10','2021-04-19 02:53:22',18),(70,'2021-04-19 02:54:01','캡처1','2021-04-19 02:54:01',19);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pointhst`
--

DROP TABLE IF EXISTS `pointhst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pointhst` (
  `point_hst_id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `folder_id` int NOT NULL,
  `get_point` int NOT NULL,
  `point_dv` varchar(255) DEFAULT NULL,
  `rmd_point` int NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`point_hst_id`),
  KEY `FKail9xqunr7sjiueae5x7du446` (`user_id`),
  CONSTRAINT `FKail9xqunr7sjiueae5x7du446` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pointhst`
--

LOCK TABLES `pointhst` WRITE;
/*!40000 ALTER TABLE `pointhst` DISABLE KEYS */;
INSERT INTO `pointhst` VALUES (1,'2021-04-19 02:51:48',18,1000,'01',1000,'2021-04-19 02:51:48',1),(2,'2021-04-19 02:51:56',19,1000,'01',2000,'2021-04-19 02:51:56',1),(3,'2021-04-19 02:53:22',18,100,'02',1900,'2021-04-19 02:53:22',1),(4,'2021-04-19 02:53:22',18,100,'02',1800,'2021-04-19 02:53:22',1),(5,'2021-04-19 02:53:22',18,100,'02',1700,'2021-04-19 02:53:22',1),(6,'2021-04-19 02:53:22',18,100,'02',1600,'2021-04-19 02:53:22',1),(7,'2021-04-19 02:53:22',18,100,'02',1500,'2021-04-19 02:53:22',1),(8,'2021-04-19 02:53:22',18,100,'02',1400,'2021-04-19 02:53:22',1),(9,'2021-04-19 02:53:22',18,100,'02',1300,'2021-04-19 02:53:22',1),(10,'2021-04-19 02:53:22',18,100,'02',1200,'2021-04-19 02:53:22',1),(11,'2021-04-19 02:53:22',18,100,'02',1100,'2021-04-19 02:53:22',1),(12,'2021-04-19 02:53:22',18,100,'02',1000,'2021-04-19 02:53:22',1),(13,'2021-04-19 02:54:01',19,100,'02',900,'2021-04-19 02:54:01',1),(14,'2021-04-19 03:02:02',20,1000,'01',1900,'2021-04-19 03:02:02',1);
/*!40000 ALTER TABLE `pointhst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `tag_name` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `img_id` int DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  KEY `FK43vmrqnc0kvjx2mm6vc0tg4lm` (`img_id`),
  CONSTRAINT `FK43vmrqnc0kvjx2mm6vc0tg4lm` FOREIGN KEY (`img_id`) REFERENCES `image` (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'2021-04-18 23:20:40','멋있넼','2021-04-18 23:20:40',1),(2,'2021-04-18 23:20:40','요건별로다.','2021-04-18 23:20:40',1),(3,'2021-04-18 23:21:47','요건별로여','2021-04-18 23:21:47',2),(4,'2021-04-18 23:21:57','예쁘다.','2021-04-18 23:21:57',3),(5,'2021-04-18 23:21:57','오니','2021-04-18 23:21:57',3),(6,'2021-04-18 23:21:57','네즈코','2021-04-18 23:21:57',3),(7,'2021-04-18 23:22:06','귀멸주인공','2021-04-18 23:22:06',4),(8,'2021-04-18 23:22:06','노력파','2021-04-18 23:22:06',4),(9,'2021-04-18 23:33:37','최종보스','2021-04-18 23:33:37',5),(10,'2021-04-18 23:33:37','태양을피하고싶어','2021-04-18 23:33:37',5),(11,'2021-04-18 23:33:52','하품..','2021-04-18 23:33:52',6),(12,'2021-04-18 23:33:58','하품..','2021-04-18 23:33:58',7),(13,'2021-04-18 23:35:06','하품..','2021-04-18 23:35:06',8),(14,'2021-04-18 23:35:13','하품..','2021-04-18 23:35:13',9),(15,'2021-04-18 23:35:19','하품..','2021-04-18 23:35:19',10);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rmd_point` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'2021-04-19 02:41:06','사용자','2021-04-19 03:02:02',1900),(2,'2021-04-18 22:10:20','사용자2','2021-04-18 22:10:20',0),(3,'2021-04-18 22:10:20','사용자3','2021-04-18 22:10:20',0),(4,'2021-04-18 22:10:20','사용자4','2021-04-18 22:10:20',0),(5,'2021-04-18 22:10:20','사용자5','2021-04-18 22:10:20',0),(6,'2021-04-18 22:10:20','사용자6','2021-04-18 22:10:20',0),(7,'2021-04-18 22:10:20','사용자7','2021-04-18 22:10:20',0),(8,'2021-04-18 22:10:20','사용자8','2021-04-18 22:10:20',0),(9,'2021-04-18 22:10:20','사용자9','2021-04-18 22:10:20',0),(10,'2021-04-18 22:10:20','사용자10','2021-04-18 22:10:20',0),(11,'2021-04-18 22:10:20','사용자11','2021-04-18 22:10:20',0),(12,'2021-04-18 22:10:20','사용자12','2021-04-18 22:10:20',0),(13,'2021-04-18 22:10:20','사용자13','2021-04-18 22:10:20',0),(14,'2021-04-18 22:10:20','사용자14','2021-04-18 22:10:20',0),(15,'2021-04-18 22:10:20','사용자15','2021-04-18 22:10:20',0),(16,'2021-04-18 22:10:20','사용자16','2021-04-18 22:10:20',0),(17,'2021-04-18 22:10:20','사용자17','2021-04-18 22:10:20',0),(18,'2021-04-18 22:10:20','사용자18','2021-04-18 22:10:20',0),(19,'2021-04-18 22:10:20','사용자19','2021-04-18 22:10:20',0),(20,'2021-04-18 22:10:20','사용자20','2021-04-18 22:10:20',0),(21,'2021-04-18 22:10:20','사용자21','2021-04-18 22:10:20',0),(22,'2021-04-18 22:10:20','사용자22','2021-04-18 22:10:20',0),(23,'2021-04-18 22:10:20','사용자23','2021-04-18 22:10:20',0),(24,'2021-04-18 22:10:20','사용자24','2021-04-18 22:10:20',0),(25,'2021-04-18 22:10:20','사용자25','2021-04-18 22:10:20',0),(26,'2021-04-18 22:10:20','사용자26','2021-04-18 22:10:20',0),(27,'2021-04-18 22:10:20','사용자27','2021-04-18 22:10:20',0),(28,'2021-04-18 22:10:20','사용자28','2021-04-18 22:10:20',0),(29,'2021-04-18 22:10:20','사용자29','2021-04-18 22:10:20',0),(30,'2021-04-18 22:10:20','사용자30','2021-04-18 22:10:20',0),(31,'2021-04-18 22:10:20','사용자31','2021-04-18 22:10:20',0),(32,'2021-04-18 22:10:20','사용자32','2021-04-18 22:10:20',0),(33,'2021-04-18 22:10:20','사용자33','2021-04-18 22:10:20',0),(34,'2021-04-18 22:10:20','사용자34','2021-04-18 22:10:20',0),(35,'2021-04-18 22:10:20','사용자35','2021-04-18 22:10:20',0),(36,'2021-04-18 22:10:20','사용자36','2021-04-18 22:10:20',0),(37,'2021-04-18 22:10:20','사용자37','2021-04-18 22:10:20',0),(38,'2021-04-18 22:10:20','사용자38','2021-04-18 22:10:20',0),(39,'2021-04-18 22:10:20','사용자39','2021-04-18 22:10:20',0),(40,'2021-04-18 22:10:20','사용자40','2021-04-18 22:10:20',0),(41,'2021-04-18 22:10:20','사용자41','2021-04-18 22:10:20',0),(42,'2021-04-18 22:10:20','사용자42','2021-04-18 22:10:20',0),(43,'2021-04-18 22:10:20','사용자43','2021-04-18 22:10:20',0),(44,'2021-04-18 22:10:20','사용자44','2021-04-18 22:10:20',0),(45,'2021-04-18 22:10:20','사용자45','2021-04-18 22:10:20',0),(46,'2021-04-18 22:10:20','사용자46','2021-04-18 22:10:20',0),(47,'2021-04-18 22:10:20','사용자47','2021-04-18 22:10:20',0),(48,'2021-04-18 22:10:20','사용자48','2021-04-18 22:10:20',0),(49,'2021-04-18 22:10:20','사용자49','2021-04-18 22:10:20',0),(50,'2021-04-18 22:10:20','사용자50','2021-04-18 22:10:20',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-19  3:29:34
