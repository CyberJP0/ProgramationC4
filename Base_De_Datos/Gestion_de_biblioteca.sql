DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);

CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    anio_publicacion INT,
    id_autor INT,

    CONSTRAINT fk_autor
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

INSERT INTO autores (nombre, nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiana'),
('Miguel de Cervantes', 'Española'),
('Julio Verne', 'Francesa');


INSERT INTO libros (titulo, anio_publicacion, id_autor) VALUES
('Cien Años de Soledad', 1967, 1),
('El Amor en los Tiempos del Cólera', 1985, 1),
('Don Quijote de la Mancha', 1605, 2),
('Viaje al Centro de la Tierra', 1864, 3);

SELECT * FROM autores;

SELECT * FROM libros;

SELECT libros.titulo, libros.anio_publicacion, autores.nombre AS autor
FROM libros
INNER JOIN autores ON libros.id_autor = autores.id_autor;


SELECT titulo
FROM libros
WHERE id_autor = 1;

SELECT autores.nombre, COUNT(libros.id_libro) AS total_libros
FROM autores
LEFT JOIN libros ON autores.id_autor = libros.id_autor
GROUP BY autores.nombre;
