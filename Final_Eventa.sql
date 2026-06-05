-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: eventa
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `event_participants`
--

DROP TABLE IF EXISTS `event_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_participants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  `joined_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_participants`
--

LOCK TABLES `event_participants` WRITE;
/*!40000 ALTER TABLE `event_participants` DISABLE KEYS */;
INSERT INTO `event_participants` VALUES (1,8,2,'2025-05-26 11:42:52'),(2,9,2,'2025-05-26 11:46:29'),(3,10,4,'2025-05-26 11:47:56'),(4,10,2,'2025-05-26 11:48:03'),(5,1,8,'2025-05-27 17:05:47'),(6,1,9,'2025-05-27 17:19:54'),(7,13,9,'2025-05-27 17:27:36'),(8,13,8,'2025-05-27 17:27:42'),(9,8,8,'2025-05-27 21:55:51'),(10,8,9,'2025-05-27 21:55:58'),(11,1,17,'2025-05-28 14:50:14'),(12,1,14,'2025-05-28 14:50:19'),(13,14,19,'2025-05-28 15:00:18'),(14,14,18,'2025-05-28 15:00:26'),(15,16,19,'2025-06-11 16:54:31'),(16,16,20,'2025-06-11 17:16:20'),(17,22,20,'2025-06-11 17:17:52'),(18,22,19,'2025-06-18 12:58:20'),(19,22,21,'2025-06-24 22:46:07'),(20,27,23,'2025-06-25 11:43:22'),(21,22,23,'2025-06-25 11:44:53'),(22,29,19,'2025-06-25 19:45:43'),(23,29,23,'2025-06-25 19:46:36'),(28,34,19,'2025-06-28 18:30:50'),(32,34,21,'2025-06-29 13:41:31'),(33,16,22,'2025-06-29 19:38:24'),(34,46,22,'2025-07-03 20:44:20');
/*!40000 ALTER TABLE `event_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `visibility` enum('public','private','invite-only') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'public',
  `price` decimal(10,2) DEFAULT '0.00',
  `recurring` enum('no','daily','weekly','monthly') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'no',
  `agenda` text COLLATE utf8mb4_general_ci,
  `speakers` text COLLATE utf8mb4_general_ci,
  `sponsors` text COLLATE utf8mb4_general_ci,
  `organizer_username` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (43,'Music Festival','A Music Festival','2025-07-17','23:22:00','Slemani','uploads/6866cf2f7e501_music.jpg','Music','public',25.00,'no','[\"Spreading awesome music\"]','[\"Musician\"]','[\"None\"]','FinalOrganizer','2025-07-03 18:42:55','2025-07-03 18:42:55'),(44,'Football Game','Watch a fun football game with us!','2025-07-08','20:00:00','Slemani Stadium','uploads/6866cf71dba3a_football.jpg','Sports','public',0.00,'no','[\"Watching An Amazing Sport\"]','[\"None\"]','[\"Football Club\"]','FinalOrganizer','2025-07-03 18:44:01','2025-07-03 18:44:01'),(45,'A Trip to paris','Going to France!','2025-07-30','08:00:00','France','uploads/6866cfd9af1cc_eiffel-tower-with-french-flag-background-vector-presentation-design-8k-white-background-red-blue_1312174-72-157023911.jpg','Trip','public',250.00,'no','[\"Exploring new places\"]','[\"none\"]','[\"Airlines\"]','FinalOrganizer','2025-07-03 18:45:45','2025-07-03 18:45:45');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (90,'A new event \'Music Festival\' has been created by FinalOrganizer.','2025-07-03 18:42:55'),(91,'A new event \'Football Game\' has been created by FinalOrganizer.','2025-07-03 18:44:01'),(92,'A new event \'A Trip to paris\' has been created by FinalOrganizer.','2025-07-03 18:45:45');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('user','admin','event_organizer') COLLATE utf8mb4_general_ci NOT NULL,
  `verified` enum('yes','no') COLLATE utf8mb4_general_ci DEFAULT 'no',
  `full_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `past_experience` text COLLATE utf8mb4_general_ci,
  `cv_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Path to uploaded CV file for event organizers',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,'User','a61a8adf60038792a2cb88e670b20540a9d6c2ca204ab754fc768950e79e7d36','user','no',NULL,NULL,NULL,NULL),(13,'test2','60303ae22b998861bce3b28f33eec1be758a213c86c93c076dbe9f558c11c752','user','no',NULL,NULL,NULL,NULL),(14,'normal','317b32c143692b9939c197f6a5df54f9698df9a4882fe8bf19608968662be4fa','user','no',NULL,NULL,NULL,NULL),(15,'organizer','0bf7ab78559a04941f158a11b00afaf6a8b22f90cff387edbc8e1d7a9b99cca0','event_organizer','yes',NULL,NULL,NULL,NULL),(16,'us','79adb2a2fce5c6ba215fe5f27f532d4e7edbac4b6a5e09e1ef3a08084a904621','user','yes',NULL,NULL,NULL,NULL),(18,'ad','c97e2abed1e9f9b2b0dfb8747f1c15aebd1f0a7e7dd6b0cce73a5dd1f0f3fbd5','admin','yes',NULL,NULL,NULL,NULL),(19,'iamadmin','c068fb95b8e64b1d775313ed5902efbe32d207e4de7876f8caf838fec6f8d18a','admin','yes',NULL,NULL,NULL,NULL),(20,'testadmin','597f5441e7d174b607873874ed54b974674986ad543e7458e28a038671c9f64c','admin','yes',NULL,NULL,NULL,NULL),(22,'chat','31e06f7d89feb99a0e6c0affe198748c3bb5bef5e3cc92d95cb9e996197d3fc3','user','yes',NULL,NULL,NULL,NULL),(24,'a','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','user','yes',NULL,NULL,NULL,NULL),(25,'bawan','02e0461cb05ed3139deb81b766c9f0deaccab522a6f20233910ee44064a27aa7','event_organizer','yes',NULL,NULL,NULL,NULL),(26,'Organizers','a2c0cec8bfb315a06beb7c80e764d43e7476a80e475b691f8a3bd86454689d17','event_organizer','yes',NULL,NULL,NULL,NULL),(27,'Normaluser','ecc02be7671eb094e55fe6dcb7a0cdbdc1c6afc72a7943bb64c511cde8b40b21','user','yes',NULL,NULL,NULL,NULL),(28,'FinalOrganizer','a9485702fe75bff73468e241702ad42b21f15bfe67cf17879cb54e4dc050dfd4','event_organizer','yes','San Aram','Eventa','Created Eventa!',NULL),(29,'FinalUser','5526796987bd43060146d5dc76c608191b1605e1430619f0aeacd2a9fd51dc52','user','yes','','','',NULL),(31,'plottwist','plottwist','user','no',NULL,NULL,NULL,NULL),(32,'orgg','orgg','event_organizer','no',NULL,NULL,NULL,NULL),(33,'kill','kill','admin','no',NULL,NULL,NULL,NULL),(34,'zheer','zheer','user','no',NULL,NULL,NULL,NULL),(41,'admin','admin','admin','yes',NULL,NULL,NULL,NULL),(43,'San_Aram','629094b5a2b0eb168a6c4818cd10f05dd5164394eec1abdefa160cc6e049dc1c','event_organizer','yes','San Aram','Eventas','Software student','uploads/cv/686163e5d675c_cv_San_Aram.pdf'),(45,'zanwer','95f5fec0dbd48aa31e2c2877d844ee2be819c22dabc3d3a2f13d935ef6fbbe9b','event_organizer','yes','zanwer bakhtyar hasan salim','Zanwer','None','uploads/cv/6863818a1fa9f_cv_zanwer.pdf'),(46,'nrm','b5a376825c292a2c6bf174b78591d81082dfd636ec8eaade2ea889e2288b22d8','user','yes','','','',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-03 21:48:56
