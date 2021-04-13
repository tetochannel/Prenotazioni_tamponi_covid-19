-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: prenotazioni_tampone_covid-19
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `prenotazioni`
--

DROP TABLE IF EXISTS `prenotazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prenotazioni` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codice_fiscale` varchar(16) NOT NULL,
  `giorno` date NOT NULL,
  `uid` varchar(56) NOT NULL,
  `annullata` tinyint(4) DEFAULT 0,
  `eseguita` tinyint(4) DEFAULT 0,
  `note` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazioni`
--

LOCK TABLES `prenotazioni` WRITE;
/*!40000 ALTER TABLE `prenotazioni` DISABLE KEYS */;
INSERT INTO `prenotazioni` VALUES (1,'5e7dtupciòvhk','2021-03-27','fb3547f7980d88eda520c289bb72c6eddafe0a70b7aa8c9db71dd432',1,0,NULL),(2,'5e7dtupciòvhk','2021-03-29','760894a84c7133339bc93614dcf8a294a29a5bfdc5ca3f5d9e45ce41',0,0,NULL),(3,'5e7dtupciòvhk','2021-03-28','c52831450838355ac80e7148c4f9a591ccbb797b05a65dca0eb87a1c',0,0,NULL),(4,'5e7dtupciòvhk','2021-03-28','73d577c365f8b5f90e3d57dd202ef06431c54df7babee0c539e9806d',0,0,NULL),(5,'5e7dtupciòvhk','2021-03-30','3cc31a6ab17b4788cc7593188fc8568fb0cd996cd4c71ff501bc76ab',0,0,NULL),(6,'5e7dtupciòvhk','2021-03-30','fb2365c0b4bccd7edf8d38a072d9b4ff5cc8c47c342a730950d2f28a',0,0,NULL),(7,'5e7dtupciòvhk','2021-03-31','883f026b218000c0f3bf278a534fce0fad4ac1864252f8cc306977f8',0,0,NULL),(8,'5e7dtupciòvhk','2021-03-29','020c5dcd139cab36c10fe05e7069c368f17490976a8fcd3ad8516fc2',0,0,NULL),(9,'5e7dtupciòvhk','2021-03-30','25ca529be4b7a5bd688aaf9443605f6497667646044bae60b801d623',0,0,NULL),(10,'5e7dtupciòvhk','2021-03-30','7e39518f6a27403a954d11e1b48c647968a760d45551c04bb9fbf5e7',0,0,NULL),(11,'5e7dtupciòvhk','2021-03-29','5fd9b9f06ee9c1068c0871b599086532f1ee4c23470569c72c07effb',0,0,NULL),(12,'5e7dtupciòvhk','2021-03-27','71cbd6be06ad0457578b1a797a698b9931be1c1eb28b56cef03531a0',0,0,NULL),(13,'d57t0c8pyvi','2021-03-30','13305d9ee53d7b628a4984e6d6c90d20e8c10712ce2b1569b448f2b9',0,0,NULL),(14,'5d7tupvyih','2021-03-31','c080932b18cc9753642c1a286b9811ce2421cb930b792e780d354956',0,0,NULL),(15,'d568fpyivò','2021-03-31','812241f54641ba238eac2356d93a4c3d6956d57bbea6965f2f9b2487',0,0,NULL),(16,'q','2021-04-14','a0453bbca662fac735179a4c41b25a7b879c1958e35ce71a1cd85bdb',0,0,NULL),(17,'yivlj','2021-04-14','798026b018c8af5c422b579155d36e3f6f29440749309d29d946b02d',0,0,NULL);
/*!40000 ALTER TABLE `prenotazioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utenti`
--

DROP TABLE IF EXISTS `utenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utenti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utenti`
--

LOCK TABLES `utenti` WRITE;
/*!40000 ALTER TABLE `utenti` DISABLE KEYS */;
INSERT INTO `utenti` VALUES (1,'q','$2y$10$rLsL7I0CG2sT4N5c5mKv/O7nlyWmdqW2x0Ca1FR1n6LnaCfaZ.KTu'),(2,'a','$2y$10$mXDo5xcFfbUOi/u1dnVLEOqqmpkwsnmgSjmzFCM6p.ZV8qwjnfRwi'),(3,'j','$2y$10$oFqZxfsMVE3B9Q5rv0.kzudMqyRd1mPlQWuljUm/Ws0HIIsvksCX6'),(4,'l','$2y$10$wbTtkL35hJ/xly0w5pd8Ru79mYctHrEHd6Fm6GoIlBRekgPyyiVom'),(5,'p','$2y$10$.6.n/LUOaD9E14jmHWicXuSWaM5VPockEHqkjlglpNWzYjTM0.fzG'),(6,'o','$2y$10$dQrVOvX/xZYV9Gs8FrbTROlnmJny15c3XcTTjcDIluWfGOYDcmIIO'),(7,'z','$2y$10$FE/OA9MVKRAIDHNU5vbQuuTydpulOuvMBiAxY3LN7jIt1zyTiXcf2'),(8,'ll','$2y$10$Fm18ydjubg4d.P3qv/6I.eC/VtoHr/HYl1MDpa4n6IAbG/xRBhWhG'),(9,'k','$2y$10$CgCM/V628vKXDcPoSU0E1uGjqCSwVYKrdLhZ1sZHmxL1RFFZHsdxO'),(10,'c','$2y$10$ydEtpBbdLXbTSO07qYHd9.g1gkVz.z7xH9rH4VrTjVmOLv5KIblBe');
/*!40000 ALTER TABLE `utenti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-13  2:06:25
