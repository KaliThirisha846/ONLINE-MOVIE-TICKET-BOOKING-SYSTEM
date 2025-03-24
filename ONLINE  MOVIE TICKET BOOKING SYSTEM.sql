CREATE DATABASE  IF NOT EXISTS `movie_ticket_booking_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `movie_ticket_booking_system`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: movie_ticket_booking_system
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `seats_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `fk_cust_id` (`customer_id`),
  KEY `fk_mov_id` (`movie_id`),
  CONSTRAINT `fk_cust_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `fk_mov_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,21,1,'2025-03-20','Confirmed'),(3,23,5,'2025-03-22','Cancelled'),(4,24,3,'2025-03-23','Confirmed'),(5,23,1,'2025-03-24','Pending'),(6,22,8,'2025-03-25','Confirmed'),(7,24,5,'2025-03-26','Cancelled'),(8,25,9,'2025-03-27','Confirmed'),(9,25,10,'2025-03-28','Pending'),(11,29,11,'2025-03-30','Cancelled'),(12,26,12,'2025-03-31','Confirmed'),(13,27,13,'2025-04-01','Pending'),(14,28,14,'2025-04-02','Confirmed'),(15,29,15,'2025-04-03','Cancelled'),(16,30,11,'2025-04-04','Pending'),(17,21,1,'2025-04-05','Confirmed'),(18,28,2,'2025-04-06','Cancelled'),(19,29,3,'2025-04-07','Pending'),(20,23,4,'2025-04-08','Confirmed');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `confirm_lists`
--

DROP TABLE IF EXISTS `confirm_lists`;
/*!50001 DROP VIEW IF EXISTS `confirm_lists`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `confirm_lists` AS SELECT 
 1 AS `booking_id`,
 1 AS `customer_id`,
 1 AS `movie_id`,
 1 AS `seats_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (21,'Alice','Johnson','alice.johnson@example.com','9876543210'),(22,'Michael','Smith','michael.smith@example.com','8765432109'),(23,'Emily','Davis','emily.davis@example.com','7654321098'),(24,'David','Brown','david.brown@example.com','6543210987'),(25,'Sophia','Wilson','sophia.wilson@example.com','5432109876'),(26,'James','Taylor','james.taylor@example.com','4321098765'),(27,'Olivia','Anderson','olivia.anderson@example.com','3210987654'),(28,'William','Martinez','william.martinez@example.com','2109876543'),(29,'Emma','Garcia','emma.garcia@example.com','1098765432'),(30,'Daniel','Lopez','daniel.lopez@example.com','0987654321');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `movie_id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'The Godfather','Crime','English','1972-03-24'),(2,'Interstellar','Sci-Fi','English','2014-11-07'),(3,'Spirited Away','Animation','Japanese','2001-07-20'),(4,'The Dark Knight','Action','English','2008-07-18'),(5,'Forrest Gump','Drama','English','1994-07-06'),(6,'Amélie','Romance','French','2001-04-25'),(7,'The Shawshank Redemption','Drama','English','1994-09-22'),(8,'Parasite','Thriller','Korean','2019-05-30'),(9,'Coco','Animation','Spanish','2017-10-27'),(10,'Avengers: Endgame','Superhero','English','2019-04-26'),(11,'Joker','Drama','English','2019-10-04'),(12,'The Matrix','Sci-Fi','English','1999-03-31'),(13,'Pulp Fiction','Crime','English','1994-10-14'),(14,'The Lion King','Animation','English','1994-06-24'),(15,'Life is Beautiful','Comedy','Italian','1997-12-20');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `email_id` (`email_id`),
  KEY `fk_custom_id` (`customer_id`),
  CONSTRAINT `fk_custom_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,21,'John','Doe','john.doe@example.com','123-456-7890','Credit Card'),(2,22,'Jane','Smith','jane.smith@example.com','987-654-3210','PayPal'),(3,23,'Mike','Johnson','mike.johnson@example.com','555-123-4567','Bank Transfer'),(4,26,'Emily','Davis','emily.davis@example.com','444-222-1111','Credit Card'),(5,24,'Robert','Brown','robert.brown@example.com','777-888-9999','Debit Card'),(6,26,'Sarah','Wilson','sarah.wilson@example.com','333-666-5555','Cash'),(7,27,'David','Martinez','david.martinez@example.com','111-222-3333','PayPal'),(8,21,'Laura','Anderson','laura.anderson@example.com','999-777-6666','Bank Transfer'),(9,29,'James','Taylor','james.taylor@example.com','222-333-4444','Credit Card'),(10,28,'Sophia','Harris','sophia.harris@example.com','666-555-4444','Debit Card');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rls_dts`
--

DROP TABLE IF EXISTS `rls_dts`;
/*!50001 DROP VIEW IF EXISTS `rls_dts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rls_dts` AS SELECT 
 1 AS `movie_id`,
 1 AS `title`,
 1 AS `release_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `seat_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `theater_id` int DEFAULT NULL,
  `seat_number` varchar(10) DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  PRIMARY KEY (`seat_id`),
  KEY `fk_custmr_id` (`customer_id`),
  KEY `fk_thtr_id` (`theater_id`),
  KEY `fk_movi_id` (`movie_id`),
  CONSTRAINT `fk_custmr_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `fk_movi_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `fk_thtr_id` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`theater_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (1,28,11,'A1',11),(2,21,15,'A2',5),(3,23,12,'A3',2),(4,24,14,'B1',12),(5,26,9,'B2',4),(6,28,8,'C1',5),(7,22,3,'C2',1),(8,26,1,'D1',9),(9,25,4,'D2',7),(10,29,5,'E1',8),(11,27,2,'E2',11),(12,29,3,'F1',13),(13,30,8,'F2',15),(14,22,7,'G1',2),(15,25,6,'G2',3);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows` (
  `show_id` int NOT NULL,
  `movie_id` int DEFAULT NULL,
  `theater_id` int DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `show_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`show_id`),
  KEY `fk_mv_id` (`movie_id`),
  KEY `fk_tht_id` (`theater_id`),
  CONSTRAINT `fk_mv_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `fk_tht_id` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`theater_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES (1,3,1,'2025-03-21','14:00:00'),(2,2,4,'2025-03-21','17:00:00'),(3,11,2,'2025-03-22','19:30:00'),(4,12,2,'2025-03-22','21:00:00'),(5,2,7,'2025-03-23','13:00:00'),(6,2,12,'2025-03-23','15:30:00'),(7,1,5,'2025-03-24','18:45:00'),(8,15,8,'2025-03-24','20:15:00'),(9,9,10,'2025-03-25','16:00:00'),(10,13,13,'2025-03-25','19:00:00');
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theaters`
--

DROP TABLE IF EXISTS `theaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theaters` (
  `theater_id` int NOT NULL AUTO_INCREMENT,
  `theater_name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`theater_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theaters`
--

LOCK TABLES `theaters` WRITE;
/*!40000 ALTER TABLE `theaters` DISABLE KEYS */;
INSERT INTO `theaters` VALUES (1,'Grand Cinema','New York'),(2,'Sunset Theater','Los Angeles'),(3,'Ocean View Multiplex','Miami'),(4,'Starlight Cinemas','Chicago'),(5,'Regal Plaza','Houston'),(6,'Broadway Theater','San Francisco'),(7,'Skyline Cinemas','Seattle'),(8,'Moonlight Movies','Las Vegas'),(9,'Empire Theaters','Boston'),(10,'Silver Screen Cineplex','Denver'),(11,'CineMax Stadium','Atlanta'),(12,'Metro Movies','Dallas'),(13,'Hollywood Premiere','Orlando'),(14,'Majestic Cinemas','Philadelphia'),(15,'Pinewood Theater','Phoenix');
/*!40000 ALTER TABLE `theaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'movie_ticket_booking_system'
--

--
-- Dumping routines for database 'movie_ticket_booking_system'
--
/*!50003 DROP PROCEDURE IF EXISTS `available_movies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `available_movies`()
begin
select movie_id,title,genre,language,release_date
from movies
where release_date <=curdate();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `available_show` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `available_show`()
begin
select * from shows
where theater_id=2  AND show_date='2025-03-22';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bkgs_sts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bkgs_sts`( )
begin
select booking_id,customer_id,movie_id,seats_status
from bookings
where seats_status='confirmed'
UNION ALL 
select booking_id,customer_id,movie_id,seats_status
from bookings
where seats_status='pendings';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancel_bkg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancel_bkg`(IN num INT )
begin
delete from bookings where booking_id=num;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `movi_types` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `movi_types`()
begin 
select * from movies
where title like ' %avengers%' or genre= 'action';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mov_relsz_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mov_relsz_date`()
begin
select * from movies
where genre= 'Animation' ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `seat_sts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `seat_sts`()
begin
select * from bookings
where seats_status='cancelled';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `confirm_lists`
--

/*!50001 DROP VIEW IF EXISTS `confirm_lists`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `confirm_lists` AS select `bookings`.`booking_id` AS `booking_id`,`bookings`.`customer_id` AS `customer_id`,`bookings`.`movie_id` AS `movie_id`,`bookings`.`seats_status` AS `seats_status` from `bookings` where (`bookings`.`seats_status` = 'confirmed') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rls_dts`
--

/*!50001 DROP VIEW IF EXISTS `rls_dts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rls_dts` AS select `movies`.`movie_id` AS `movie_id`,`movies`.`title` AS `title`,`movies`.`release_date` AS `release_date` from `movies` where (`movies`.`release_date` between '1994-09-22' and '2014-11-07') */;
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

-- Dump completed on 2025-03-24  4:05:31
