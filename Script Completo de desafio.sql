create database organizacion_mascota;

CREATE TABLE Mascotas (
    idMascota INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    especie VARCHAR(30),
    raza VARCHAR(50),
    edad INT,
    estado_salud VARCHAR(50),
    estado_adopcion VARCHAR(20)
);

CREATE TABLE Adoptantes (
    idAdoptante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Empleados (
    idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    puesto VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Adopciones (
    idAdopcion INT AUTO_INCREMENT PRIMARY KEY,
    idMascota INT,
    idAdoptante INT,
    idEmpleado INT,
    fecha DATE,
    FOREIGN KEY (idMascota) REFERENCES Mascotas(idMascota),
    FOREIGN KEY (idAdoptante) REFERENCES Adoptantes(idAdoptante),
    FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado)
);

CREATE TABLE Controles_PostAdopcion (
    idControl INT AUTO_INCREMENT PRIMARY KEY,
    idAdopcion INT,
    fecha DATE,
    observaciones TEXT,
    realizado_por INT,
    FOREIGN KEY (idAdopcion) REFERENCES Adopciones(idAdopcion),
    FOREIGN KEY (realizado_por) REFERENCES Empleados(idEmpleado)
);

INSERT INTO Mascotas (nombre, especie, raza, edad, estado_salud, estado_adopcion) VALUES
('Luna', 'Perro', 'Labrador', 3, 'Saludable', 'Disponible'),
('Max', 'Perro', 'Golden Retriever', 4, 'Saludable', 'Adoptada'),
('Milo', 'Gato', 'Persa', 2, 'En tratamiento', 'Disponible'),
('Nala', 'Gato', 'Siames', 1, 'Saludable', 'Adoptada'),
('Rocky', 'Perro', 'Bulldog', 5, 'Saludable', 'Disponible'),
('Bella', 'Gato', 'Mestizo', 2, 'Saludable', 'Disponible'),
('Simba', 'Perro', 'Mestizo', 6, 'Saludable', 'Disponible'),
('Coco', 'Gato', 'Maine Coon', 3, 'Saludable', 'Adoptada'),
('Bruno', 'Perro', 'Beagle', 4, 'Recuperación', 'Disponible'),
('Lola', 'Gato', 'Mestizo', 5, 'Saludable', 'Disponible'),
('Toby', 'Perro', 'Poodle', 2, 'Saludable', 'Adoptada'),
('Mimi', 'Gato', 'Mestizo', 3, 'En tratamiento', 'Disponible'),
('Thor', 'Perro', 'Doberman', 4, 'Saludable', 'Disponible'),
('Olivia', 'Gato', 'Bengala', 2, 'Saludable', 'Disponible'),
('Zeus', 'Perro', 'Pastor Alemán', 6, 'Saludable', 'Adoptada'),
('Kira', 'Gato', 'Ragdoll', 1, 'Saludable', 'Disponible'),
('Lucas', 'Perro', 'Boxer', 3, 'Saludable', 'Disponible'),
('Sasha', 'Gato', 'Siames', 2, 'Saludable', 'Disponible'),
('Leo', 'Perro', 'Husky', 5, 'Saludable', 'Adoptada'),
('Nina', 'Gato', 'Mestizo', 3, 'Saludable', 'Disponible');

INSERT INTO Adoptantes (nombre, direccion, telefono, email) VALUES
('Carlos Gómez', 'Calle 123, Ciudad', '555-1234', 'carlos@example.com'),
('Laura Ruiz', 'Avenida 45, Ciudad', '555-2345', 'laura@example.com'),
('José Martínez', 'Calle 56, Ciudad', '555-3456', 'jose@example.com'),
('Ana Torres', 'Calle Luna 5, Ciudad', '555-4567', 'ana@example.com'),
('Luis Pérez', 'Calle Sol 8, Ciudad', '555-5678', 'luis@example.com'),
('Marta Díaz', 'Av. Libertad 22, Ciudad', '555-6789', 'marta@example.com'),
('Santiago Ríos', 'Calle Norte 3, Ciudad', '555-7890', 'santiago@example.com'),
('Claudia Vera', 'Pasaje 77, Ciudad', '555-8901', 'claudia@example.com'),
('Gabriel Salas', 'Calle Este 9, Ciudad', '555-9012', 'gabriel@example.com'),
('Diana Luna', 'Calle Sur 10, Ciudad', '555-0123', 'diana@example.com');

INSERT INTO Empleados (nombre, puesto, email) VALUES
('María López', 'Veterinaria', 'maria@example.com'),
('Pedro Hernández', 'Cuidador', 'pedro@example.com'),
('Sandra Molina', 'Administrativa', 'sandra@example.com'),
('Ricardo Díaz', 'Inspector', 'ricardo@example.com'),
('Lucía Torres', 'Veterinaria', 'lucia@example.com');

INSERT INTO Adopciones (idMascota, idAdoptante, idEmpleado, fecha) VALUES
(2, 1, 1, '2024-11-10'),
(4, 2, 2, '2024-12-01'),
(8, 3, 1, '2025-01-15'),
(11, 4, 4, '2025-02-20'),
(15, 5, 2, '2025-03-01'),
(19, 6, 5, '2025-04-05');

INSERT INTO Controles_PostAdopcion (idAdopcion, fecha, observaciones, realizado_por) VALUES
(1, '2024-11-25', 'Mascota en excelente estado', 1),
(2, '2024-12-15', 'Pequeños ajustes alimenticios', 2),
(3, '2025-01-30', 'Todo en orden', 1),
(4, '2025-02-28', 'Dueños muy comprometidos', 4),
(5, '2025-03-15', 'Chequeo completo, todo bien', 2),
(6, '2025-04-20', 'Mascota adaptándose bien', 5);

SELECT * FROM Mascotas
WHERE estado_adopcion = 'Disponible'
AND (especie = 'Perro' OR edad <= 3 OR estado_salud = 'Saludable');

SELECT a.nombre AS Adoptante, m.nombre AS Mascota, ad.fecha
FROM Adopciones ad
JOIN Adoptantes a ON ad.idAdoptante = a.idAdoptante
JOIN Mascotas m ON ad.idMascota = m.idMascota
WHERE a.nombre = 'Carlos Gómez';

SELECT cp.fecha, cp.observaciones, e.nombre AS Empleado, m.nombre AS Mascota
FROM Controles_PostAdopcion cp
JOIN Empleados e ON cp.realizado_por = e.idEmpleado
JOIN Adopciones a ON cp.idAdopcion = a.idAdopcion
JOIN Mascotas m ON a.idMascota = m.idMascota
WHERE e.nombre = 'María López' OR m.nombre = 'Max';

CREATE VIEW Vista_Adopciones AS
SELECT 
    a.idAdopcion,
    adop.nombre AS NombreAdoptante,
    m.nombre AS NombreMascota,
    m.especie,
    m.raza,
    m.edad,
    a.fecha
FROM Adopciones a
JOIN Adoptantes adop ON a.idAdoptante = adop.idAdoptante
JOIN Mascotas m ON a.idMascota

SELECT * from Vista_Adopciones;







