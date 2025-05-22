CREATE DATABASE clinica;

CREATE TABLE pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    fecha_nacimiento DATE NOT NULL,
    direccion VARCHAR(200),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    fecha_contratacion DATE NOT NULL
);

CREATE TABLE citas (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    estado ENUM('programada', 'completada', 'cancelada', 'no_asistio') DEFAULT 'programada',
    motivo VARCHAR(200),
    notas TEXT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

CREATE TABLE auditoria_citas (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_cita INT NOT NULL,
    tipo_operacion ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    fecha_operacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR(100) NOT NULL,
    detalles TEXT
);

CREATE TRIGGER after_cita_insert
AFTER INSERT ON citas
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_citas (id_cita, tipo_operacion, usuario, detalles)
    VALUES (NEW.id_cita, 'INSERT', CURRENT_USER(), 
            CONCAT('Nueva cita creada: Paciente ', NEW.id_paciente, 
                   ', Médico ', NEW.id_medico, 
                   ', Fecha ', NEW.fecha_hora));
END;


CREATE TRIGGER after_cita_update
AFTER UPDATE ON citas
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_citas (id_cita, tipo_operacion, usuario, detalles)
    VALUES (NEW.id_cita, 'UPDATE', CURRENT_USER(), 
            CONCAT('Cita actualizada. Cambios: ',
                   IF(OLD.id_paciente <> NEW.id_paciente, CONCAT('Paciente ', OLD.id_paciente, '→', NEW.id_paciente, '; '), ''),
                   IF(OLD.id_medico <> NEW.id_medico, CONCAT('Médico ', OLD.id_medico, '→', NEW.id_medico, '; '), ''),
                   IF(OLD.fecha_hora <> NEW.fecha_hora, CONCAT('Fecha ', OLD.fecha_hora, '→', NEW.fecha_hora, '; '), ''),
                   IF(OLD.estado <> NEW.estado, CONCAT('Estado ', OLD.estado, '→', NEW.estado, '; '), '')));
END  ;

INSERT INTO pacientes (nombre, apellido, correo, telefono, fecha_nacimiento, direccion) VALUES
('Juan', 'Pérez', 'juan.perez@email.com', '555-1234', '1985-05-15', 'Calle Falsa 123'),
('María', 'Gómez', 'maria.gomez@email.com', '555-5678', '1990-08-22', 'Avenida Siempre Viva 456'),
('Carlos', 'López', 'carlos.lopez@email.com', '555-9012', '1978-11-30', 'Boulevard Los Olivos 789');

INSERT INTO medicos (nombre, apellido, especialidad, correo, telefono, fecha_contratacion) VALUES
('Ana', 'Rodríguez', 'Cardiología', 'ana.rodriguez@clinica.com', '555-3456', '2015-03-10'),
('Luis', 'Martínez', 'Pediatría', 'luis.martinez@clinica.com', '555-7890', '2018-07-15'),
('Sofía', 'Hernández', 'Dermatología', 'sofia.hernandez@clinica.com', '555-2345', '2020-01-20');

INSERT INTO citas (id_paciente, id_medico, fecha_hora, estado, motivo) VALUES
(1, 1, '2023-11-15 09:00:00', 'programada', 'Consulta por dolor en el pecho'),
(2, 2, '2023-11-16 10:30:00', 'programada', 'Control anual infantil'),
(3, 3, '2023-11-17 14:00:00', 'programada', 'Revisión de erupción cutánea');


UPDATE citas SET estado = 'completada' WHERE id_cita = 1;


UPDATE citas SET fecha_hora = '2023-11-18 11:00:00' WHERE id_cita = 2;


UPDATE citas SET id_medico = 2 WHERE id_cita = 3;

SELECT * FROM auditoria_citas ORDER BY fecha_operacion DESC;
