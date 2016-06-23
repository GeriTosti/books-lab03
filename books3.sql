-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: books
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Current Database: `books`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `books` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `books`;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `AuthorsID` int(11) NOT NULL AUTO_INCREMENT,
  `AuthorsFirstName` varchar(255) DEFAULT NULL,
  `AuthorsLastName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AuthorsID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'KRISTEN ','HANNAH'),(2,'LISA ','GENOVA'),(3,'KELLY ','PARSONS'),(4,'WALLY ','LAMB'),(5,'ELIE ','WIESEL'),(6,'JANET','FITCH');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `booksID` int(11) NOT NULL AUTO_INCREMENT,
  `booksName` varchar(255) DEFAULT NULL,
  `booksType` varchar(25) DEFAULT NULL,
  `AuthorsID` int(11) DEFAULT NULL,
  PRIMARY KEY (`booksID`),
  KEY `AuthorsID` (`AuthorsID`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`AuthorsID`) REFERENCES `authors` (`AuthorsID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'FIREFLY LANE','NOVEL',1),(2,'STILL ALICE','DRAMA',2),(3,'DOING HARM','NOVEL',3);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost`
--

DROP TABLE IF EXISTS `cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost` (
  `costID` int(11) NOT NULL AUTO_INCREMENT,
  `BooksName` varchar(255) DEFAULT NULL,
  `BooksType` varchar(255) DEFAULT NULL,
  `AuthorsID` varchar(255) DEFAULT NULL,
  `AuthorsFirstName` varchar(255) DEFAULT NULL,
  `AuthorsLastName` varchar(255) DEFAULT NULL,
  `InventoryStock` varchar(255) DEFAULT NULL,
  `CostPurchase` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`costID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost`
--

LOCK TABLES `cost` WRITE;
/*!40000 ALTER TABLE `cost` DISABLE KEYS */;
INSERT INTO `cost` VALUES (1,'FIREFLY LANE','NOVEL','1','KRISTEN','HANNAH','12','20'),(2,'STILL ALICE','DRAMA','2','LISA','GENOVA','7','10'),(3,'DOING HARM','NOVEL','3','KELLY','PARSONS','102','15');
/*!40000 ALTER TABLE `cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `inventoryID` int(11) NOT NULL AUTO_INCREMENT,
  `booksID` int(11) DEFAULT NULL,
  `storeID` int(11) DEFAULT NULL,
  `inventoryStock` int(11) DEFAULT NULL,
  PRIMARY KEY (`inventoryID`),
  KEY `booksID` (`booksID`),
  KEY `storeID` (`storeID`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`booksID`) REFERENCES `books` (`booksID`),
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`storeID`) REFERENCES `stores` (`storeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,1,12),(2,2,2,10),(3,3,3,6);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `storeID` int(11) NOT NULL AUTO_INCREMENT,
  `storeName` varchar(50) DEFAULT NULL,
  `storeType` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`storeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Amazon','Online'),(2,'Barnes & Noble','Store/Online'),(3,'2nd Chance Books','Store');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-23 16:11:02
