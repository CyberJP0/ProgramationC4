DROP DATABASE IF EXISTS colegio_final;
CREATE DATABASE colegio_final;
USE colegio_final;

CREATE TABLE departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    fecha_nacimiento DATE,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE profesores (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100)
);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE clases (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT,
    fecha DATE,
    aula VARCHAR(50),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE inscripciones (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha DATE,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE calificaciones (
    id_calificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    nota DECIMAL(5,2),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

INSERT INTO departamentos (nombre) VALUES
('Informática'),
('Administración'),
('Contabilidad');

INSERT INTO estudiantes (nombre, apellido, fecha_nacimiento, id_departamento) VALUES
('Ana', 'Torres', '2005-02-10', 1),
('Luis', 'Martínez', '2004-06-15', 2),
('Pedro', 'García', '2003-11-20', 1),
('Andrea', 'Ramírez', '2005-07-30', 3),
('Carlos', 'García', '2004-09-12', 1);

INSERT INTO profesores (nombre, apellido) VALUES
('Juan', 'Lopez'),
('María', 'Santos'),
('Carlos', 'Perez');

INSERT INTO cursos (nombre, id_profesor) VALUES
('Base de Datos', 1),
('Matemáticas', 2),
('Programación', 1),
('Contabilidad I', 3);

INSERT INTO clases (id_curso, fecha, aula) VALUES
(1, '2025-01-10', 'A1'),
(1, '2025-01-12', 'A1'),
(2, '2025-01-11', 'B2'),
(3, '2025-01-13', 'Lab1');

INSERT INTO inscripciones (id_estudiante, id_curso, fecha) VALUES
(1, 1, '2025-01-05'),
(1, 3, '2025-01-06'),
(2, 2, '2025-01-07'),
(3, 1, '2025-01-08'),
(4, 4, '2025-01-09'),
(5, 1, '2025-01-10');

INSERT INTO calificaciones (id_estudiante, id_curso, nota) VALUES
(1, 1, 95),
(1, 3, 88),
(2, 2, 92),
(3, 1, 85),
(4, 4, 98),
(5, 1, 91);

SELECT * FROM estudiantes;

SELECT nombre, apellido FROM estudiantes;

SELECT * FROM estudiantes
WHERE id_departamento = 1;


SELECT * FROM estudiantes
ORDER BY fecha_nacimiento ASC;


SELECT COUNT(*) AS total_estudiantes
FROM estudiantes;


SELECT * FROM estudiantes
WHERE apellido = 'García';


SELECT * FROM estudiantes
WHERE nombre LIKE 'A%';


SELECT estudiantes.nombre, estudiantes.apellido, departamentos.nombre AS departamento
FROM estudiantes
INNER JOIN departamentos
ON estudiantes.id_departamento = departamentos.id_departamento;


SELECT estudiantes.nombre, estudiantes.apellido, AVG(calificaciones.nota) AS promedio
FROM estudiantes
INNER JOIN calificaciones
ON estudiantes.id_estudiante = calificaciones.id_estudiante
GROUP BY estudiantes.id_estudiante;


SELECT departamentos.nombre AS departamento, COUNT(estudiantes.id_estudiante) AS total
FROM departamentos
LEFT JOIN estudiantes
ON departamentos.id_departamento = estudiantes.id_departamento
GROUP BY departamentos.nombre;

SELECT profesores.nombre, profesores.apellido, cursos.nombre AS curso
FROM profesores
INNER JOIN cursos
ON profesores.id_profesor = cursos.id_profesor;

SELECT estudiantes.nombre, estudiantes.apellido, AVG(calificaciones.nota) AS promedio
FROM estudiantes
INNER JOIN calificaciones
ON estudiantes.id_estudiante = calificaciones.id_estudiante
GROUP BY estudiantes.id_estudiante
HAVING promedio > 90;


SELECT estudiantes.nombre, estudiantes.apellido, AVG(calificaciones.nota) AS promedio
FROM estudiantes
INNER JOIN calificaciones
ON estudiantes.id_estudiante = calificaciones.id_estudiante
GROUP BY estudiantes.id_estudiante
ORDER BY promedio DESC
LIMIT 5;
