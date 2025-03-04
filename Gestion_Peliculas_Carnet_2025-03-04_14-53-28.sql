# ************************************************************
# Antares - SQL Client
# Version 0.7.34
# 
# https://antares-sql.app/
# https://github.com/antares-sql/antares
# 
# Host: 127.0.0.1 (MySQL Community Server - GPL 8.4.4)
# Database: Gestion_Peliculas_Carnet
# Generation time: 2025-03-04T14:53:36-06:00
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ACTOR
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACTOR`;

CREATE TABLE `ACTOR` (
  `codigo_actor` char(5) NOT NULL,
  `primer_nombre` varchar(20) DEFAULT NULL,
  `segundo_nombre` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` varchar(8) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_actor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `ACTOR` WRITE;
/*!40000 ALTER TABLE `ACTOR` DISABLE KEYS */;

INSERT INTO `ACTOR` (`codigo_actor`, `primer_nombre`, `segundo_nombre`, `fecha_nacimiento`, `telefono`, `email`) VALUES
	("Jim01", "Jim", "Carrey", "1962-01-17", "09876543", "jimcarryinc@gmail.com"),
	("Joh03", "Johnny", "Depp", "1963-06-09", "12340987", "jhonyydeepinc@gmail.com"),
	("knR02", "Keanu ", "Reeves", "1962-11-02", "87896754", "kenaureveinc@gmail.com");

/*!40000 ALTER TABLE `ACTOR` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table ESTUDIO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ESTUDIO`;

CREATE TABLE `ESTUDIO` (
  `codigo_Estudio` char(5) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `pais` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo_Estudio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `ESTUDIO` WRITE;
/*!40000 ALTER TABLE `ESTUDIO` DISABLE KEYS */;

INSERT INTO `ESTUDIO` (`codigo_Estudio`, `nombre`, `domicilio`, `direccion`, `ciudad`, `pais`) VALUES
	("Drm02", "Dreamworks", "Universal City", "Universal City, California,Estados Unidos", "California", "Estados Unidos"),
	("Ghil1", "Estudio Ghilbi", "Shibuya, Tokyo, Japon", "Shibuya", "tokyo", "Japon"),
	("mdh03", "MadHouse", "Nakano", "Nakano, Tokyo, Japon", "Tokyo", "Japon");

/*!40000 ALTER TABLE `ESTUDIO` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table Pelicula
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Pelicula`;

CREATE TABLE `Pelicula` (
  `codigo_pelicula` char(5) NOT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_pelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `Pelicula` WRITE;
/*!40000 ALTER TABLE `Pelicula` DISABLE KEYS */;

INSERT INTO `Pelicula` (`codigo_pelicula`, `titulo`, `direccion`) VALUES
	("fox01", "Mr Fantastic Fox ", "Reino Unido"),
	("scot0", "Scott Pilgrim Vs The World", "Estados Unidos"),
	("sos3", "Sonic 3", "Tokyo");

/*!40000 ALTER TABLE `Pelicula` ENABLE KEYS */;
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

# Dump completed on 2025-03-04T14:53:36-06:00
