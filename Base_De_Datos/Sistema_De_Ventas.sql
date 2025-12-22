DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas;
USE ventas;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);


CREATE TABLE facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT,

    CONSTRAINT fk_cliente
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);


INSERT INTO clientes (nombre, telefono, correo) VALUES
('Juan Pérez', '809-555-1234', 'juan@gmail.com'),
('María López', '829-555-5678', 'maria@hotmail.com'),
('Carlos Gómez', '849-555-9999', 'carlos@gmail.com');


INSERT INTO productos (nombre, precio, stock) VALUES
('Laptop', 1200.50, 10),
('Teléfono', 850.75, 15),
('Audífonos', 45.99, 50);


INSERT INTO facturas (fecha, id_cliente) VALUES
('2025-01-10', 1),
('2025-01-11', 2),
('2025-01-12', 1);


SELECT * FROM clientes;

SELECT * FROM productos;


SELECT * FROM facturas;


SELECT facturas.id_factura,
       facturas.fecha,
       clientes.nombre AS cliente
FROM facturas
INNER JOIN clientes
ON facturas.id_cliente = clientes.id_cliente;


SELECT clientes.nombre,
       COUNT(facturas.id_factura) AS total_facturas
FROM clientes
LEFT JOIN facturas
ON clientes.id_cliente = facturas.id_cliente
GROUP BY clientes.nombre;
