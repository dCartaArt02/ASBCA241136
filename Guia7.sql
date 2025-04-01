# ************************************************************
# Antares - SQL Client
# Version 0.7.34
# 
# https://antares-sql.app/
# https://github.com/antares-sql/antares
# 
# Host: 127.0.0.1 (MySQL Community Server - GPL 8.4.4)
# Database: maquinaria
# Generation time: 2025-04-01T00:14:23-06:00
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table bitacora
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bitacora`;

CREATE TABLE `bitacora` (
  `correlativo` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `COD_MAQUINA` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tiempouso` int DEFAULT NULL,
  `lugar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`correlativo`),
  KEY `COD_MAQUINA` (`COD_MAQUINA`),
  CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`COD_MAQUINA`) REFERENCES `maquina` (`COD_MAQUINA`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;

INSERT INTO `bitacora` (`correlativo`, `id`, `COD_MAQUINA`, `tiempouso`, `lugar`) VALUES
	(2, "12345678-9", "m00001", 250, "SANTIAGO NONUALCO"),
	(3, "01234567-8", "M00002", 300, "SANTIAGO NONUALCO"),
	(4, "90123456-7", "M00003", 500, "ALEGIRA USULUTAN"),
	(5, "89012345-6", "M00004", 300, "ALEGRIA USULUTAN"),
	(6, "90123456-7", "M00005", 250, "SANTIAGO NONUALCO"),
	(7, "01234567-8", "M00002", 125, "SANTIAGO NONUALCO"),
	(8, "12345678-9", "M00003", 375, "ALEGRIA USULUTAN"),
	(9, "12345678-9", "M00004", 200, "ALEGRIA USULUTAN");

/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table empleado
# ------------------------------------------------------------

DROP TABLE IF EXISTS `empleado`;

CREATE TABLE `empleado` (
  `id` int NOT NULL,
  `nombres` varchar(20) DEFAULT NULL,
  `apellidos` varchar(20) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `fechainicio` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;

INSERT INTO `empleado` (`id`, `nombres`, `apellidos`, `edad`, `fechainicio`) VALUES
	(1234559, "CARLOS FIDEL", "ARGUETA MIRANDA", 45, "2006-08-21"),
	(12345669, "JUAN FRNACISCO", "VILLALTA ALVARADO", 32, "2010-02-27"),
	(78901229, "RAUL ALEJANDRO", "PONCIO VALLADARES", 32, "2010-02-27"),
	(89012339, "MIGUEL EDUARDO", "MORALES CLAROS", 26, "2010-08-21"),
	(90123449, "FABRICIO DAVID", "ALAS FLORES", 30, "2008-12-01");

/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table maquina
# ------------------------------------------------------------

DROP TABLE IF EXISTS `maquina`;

CREATE TABLE `maquina` (
  `COD_MAQUINA` varchar(10) NOT NULL,
  `descripcion` text,
  `marca` varchar(20) DEFAULT NULL,
  `modelo` varchar(20) DEFAULT NULL,
  `fechaingreso` date DEFAULT NULL,
  PRIMARY KEY (`COD_MAQUINA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `maquina` WRITE;
/*!40000 ALTER TABLE `maquina` DISABLE KEYS */;

INSERT INTO `maquina` (`COD_MAQUINA`, `descripcion`, `marca`, `modelo`, `fechaingreso`) VALUES
	("M00001", "TALADORA DE ELEMENTOS VARIOS", "CATERPILLAR", "EVO2000", "2006-01-31"),
	("M00002", "APLANADORA DE SUELO Y OTROS", "CATERPILLAR", "FLU500", "2006-01-31"),
	("M00003", "PULVERIZADORA DE ELEMENTOS", "CATERPILLAR", "ASD2001", "2006-01-31"),
	("M00004", "CONCRETERA", "MG", "EDS", "2006-05-31"),
	("M00005", "MAQUINA ESPECIAL PARA PROYECTO 10", "MG", "SFD", "2006-05-31"),
	("M00006", "MAQUINA ESPECIAL PARA PROYECTO 30", "MG", "SFD", "2010-12-01");

/*!40000 ALTER TABLE `maquina` ENABLE KEYS */;
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

# Dump completed on 2025-04-01T00:14:24-06:00
