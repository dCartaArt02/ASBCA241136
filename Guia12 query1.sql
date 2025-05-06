CREATE DATABASE seguridad_bd;

CREATE TABLE alumnos (
id_alumno INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
correo VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE clases (
id_clase INT AUTO_INCREMENT PRIMARY KEY,
nombre_clase VARCHAR(100) NOT NULL
);

CREATE TABLE notas (
id_nota INT AUTO_INCREMENT PRIMARY KEY,
id_alumno INT,
id_clase INT,
nota DECIMAL(5,2),
FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
FOREIGN KEY (id_clase) REFERENCES clases(id_clase)
);

CREATE USER 'creador_proc'@'192.168.179.193' IDENTIFIED BY 'Ca241136.';

GRANT CREATE ROUTINE ON seguridad_bd.* TO 'creador_proc'@'192.168.179.193';
GRANT SELECT ON seguridad_bd.* TO 'creador_proc'@'192.168.179.193';

FLUSH PRIVILEGES;

CREATE USER 'ejecutor_proc'@'192.168.179.193' IDENTIFIED BY 'Ac241136.';

GRANT EXECUTE ON seguridad_bd.* TO 'ejecutor_proc'@'192.168.179.193';

GRANT SELECT ON seguridad_bd.* TO 'ejecutor_proc'@'192.168.179.193';

GRANT insert on seguridad_bd.* to 'creador_proc'@'192.168.179.193';

FLUSH PRIVILEGES;





