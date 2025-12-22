DROP DATABASE IF EXISTS colegio;
CREATE DATABASE colegio;
USE colegio;

CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT,
    grado VARCHAR(50)
);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    docente VARCHAR(100)
);

CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha_matricula DATE,

    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

INSERT INTO estudiantes (nombre, edad, grado) VALUES
('Ana Torres', 15, '3ro de Secundaria'),
('Luis Martínez', 16, '4to de Secundaria'),
('Pedro Gómez', 14, '2do de Secundaria');

INSERT INTO cursos (nombre, docente) VALUES
('Matemáticas', 'Profesor Juan'),
('Lengua Española', 'Profesora María'),
('Informática', 'Profesor Carlos');

INSERT INTO matriculas (id_estudiante, id_curso, fecha_matricula) VALUES
(1, 1, '2025-01-05'),
(1, 3, '2025-01-06'),
(2, 1, '2025-01-07'),
(3, 2, '2025-01-08');

SELECT * FROM estudiantes;
SELECT * FROM cursos;
SELECT * FROM matriculas;

SELECT estudiantes.nombre AS estudiante,
       cursos.nombre AS curso,
       matriculas.fecha_matricula
FROM matriculas
INNER JOIN estudiantes ON matriculas.id_estudiante = estudiantes.id_estudiante
INNER JOIN cursos ON matriculas.id_curso = cursos.id_curso;

SELECT cursos.nombre AS curso,
       COUNT(matriculas.id_matricula) AS total_estudiantes
FROM cursos
LEFT JOIN matriculas ON cursos.id_curso = matriculas.id_curso
GROUP BY cursos.nombre;
