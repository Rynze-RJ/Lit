CREATE DATABASE  IF NOT EXISTS `lit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lit`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: lit
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `FKgdpd8e1vs356bjg287jr27pl7` (`role_id`),
  KEY `FK7m8ru44m93ukyb61dfxw0apf6` (`user_id`),
  CONSTRAINT `FK7m8ru44m93ukyb61dfxw0apf6` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKgdpd8e1vs356bjg287jr27pl7` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'rynzerj.l@gmail.com','Rynze RJ','male',_binary '\0','Lozano',3,1),(2,'lili97@gmail.com','Lalisa','female',_binary '\0','Manobal',2,2),(3,'rosesarerosie@gmai.com','Roseanne','female',_binary '\0','Park',2,3),(4,'nini@gmail.com','Jennie','female',_binary '\0','Kim',2,4),(5,'jichuturtlerabbitkim@gmail.com','Jisoo','female',_binary '\0','Kim',1,5);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_achievement`
--

DROP TABLE IF EXISTS `account_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_achievement` (
  `account_achievement_id` int NOT NULL AUTO_INCREMENT,
  `is_deleted` bit(1) NOT NULL,
  `account_id` int DEFAULT NULL,
  PRIMARY KEY (`account_achievement_id`),
  KEY `FK5sespnjdswbvn6nsukepja2n6` (`account_id`),
  CONSTRAINT `FK5sespnjdswbvn6nsukepja2n6` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_achievement`
--

LOCK TABLES `account_achievement` WRITE;
/*!40000 ALTER TABLE `account_achievement` DISABLE KEYS */;
INSERT INTO `account_achievement` VALUES (1,_binary '\0',1),(2,_binary '\0',2),(3,_binary '\0',3),(4,_binary '\0',4),(5,_binary '\0',5);
/*!40000 ALTER TABLE `account_achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_subscription`
--

DROP TABLE IF EXISTS `account_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_subscription` (
  `account_subscription_id` int NOT NULL AUTO_INCREMENT,
  `end_date` datetime(6) DEFAULT NULL,
  `is_subscribed` bit(1) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `subscription_id` int DEFAULT NULL,
  PRIMARY KEY (`account_subscription_id`),
  KEY `FKmgxwdymq3tchosw1np18i1ixi` (`account_id`),
  KEY `FKv56upgwrie4qs7q9n2k5u7q1` (`subscription_id`),
  CONSTRAINT `FKmgxwdymq3tchosw1np18i1ixi` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FKv56upgwrie4qs7q9n2k5u7q1` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_subscription`
--

LOCK TABLES `account_subscription` WRITE;
/*!40000 ALTER TABLE `account_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `achievement`
--

DROP TABLE IF EXISTS `achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievement` (
  `achievement_id` int NOT NULL AUTO_INCREMENT,
  `achievement_description` varchar(255) DEFAULT NULL,
  `achievement_name` varchar(255) DEFAULT NULL,
  `achievement_value` int DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `book_book_id` int DEFAULT NULL,
  `account_achievement_id` int DEFAULT NULL,
  PRIMARY KEY (`achievement_id`),
  KEY `FK4bpa2bprh1edf8hv78btlhrit` (`book_book_id`),
  KEY `FK51i35i13v037tnqlb3a5loycy` (`account_achievement_id`),
  CONSTRAINT `FK4bpa2bprh1edf8hv78btlhrit` FOREIGN KEY (`book_book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `FK51i35i13v037tnqlb3a5loycy` FOREIGN KEY (`account_achievement_id`) REFERENCES `account_achievement` (`account_achievement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement`
--

LOCK TABLES `achievement` WRITE;
/*!40000 ALTER TABLE `achievement` DISABLE KEYS */;
INSERT INTO `achievement` VALUES (1,'half all levels','half way there ',100,_binary '\0',1,NULL);
/*!40000 ALTER TABLE `achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_req`
--

DROP TABLE IF EXISTS `author_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_req` (
  `author_req_id` int NOT NULL AUTO_INCREMENT,
  `portfolio_link` varchar(255) DEFAULT NULL,
  `request` text,
  `request_status` varchar(255) DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  PRIMARY KEY (`author_req_id`),
  KEY `FK5wggblkh040dfjs2bk2hc824r` (`account_id`),
  CONSTRAINT `FK5wggblkh040dfjs2bk2hc824r` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_req`
--

LOCK TABLES `author_req` WRITE;
/*!40000 ALTER TABLE `author_req` DISABLE KEYS */;
INSERT INTO `author_req` VALUES (1,'@lalalalisa_m','BLACKPINK in your area!','Approved',2),(2,'@roses_are_rosie','BLACKPINK in your area!!','Approved',3),(3,'@jennirubyjane','BLACKPINK in your area!!!','Approved',4);
/*!40000 ALTER TABLE `author_req` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_description` varchar(255) DEFAULT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL,
  `author` int DEFAULT NULL,
  `book_list_id` int DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `FKeaga2e1xgd28ai77fquok9qmi` (`author`),
  KEY `FKdwfd328rq5prm44trsvk9m2ba` (`book_list_id`),
  CONSTRAINT `FKdwfd328rq5prm44trsvk9m2ba` FOREIGN KEY (`book_list_id`) REFERENCES `booklist` (`book_list_id`),
  CONSTRAINT `FKeaga2e1xgd28ai77fquok9qmi` FOREIGN KEY (`author`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Sa kaharian ng Berbanya, nagkasakit si Haring Fernando. Para sa kanyang paggaling, kinakailangang hulihin ang Ibong Adarna. Si Don Juan ang nagtagumpay sa misyon na ito, ngunit kailangang harapin ang inggit at pag-aagam-agam ng kanyang mga kapatid.','Ibong Adarna','Folklore',_binary '\0',2,3),(2,'sample 1','Alamat ng Pinya','Folklore',_binary '\0',2,NULL),(3,'sample 2','Alamat ng Gubat','Folklore',_binary '\0',2,NULL),(4,'sample 3','Alamat ng Rosas','Folklore',_binary '\0',2,NULL),(5,'sample 4','Florante at Laura','Fiction',_binary '',2,NULL),(6,'sample 5','El Filibusterismo','Fiction',_binary '',2,NULL),(7,'sample 6','Dekada 70','Fiction',_binary '',2,NULL),(8,'sample 8','Smaller and Smaller Cir..','Fiction',_binary '',2,NULL),(9,'8','Ghost of a Feeling','Romance',_binary '',2,NULL),(10,'sample 9','Para sa Hopeless Rom...','Romance',_binary '',2,NULL),(11,'sample 9','Ang Apat na Anghel','Romance',_binary '',2,NULL),(12,'sample 10','Before Ever After','Romance',_binary '',2,NULL),(13,'sample','Florante at Laura','Fiction',_binary '\0',3,NULL),(14,'sample','El Filibusterismo','Fiction',_binary '\0',3,NULL),(15,'sample','Dekada 70','Fiction',_binary '\0',3,NULL),(16,'sample','Smaller and Smaller Cir..','Fiction',_binary '\0',3,NULL),(17,'sample','Ghost of a Feeling','Romance',_binary '\0',4,NULL),(18,'sample','Para sa Hopeless Rom...','Romance',_binary '\0',4,NULL),(19,'sample','Ang Apat na Anghel','Romance',_binary '\0',4,NULL),(20,'sample','Before Ever After','Romance',_binary '\0',4,NULL);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_request_entity`
--

DROP TABLE IF EXISTS `book_request_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_request_entity` (
  `book_request_id` int NOT NULL AUTO_INCREMENT,
  `book_description` varchar(255) DEFAULT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `accout_id` int DEFAULT NULL,
  PRIMARY KEY (`book_request_id`),
  KEY `FK9yv483ow5jish3vri41l22l9a` (`accout_id`),
  CONSTRAINT `FK9yv483ow5jish3vri41l22l9a` FOREIGN KEY (`accout_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_request_entity`
--

LOCK TABLES `book_request_entity` WRITE;
/*!40000 ALTER TABLE `book_request_entity` DISABLE KEYS */;
INSERT INTO `book_request_entity` VALUES (1,'Sa kaharian ng Berbanya, nagkasakit si Haring Fernando. Para sa kanyang paggaling, kinakailangang hulihin ang Ibong Adarna. Si Don Juan ang nagtagumpay sa misyon na ito, ngunit kailangang harapin ang inggit at pag-aagam-agam ng kanyang mga kapatid.','Ibong Adarna','Folklore','Approved',2),(2,'sample 1','Alamat ng Pinya','Folklore','Approved',2),(3,'sample 2','Alamat ng Gubat','Folklore','Approved',2),(4,'sample 3','Alamat ng Rosas','Folklore','Approved',2),(5,'sample 4','Florante at Laura','Fiction','Approved',2),(6,'sample 5','El Filibusterismo','Fiction','Approved',2),(7,'sample 6','Dekada 70','Fiction','Approved',2),(8,'sample 8','Smaller and Smaller Cir..','Fiction','Approved',2),(9,'8','Ghost of a Feeling','Romance','Approved',2),(10,'sample 9','Para sa Hopeless Rom...','Romance','Approved',2),(11,'sample 9','Ang Apat na Anghel','Romance','Approved',2),(12,'sample 10','Before Ever After','Romance','Approved',2),(13,'sample','Florante at Laura','Fiction','Approved',3),(14,'sample','El Filibusterismo','Fiction','Approved',3),(15,'sample','Dekada 70','Fiction','Approved',3),(16,'sample','Smaller and Smaller Cir..','Fiction','Approved',3),(17,'sample','Ghost of a Feeling','Romance','Approved',4),(18,'sample','Para sa Hopeless Rom...','Romance','Approved',4),(19,'sample','Ang Apat na Anghel','Romance','Approved',4),(20,'sample','Before Ever After','Romance','Approved',4);
/*!40000 ALTER TABLE `book_request_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booklist`
--

DROP TABLE IF EXISTS `booklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booklist` (
  `book_list_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  PRIMARY KEY (`book_list_id`),
  KEY `FKnpt8s1eatagh08krq4dcbkf6m` (`account_id`),
  CONSTRAINT `FKnpt8s1eatagh08krq4dcbkf6m` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booklist`
--

LOCK TABLES `booklist` WRITE;
/*!40000 ALTER TABLE `booklist` DISABLE KEYS */;
INSERT INTO `booklist` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `booklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `feedback` text,
  `is_deleted` bit(1) NOT NULL,
  `account` int DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `FK5xv583hs3bapycoxtm93vs5y5` (`account`),
  CONSTRAINT `FK5xv583hs3bapycoxtm93vs5y5` FOREIGN KEY (`account`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Lit is so lit!',_binary '\0',3);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question_text` varchar(255) DEFAULT NULL,
  `quiz_quiz_id` int DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `FK3oxmcj03oyqwi1528c7k0f70f` (`quiz_quiz_id`),
  CONSTRAINT `FK3oxmcj03oyqwi1528c7k0f70f` FOREIGN KEY (`quiz_quiz_id`) REFERENCES `quiz` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'Sino ang unang nagtangkang hulihin ang Ibong Adarna?',1),(2,'Ano ang pangalan ng kaharian kung saan nangyari ang kuwento',1),(3,'Ano ang pangalan ng hari na nagkasakit at kailangan ng pagalingan ng Adarna?',1),(4,'Saan natagpuan ni Prinsipe Juan ang Ibong Adarna?',1),(5,'Paano natulog si Prinsipe Juan habang hinihintay niyang kumanta ang Adarna?',1);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_entity_answers`
--

DROP TABLE IF EXISTS `question_entity_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_entity_answers` (
  `question_entity_question_id` int NOT NULL,
  `answers` varchar(255) DEFAULT NULL,
  KEY `FKq6smfarp0g3hkt4yxtnn0n3ng` (`question_entity_question_id`),
  CONSTRAINT `FKq6smfarp0g3hkt4yxtnn0n3ng` FOREIGN KEY (`question_entity_question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_entity_answers`
--

LOCK TABLES `question_entity_answers` WRITE;
/*!40000 ALTER TABLE `question_entity_answers` DISABLE KEYS */;
INSERT INTO `question_entity_answers` VALUES (1,'Juan'),(2,'Berbanya'),(3,'Fernando'),(4,'Sa tuktok ng Bundok Tabor'),(5,'Nakahiga');
/*!40000 ALTER TABLE `question_entity_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_entity_choices`
--

DROP TABLE IF EXISTS `question_entity_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_entity_choices` (
  `question_entity_question_id` int NOT NULL,
  `choices` varchar(255) DEFAULT NULL,
  KEY `FK3kwp2pnvd5j94x7txd3nxmku9` (`question_entity_question_id`),
  CONSTRAINT `FK3kwp2pnvd5j94x7txd3nxmku9` FOREIGN KEY (`question_entity_question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_entity_choices`
--

LOCK TABLES `question_entity_choices` WRITE;
/*!40000 ALTER TABLE `question_entity_choices` DISABLE KEYS */;
INSERT INTO `question_entity_choices` VALUES (1,'Pedro'),(1,'Diego'),(1,'Juan'),(2,'Berbanya'),(2,'Encantadia'),(2,'Agrabah'),(3,'Agripa'),(3,'Fernando'),(3,'Amihan'),(4,'Sa isang puno ng mangga'),(4,'Sa tuktok ng Bundok Tabor'),(4,'Sa ilalim ng dagat'),(5,'Nakatayo'),(5,'Nakahiga'),(5,'Nakalutang sa ere');
/*!40000 ALTER TABLE `question_entity_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `quiz_id` int NOT NULL AUTO_INCREMENT,
  `perfect_score` int DEFAULT NULL,
  `quiz_name` varchar(255) DEFAULT NULL,
  `book_book_id` int DEFAULT NULL,
  PRIMARY KEY (`quiz_id`),
  KEY `FK3417cki4a83g5jel1wrs59796` (`book_book_id`),
  CONSTRAINT `FK3417cki4a83g5jel1wrs59796` FOREIGN KEY (`book_book_id`) REFERENCES `book` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,5,'Unang Kabanata',1);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answered_entity`
--

DROP TABLE IF EXISTS `quiz_answered_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_answered_entity` (
  `quiz_answered_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  PRIMARY KEY (`quiz_answered_id`),
  KEY `FKgekoy1o15nq8pxbrp3kxpvcp1` (`account_id`),
  CONSTRAINT `FKgekoy1o15nq8pxbrp3kxpvcp1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answered_entity`
--

LOCK TABLES `quiz_answered_entity` WRITE;
/*!40000 ALTER TABLE `quiz_answered_entity` DISABLE KEYS */;
INSERT INTO `quiz_answered_entity` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `quiz_answered_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_score_entity`
--

DROP TABLE IF EXISTS `quiz_score_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_score_entity` (
  `quiz_score_id` int NOT NULL AUTO_INCREMENT,
  `account_score` int NOT NULL,
  `quiz_id` int DEFAULT NULL,
  `quiz_answered_id` int DEFAULT NULL,
  PRIMARY KEY (`quiz_score_id`),
  KEY `FKavt4ut16oyrastip32lky1kc1` (`quiz_id`),
  KEY `FKmrixcbhfbe3k4ohtrq9nw153p` (`quiz_answered_id`),
  CONSTRAINT `FKavt4ut16oyrastip32lky1kc1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`),
  CONSTRAINT `FKmrixcbhfbe3k4ohtrq9nw153p` FOREIGN KEY (`quiz_answered_id`) REFERENCES `quiz_answered_entity` (`quiz_answered_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_score_entity`
--

LOCK TABLES `quiz_score_entity` WRITE;
/*!40000 ALTER TABLE `quiz_score_entity` DISABLE KEYS */;
INSERT INTO `quiz_score_entity` VALUES (1,1,1,3),(2,3,1,2);
/*!40000 ALTER TABLE `quiz_score_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `is_deleted` bit(1) NOT NULL,
  `report` text,
  `account` int DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `FKbjtx279g4x7mriyivun4eur8m` (`account`),
  CONSTRAINT `FKbjtx279g4x7mriyivun4eur8m` FOREIGN KEY (`account`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,_binary '\0','I found a bug...',3);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_description` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'able to read books','User'),(2,'able to create books','Author'),(3,'overseer','Admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription` (
  `subscription_id` int NOT NULL AUTO_INCREMENT,
  `cost` double DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `subscription_description` varchar(255) DEFAULT NULL,
  `subscription_duration` int DEFAULT NULL,
  `subscription_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `is_deleted` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,_binary '\0','pass123WORD!@#','Scar'),(2,_binary '\0','pass123WORD!@#','Scarr'),(3,_binary '\0','pass123WORD!@#','Scarrr'),(4,_binary '\0','pass123WORD!@#','Scarrrr'),(5,_binary '\0','pass123WORD!@#','Scarrrrr');
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

-- Dump completed on 2024-05-02 21:04:51
