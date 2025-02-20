# ************************************************************
# Antares - SQL Client
# Version 0.7.34
# 
# https://antares-sql.app/
# https://github.com/antares-sql/antares
# 
# Host: 127.0.0.1 (MySQL Community Server - GPL 8.4.4)
# Database: Hotel_suCarnet
# Generation time: 2025-02-19T23:38:09-06:00
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Reservacion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Reservacion`;

CREATE TABLE `Reservacion` (
  `CodigoReserva` varchar(9) DEFAULT NULL,
  `CodigoHotel` varchar(9) DEFAULT NULL,
  `CodigoHuesped` varchar(9) DEFAULT NULL,
  `CodigoHabitacion` varchar(10) DEFAULT NULL,
  `fechainicio` timestamp NULL DEFAULT NULL,
  `fechafin` timestamp NULL DEFAULT NULL,
  CONSTRAINT `CHCK_Reservacion` CHECK ((`fechafin` > `fechainicio`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





# Dump of table habitacion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `habitacion`;

CREATE TABLE `habitacion` (
  `CodigoHabitacion` varchar(10) DEFAULT NULL,
  `CodigoHotel` varchar(10) DEFAULT NULL,
  `tipo` char(2) DEFAULT NULL,
  `Precio` varchar(5) DEFAULT NULL,
  CONSTRAINT `check_habitacion` CHECK ((`Precio` > 25))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





# Dump of table hotel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hotel`;

CREATE TABLE `hotel` (
  `codigoHotel` varchar(9) DEFAULT NULL,
  `Nombre` varchar(10) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `sitioweb` varchar(50) DEFAULT NULL,
  UNIQUE KEY `Nombre` (`Nombre`),
  UNIQUE KEY `sitioweb` (`sitioweb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





# Dump of table huesped
# ------------------------------------------------------------

DROP TABLE IF EXISTS `huesped`;

CREATE TABLE `huesped` (
  `CodigoHuesped` varchar(9) DEFAULT NULL,
  `nombre` varchar(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Telefono` varchar(8) DEFAULT NULL,
  UNIQUE KEY `email` (`email`)
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

# Dump completed on 2025-02-19T23:38:09-06:00
