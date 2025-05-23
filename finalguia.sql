
CREATE DATABASE sistema_academico;
USE sistema_academico;

CREATE TABLE profesores (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    fecha_contratacion DATE
);

CREATE TABLE materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nombre_materia VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    creditos INT NOT NULL,
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor)
);

CREATE TABLE alumnos (
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    fecha_nacimiento DATE
);

-- Tabla adicional para clases (para el ejercicio complementario)
CREATE TABLE clases (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    id_materia INT NOT NULL,
    id_profesor INT NOT NULL,
    horario VARCHAR(50),
    aula VARCHAR(20),
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia),
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor)
);

CREATE TABLE notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT NOT NULL,
    id_clase INT NOT NULL,
    calificacion DECIMAL(5,2) CHECK (calificacion BETWEEN 0 AND 100),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (id_clase) REFERENCES clases(id_clase)
);


CREATE USER 'admin_procedimientos'@'localhost' IDENTIFIED BY 'aB3$kL9!pQrS';

CREATE USER 'consulta_ejecucion'@'localhost' IDENTIFIED BY 'Xk8@7mN#2qWz';


GRANT CREATE ROUTINE, ALTER ROUTINE, EXECUTE ON sistema_academico.* TO 'admin_procedimientos'@'localhost';

GRANT SELECT, EXECUTE ON sistema_academico.* TO 'consulta_ejecucion'@'localhost';

SHOW GRANTS FOR 'admin_procedimientos'@'localhost';
SHOW GRANTS FOR 'consulta_ejecucion'@'localhost';

CREATE PROCEDURE sp_insertar_alumno(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_fecha_nac DATE,
    OUT p_mensaje VARCHAR(200)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET p_mensaje = 'Error al insertar el alumno';
        ROLLBACK;
    END;
    
    START TRANSACTION;
    
    INSERT INTO alumnos (nombre, apellido, email, fecha_nacimiento)
    VALUES (p_nombre, p_apellido, p_email, p_fecha_nac);
    
    SET p_mensaje = CONCAT('Alumno ', p_nombre, ' ', p_apellido, ' insertado correctamente');
    
    COMMIT;
END;
CREATE PROCEDURE sp_insertar_clase(
    IN p_id_materia INT,
    IN p_id_profesor INT,
    IN p_horario VARCHAR(50),
    IN p_aula VARCHAR(20),
    OUT p_mensaje VARCHAR(200)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET p_mensaje = 'Error al insertar la clase';
        ROLLBACK;
    END;
    
    START TRANSACTION;
    
    INSERT INTO clases (id_materia, id_profesor, horario, aula)
    VALUES (p_id_materia, p_id_profesor, p_horario, p_aula);
    
    SET p_mensaje = CONCAT('Clase insertada correctamente con ID: ', LAST_INSERT_ID());
    
    COMMIT;
END;

CREATE PROCEDURE sp_insertar_nota(
    IN p_id_alumno INT,
    IN p_id_clase INT,
    IN p_calificacion DECIMAL(5,2),
    OUT p_mensaje VARCHAR(200)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET p_mensaje = 'Error al insertar la nota';
        ROLLBACK;
    END;
    
    -- Validar que la calificación esté en el rango correcto
    IF p_calificacion < 0 OR p_calificacion > 100 THEN
        SET p_mensaje = 'Error: La calificación debe estar entre 0 y 100';
    ELSE
        START TRANSACTION;
        
        INSERT INTO notas (id_alumno, id_clase, calificacion)
        VALUES (p_id_alumno, p_id_clase, p_calificacion);
        
        SET p_mensaje = CONCAT('Nota ', p_calificacion, ' insertada correctamente para el alumno ID: ', p_id_alumno);
        
        COMMIT;
    END IF;
END;