# ************************************************************
# Antares - SQL Client
# Version 0.7.34
# 
# https://antares-sql.app/
# https://github.com/antares-sql/antares
# 
# Host: 127.0.0.1 (MySQL Community Server - GPL 8.4.4)
# Database: Modelo
# Generation time: 2025-03-16T15:48:08-06:00
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Auto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Auto`;

CREATE TABLE `Auto` (
  `NumPlca` varchar(10) DEFAULT NULL,
  `Marca` varchar(10) DEFAULT NULL,
  `Modelo` varchar(20) DEFAULT NULL,
  `Observaciones` char(100) DEFAULT NULL,
  `IdAuto` varchar(8) NOT NULL,
  PRIMARY KEY (`IdAuto`),
  UNIQUE KEY `IdAuto` (`IdAuto`),
  UNIQUE KEY `NumPlca` (`NumPlca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `Auto` WRITE;
/*!40000 ALTER TABLE `Auto` DISABLE KEYS */;

INSERT INTO `Auto` (`NumPlca`, `Marca`, `Modelo`, `Observaciones`, `IdAuto`) VALUES
	("ABC-1234", "\tToyota", "Corolla", "En buen estado, sin detalles.", "1"),
	("YZA-3242", "Renault", "Duster", "Frenos recién revisados.", "10"),
	("XYZ-5678", "Honda", "\tCivic", "Requiere cambio de aceite.", "2"),
	("DEF-9101", "Ford", "Mustang", "Llantas nuevas, motor en óptimas condiciones.", "3"),
	("GHI-1121", "Chevrolet", "Spark", "Rayón en puerta derecha.", "4"),
	("JKL-3141", "Nissan", "Sentra", "Recién pintado, sin fallas.", "5"),
	("MNO-5161", "Volkswagen", "Golf", "Aire acondicionado no funciona.", "6"),
	("PQR-7181", "Hyundai", "Tucson", "Buen estado general.", "7"),
	("STU-9202", "Kia", "Rio", "Necesita alineación y balanceo.", "8"),
	("VWX-1222", "Mazda", "CX-5", "Sin observaciones.", "9");

/*!40000 ALTER TABLE `Auto` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table Cliente
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Cliente`;

CREATE TABLE `Cliente` (
  `IdCliente` varchar(20) NOT NULL,
  `Telefono` varchar(8) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `PrimerNombre` varchar(20) DEFAULT NULL,
  `SegundoNombre` varchar(20) DEFAULT NULL,
  `PrimerApellido` varchar(20) DEFAULT NULL,
  `SegundoApellido` varchar(20) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Num_casa` varchar(10) DEFAULT NULL,
  `Colonia_pasaje` varchar(20) DEFAULT NULL,
  `Ciudad` varchar(20) DEFAULT NULL,
  `Departamento` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`IdCliente`),
  UNIQUE KEY `IdCliente` (`IdCliente`),
  UNIQUE KEY `Num_casa` (`Num_casa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;

INSERT INTO `Cliente` (`IdCliente`, `Telefono`, `Email`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `Direccion`, `Num_casa`, `Colonia_pasaje`, `Ciudad`, `Departamento`) VALUES
	("as1234", "66660000", "DiegoR@gmail.com", "Diego", NULL, "Ramirez", NULL, "5thavenue de rivoli", "34", "Paris", "Francia", "Francia"),
	("CA0123", NULL, NULL, "Jose", NULL, "Perez", NULL, NULL, NULL, NULL, NULL, NULL),
	("IC0712", "12345678", "CarlosL@gmail.com", "Carlos", NULL, "Lopez", NULL, "Avenida Corrientes", "459", "Colonia buena vibra", "nuevo", "Cuscatlan"),
	("MI911", "6789543", "MidoriA@gmail.com", "Sofia", NULL, "Sanchez", NULL, "Rua das flores", "78", "Colonia Centro", "Sao Paulo", "Brazil"),
	("OC0212", "88888888", "elenaD@gmail.com", "Elena", NULL, "Diaz", NULL, "Calle Revacholian", "1234", "Colonia san Pablo", "Soyapango", "SnSalvador"),
	("OC0912", "12370987", "MariaG@gmail.com", "Maria", NULL, "Gonzales", NULL, "Calle Libertad", "123", "Colonia Centro", "Soyapango", "Cuscatlan"),
	("oq1234", "89765431", "AnaM@gmail.com", "Ana", NULL, "Martinez", NULL, "carretera 7", "#22", "Colonia evangelion", "mejicanos", "SnSalvador"),
	("OT1239", "55550000", "omt@gmail.com", "Jorge", NULL, "Gomez", NULL, "Paseo de reforma", "890", "Colonia Pipzas", "Soyapango", "Cuscatlan"),
	("RV1293", "11113333", "LauraF@gmail.com", "Laura", NULL, "Fernandez", NULL, "Oxford Street", "56", "Martinece", "Soyapango", "Revachol"),
	("UA8912", "33336666", "LuisR@gmail.com", "Luis", NULL, "Rodriguez", NULL, "Calle Libertad", "125", "Colonia Centro", "Soyapango", "Cuscatlan");

/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table Reserva
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Reserva`;

CREATE TABLE `Reserva` (
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `IdReserva` varchar(8) NOT NULL,
  PRIMARY KEY (`IdReserva`),
  UNIQUE KEY `IdReserva` (`IdReserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `Reserva` WRITE;
/*!40000 ALTER TABLE `Reserva` DISABLE KEYS */;

INSERT INTO `Reserva` (`FechaInicio`, `FechaFin`, `IdReserva`) VALUES
	("2023-01-01", "2023-01-15", "1"),
	("2023-11-05", "2023-11-20", "10"),
	("2023-02-10", "2023-02-25", "2"),
	("2024-03-05", "2023-03-20", "3"),
	("2023-04-12", "2023-04-27", "4"),
	("2023-05-18", "2023-06-02", "5"),
	("2023-06-22", "2023-07-07", "6"),
	("2023-08-03", "2023-08-18", "7"),
	("2023-09-14", "2023-09-12", "8"),
	("2023-10-10", "2023-10-25", "9");

/*!40000 ALTER TABLE `Reserva` ENABLE KEYS */;
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

# Dump completed on 2025-03-16T15:48:08-06:00
