# ************************************************************
# Antares - SQL Client
# Version 0.7.34
# 
# https://antares-sql.app/
# https://github.com/antares-sql/antares
# 
# Host: 127.0.0.1 (MySQL Community Server - GPL 8.4.4)
# Database: GESTION_LIBROS
# Generation time: 2025-03-04T14:53:22-06:00
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table AUTOR
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AUTOR`;

CREATE TABLE `AUTOR` (
  `codigo_autor` char(5) NOT NULL,
  `primer_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `AUTOR` WRITE;
/*!40000 ALTER TABLE `AUTOR` DISABLE KEYS */;

INSERT INTO `AUTOR` (`codigo_autor`, `primer_nombre`, `primer_apellido`, `fecha_nacimiento`, `nacionalidad`) VALUES
	("ASB01", "MIGUEL", "MELENDEZ", "2025-03-04", "EL SALVADOR"),
	("ASB02", "ALEJANDRO", "MELENDEZ", "2025-03-07", "EL SALVADOR");

/*!40000 ALTER TABLE `AUTOR` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table DETALLE_AUTOR_LIBRO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DETALLE_AUTOR_LIBRO`;

CREATE TABLE `DETALLE_AUTOR_LIBRO` (
  `codigo_autor` char(5) NOT NULL,
  `codigo_libro` char(10) NOT NULL,
  PRIMARY KEY (`codigo_autor`,`codigo_libro`),
  KEY `codigo_libro` (`codigo_libro`),
  CONSTRAINT `DETALLE_AUTOR_LIBRO_ibfk_1` FOREIGN KEY (`codigo_autor`) REFERENCES `AUTOR` (`codigo_autor`),
  CONSTRAINT `DETALLE_AUTOR_LIBRO_ibfk_2` FOREIGN KEY (`codigo_libro`) REFERENCES `LIBROS` (`codigo_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





# Dump of table EDITORIAL
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EDITORIAL`;

CREATE TABLE `EDITORIAL` (
  `codigo_editorial` char(5) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_editorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `EDITORIAL` WRITE;
/*!40000 ALTER TABLE `EDITORIAL` DISABLE KEYS */;

INSERT INTO `EDITORIAL` (`codigo_editorial`, `nombre`, `pais`) VALUES
	("1", "2", "3");

/*!40000 ALTER TABLE `EDITORIAL` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table LIBROS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LIBROS`;

CREATE TABLE `LIBROS` (
  `codigo_libro` char(10) NOT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `edicion` char(4) DEFAULT NULL,
  `codigo_editorial` char(5) DEFAULT NULL,
  PRIMARY KEY (`codigo_libro`),
  KEY `codigo_editorial` (`codigo_editorial`),
  CONSTRAINT `LIBROS_ibfk_1` FOREIGN KEY (`codigo_editorial`) REFERENCES `EDITORIAL` (`codigo_editorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





# Dump of views
# ------------------------------------------------------------

# Creating temporary tables to overcome VIEW dependency errors


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# Dump completed on 2025-03-04T14:53:22-06:00
