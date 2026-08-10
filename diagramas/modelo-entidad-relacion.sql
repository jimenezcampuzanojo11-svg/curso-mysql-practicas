-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: repaso_de_todo
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id_empresa` smallint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ubicacion` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `año_inaguracion` year DEFAULT NULL,
  `dueño` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ganancias` int DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'Apple','California',1976,'Steve Jobs',96010000),(2,'Samsung','Suwon',1938,'Lee Byung-chull',65010000),(3,'Xiaomi','Pekín',2010,'Lei Jun',35010000),(4,'Huawei','Shenzhen',1987,'Ren Zhengfei',40010000),(5,'Motorola','Illinois',1928,'Paul Galvin',15010000),(6,'Oppo','Dongguan',2004,'Tony Chen',12010000),(7,'Vivo','Dongguan',2009,'Shen Wei',11010000),(8,'Sony','Tokio',1946,'Masaru Ibuka',25010000),(9,'Google','California',1998,'Larry Page',80010000),(10,'OnePlus','Shenzhen',2013,'Pete Lau',8010000);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_empresa`
--

DROP TABLE IF EXISTS `registro_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_empresa` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `tiempo` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `accion` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_empresa`
--

LOCK TABLES `registro_empresa` WRITE;
/*!40000 ALTER TABLE `registro_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono` (
  `id_telefono` smallint NOT NULL AUTO_INCREMENT,
  `id_fk` smallint DEFAULT NULL,
  `nombre_telefono` varchar(30) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `costo` smallint DEFAULT NULL,
  `usuarios` int DEFAULT NULL,
  `fecha_lanzamiento` date DEFAULT NULL,
  PRIMARY KEY (`id_telefono`),
  KEY `fk_id_fk` (`id_fk`),
  CONSTRAINT `fk_id_fk` FOREIGN KEY (`id_fk`) REFERENCES `empresas` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'repaso_de_todo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-15  0:13:20
