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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (1,'2021-04-18 22:11:11','사진폴더','2021-04-18 22:19:40',1),(2,'2021-04-18 22:11:32','귀멸의칼날','2021-04-18 22:20:44',1),(3,'2021-04-18 22:11:56','사랑과 우정','2021-04-18 23:30:18',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'2021-04-18 22:19:40','사진1','2021-04-18 23:20:40',1),(2,'2021-04-18 22:19:40','사진2','2021-04-18 23:21:47',1),(3,'2021-04-18 22:20:44','네즈코사진','2021-04-18 23:21:57',2),(4,'2021-04-18 22:20:44','카마도','2021-04-18 23:22:06',2),(5,'2021-04-18 22:20:44','무잔','2021-04-18 23:33:37',2),(6,'2021-04-18 23:30:18','제1장','2021-04-18 23:33:52',3),(7,'2021-04-18 23:30:18','제2장','2021-04-18 23:33:58',3),(8,'2021-04-18 23:30:18','제3장','2021-04-18 23:35:06',3),(9,'2021-04-18 23:30:18','제4장','2021-04-18 23:35:13',3),(10,'2021-04-18 23:30:18','제5장','2021-04-18 23:35:19',3),(11,'2021-04-18 23:30:18','제6장','2021-04-18 23:30:18',3),(12,'2021-04-18 23:30:18','제7장','2021-04-18 23:30:18',3),(13,'2021-04-18 23:30:18','제8장','2021-04-18 23:30:18',3),(14,'2021-04-18 23:30:18','제9장','2021-04-18 23:30:18',3),(15,'2021-04-18 23:30:18','제10장','2021-04-18 23:30:18',3);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'2021-04-18 22:10:20','사용자1','2021-04-18 22:10:20'),(2,'2021-04-18 22:10:20','사용자2','2021-04-18 22:10:20'),(3,'2021-04-18 22:10:20','사용자3','2021-04-18 22:10:20'),(4,'2021-04-18 22:10:20','사용자4','2021-04-18 22:10:20'),(5,'2021-04-18 22:10:20','사용자5','2021-04-18 22:10:20'),(6,'2021-04-18 22:10:20','사용자6','2021-04-18 22:10:20'),(7,'2021-04-18 22:10:20','사용자7','2021-04-18 22:10:20'),(8,'2021-04-18 22:10:20','사용자8','2021-04-18 22:10:20'),(9,'2021-04-18 22:10:20','사용자9','2021-04-18 22:10:20'),(10,'2021-04-18 22:10:20','사용자10','2021-04-18 22:10:20'),(11,'2021-04-18 22:10:20','사용자11','2021-04-18 22:10:20'),(12,'2021-04-18 22:10:20','사용자12','2021-04-18 22:10:20'),(13,'2021-04-18 22:10:20','사용자13','2021-04-18 22:10:20'),(14,'2021-04-18 22:10:20','사용자14','2021-04-18 22:10:20'),(15,'2021-04-18 22:10:20','사용자15','2021-04-18 22:10:20'),(16,'2021-04-18 22:10:20','사용자16','2021-04-18 22:10:20'),(17,'2021-04-18 22:10:20','사용자17','2021-04-18 22:10:20'),(18,'2021-04-18 22:10:20','사용자18','2021-04-18 22:10:20'),(19,'2021-04-18 22:10:20','사용자19','2021-04-18 22:10:20'),(20,'2021-04-18 22:10:20','사용자20','2021-04-18 22:10:20'),(21,'2021-04-18 22:10:20','사용자21','2021-04-18 22:10:20'),(22,'2021-04-18 22:10:20','사용자22','2021-04-18 22:10:20'),(23,'2021-04-18 22:10:20','사용자23','2021-04-18 22:10:20'),(24,'2021-04-18 22:10:20','사용자24','2021-04-18 22:10:20'),(25,'2021-04-18 22:10:20','사용자25','2021-04-18 22:10:20'),(26,'2021-04-18 22:10:20','사용자26','2021-04-18 22:10:20'),(27,'2021-04-18 22:10:20','사용자27','2021-04-18 22:10:20'),(28,'2021-04-18 22:10:20','사용자28','2021-04-18 22:10:20'),(29,'2021-04-18 22:10:20','사용자29','2021-04-18 22:10:20'),(30,'2021-04-18 22:10:20','사용자30','2021-04-18 22:10:20'),(31,'2021-04-18 22:10:20','사용자31','2021-04-18 22:10:20'),(32,'2021-04-18 22:10:20','사용자32','2021-04-18 22:10:20'),(33,'2021-04-18 22:10:20','사용자33','2021-04-18 22:10:20'),(34,'2021-04-18 22:10:20','사용자34','2021-04-18 22:10:20'),(35,'2021-04-18 22:10:20','사용자35','2021-04-18 22:10:20'),(36,'2021-04-18 22:10:20','사용자36','2021-04-18 22:10:20'),(37,'2021-04-18 22:10:20','사용자37','2021-04-18 22:10:20'),(38,'2021-04-18 22:10:20','사용자38','2021-04-18 22:10:20'),(39,'2021-04-18 22:10:20','사용자39','2021-04-18 22:10:20'),(40,'2021-04-18 22:10:20','사용자40','2021-04-18 22:10:20'),(41,'2021-04-18 22:10:20','사용자41','2021-04-18 22:10:20'),(42,'2021-04-18 22:10:20','사용자42','2021-04-18 22:10:20'),(43,'2021-04-18 22:10:20','사용자43','2021-04-18 22:10:20'),(44,'2021-04-18 22:10:20','사용자44','2021-04-18 22:10:20'),(45,'2021-04-18 22:10:20','사용자45','2021-04-18 22:10:20'),(46,'2021-04-18 22:10:20','사용자46','2021-04-18 22:10:20'),(47,'2021-04-18 22:10:20','사용자47','2021-04-18 22:10:20'),(48,'2021-04-18 22:10:20','사용자48','2021-04-18 22:10:20'),(49,'2021-04-18 22:10:20','사용자49','2021-04-18 22:10:20'),(50,'2021-04-18 22:10:20','사용자50','2021-04-18 22:10:20');
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

-- Dump completed on 2021-04-18 23:41:13
