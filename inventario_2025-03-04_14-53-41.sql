# ************************************************************
# Antares - SQL Client
# Version 0.7.34
# 
# https://antares-sql.app/
# https://github.com/antares-sql/antares
# 
# Host: 127.0.0.1 (MySQL Community Server - GPL 8.4.4)
# Database: inventario
# Generation time: 2025-03-04T14:53:51-06:00
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table CLIENTE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENTE`;

CREATE TABLE `CLIENTE` (
  `dui` varchar(10) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dui`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `CLIENTE` WRITE;
/*!40000 ALTER TABLE `CLIENTE` DISABLE KEYS */;

INSERT INTO `CLIENTE` (`dui`, `nombre`, `direccion`) VALUES
	("61310055", "Ivo Robotnik", "Eggman Empiere"),
	("686546671", "Ryan Ghoslyn", "Estados Unidos"),
	("741284361", "Luis Cartagena", "San Jose Guayabal, Cuscatlan");

/*!40000 ALTER TABLE `CLIENTE` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table PRODUCTO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PRODUCTO`;

CREATE TABLE `PRODUCTO` (
  `codigo` char(5) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `precio` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `PRODUCTO` WRITE;
/*!40000 ALTER TABLE `PRODUCTO` DISABLE KEYS */;

INSERT INTO `PRODUCTO` (`codigo`, `descripcion`, `precio`) VALUES
	("10825", "Una bigmac", "5.00"),
	("14796", "Una refrescante bebida energetica ", "2.00"),
	("90085", "Un gansito de marinela", "1.00");

/*!40000 ALTER TABLE `PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table compra
# ------------------------------------------------------------

DROP TABLE IF EXISTS `compra`;

CREATE TABLE `compra` (
  `valor` varchar(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;

INSERT INTO `compra` (`valor`, `fecha`) VALUES
	("2.00", "2025-03-02"),
	("5.00", "2024-01-20"),
	("1.00", "2025-09-10");

/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of views
# ------------------------------------------------------------

# Creating temporary tables to overcome VIEW dependency errors


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# Dump completed on 2025-03-04T14:53:51-06:00
