CREATE DATABASE sistema_pedidos;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nomb_cliente VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    tipo_cliente ENUM('minorista', 'mayorista', 'corporativo') NOT NULL
);

CREATE TABLE transporte (
    num_transporte INT AUTO_INCREMENT PRIMARY KEY,
    nomb_conductor VARCHAR(100) NOT NULL,
    placa_vehiculo VARCHAR(20),
    capacidad_kg DECIMAL(10,2)
);

CREATE TABLE ciudad (
    id_ciudad INT AUTO_INCREMENT PRIMARY KEY,
    nomb_ciudad VARCHAR(100) NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    UNIQUE KEY (nomb_ciudad, departamento)
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    num_transporte INT,
    peso DECIMAL(10,2) NOT NULL,
    destino INT NOT NULL,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'en_transito', 'entregado', 'cancelado') DEFAULT 'pendiente',
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (num_transporte) REFERENCES transporte(num_transporte),
    FOREIGN KEY (destino) REFERENCES ciudad(id_ciudad)
);


CREATE USER 'gestor_clientes'@'localhost' IDENTIFIED BY 'Cliente12345.';

GRANT SELECT, INSERT, UPDATE, DELETE ON sistema_pedidos.cliente TO 'gestor_clientes'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE ON sistema_pedidos.ciudad TO 'gestor_clientes'@'localhost';

CREATE USER 'consulta_pedidos'@'localhost' IDENTIFIED BY 'Pedido123.';

GRANT SELECT ON sistema_pedidos.pedido TO 'consulta_pedidos'@'localhost';

CREATE USER 'admin_pedidos'@'localhost' IDENTIFIED BY 'Admin123.';

GRANT SELECT, INSERT, UPDATE, DELETE ON sistema_pedidos.pedido TO 'admin_pedidos'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON sistema_pedidos.transporte TO 'admin_pedidos'@'localhost';

