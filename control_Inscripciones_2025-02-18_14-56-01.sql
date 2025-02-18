# ************************************************************
# Antares - SQL Client
# Version 0.7.34
# 
# https://antares-sql.app/
# https://github.com/antares-sql/antares
# 
# Host: 127.0.0.1 (MySQL Community Server - GPL 8.4.4)
# Database: control_Inscripciones
# Generation time: 2025-02-18T14:56:07-06:00
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table alumno
# ------------------------------------------------------------

DROP TABLE IF EXISTS `alumno`;

CREATE TABLE `alumno` (
  `carnet` char(9) DEFAULT NULL,
  `nombres` varchar(20) DEFAULT NULL,
  `Apellidos` varchar(20) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` char(8) DEFAULT NULL,
  `fecha_nacimiento` char(8) DEFAULT NULL,
  UNIQUE KEY `carnet` (`carnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;

INSERT INTO `alumno` (`carnet`, `nombres`, `Apellidos`, `direccion`, `correo`, `telefono`, `fecha_nacimiento`) VALUES
	("op123456", "Juanito", "ramirez", "zacatecas", "llll@alumno.com", "12093456", "12032004");

/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table inscripcion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inscripcion`;

CREATE TABLE `inscripcion` (
  `codgio_materia` varchar(10) DEFAULT NULL,
  `carnet` varchar(9) DEFAULT NULL,
  `matricula` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





# Dump of table materia
# ------------------------------------------------------------

DROP TABLE IF EXISTS `materia`;

CREATE TABLE `materia` (
  `id` int NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `uv` char(2) DEFAULT NULL,
  `prerequisitos` varchar(50) DEFAULT NULL,
  `ciclo` char(2) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
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

# Dump completed on 2025-02-18T14:56:07-06:00
