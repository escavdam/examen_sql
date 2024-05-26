DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS mensajes;
DROP TABLE IF EXISTS followers;

CREATE TABLE usuarios(
    id INTEGER NOT NULL UNIQUE PRIMARY KEY,
    nombre TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    puntos INTEGER NOT NULL
);

CREATE TABLE mensajes(
    id INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    mensaje TEXT NOT NULL,
    fecha TEXT NOT NULL, 
    FOREIGN KEY (nombre) REFERENCES usuarios (nombre)
);

CREATE TABLE followers(
    id INTEGER NOT NULL UNIQUE PRIMARY KEY,
    seguidor TEXT NOT NULL,
    seguido TEXT NOT NULL,
    FOREIGN KEY (seguidor) REFERENCES usuarios (nombre),
    FOREIGN KEY (seguido) REFERENCES usuarios (nombre)
);

INSERT INTO usuarios (nombre, password, puntos) VALUES
('Camilo', 'vivaVenezuela', 1),
('Pipote', 'Pipo', 2),
('Canton', 'Po', 3);

INSERT INTO mensajes(nombre, mensaje, fecha)
VALUES ('Camilo', 'Hola', '2024-05-12'),
('Canton', 'Adios', '2024-10-16');

INSERT INTO followers (seguidor, seguido) VALUES
('Canton', 'Camilo'),
('Pipote', 'Canton'),
('Camilo', 'Pipote');

UPDATE usuarios
SET password = 'nuevaContraseña'
WHERE nombre = 'Camilo';

SELECT * FROM usuarios;
SELECT * FROM mensajes;
SELECT * FROM followers;

-- Si utilizas IDs como Foreign Keys, debes usarlas cuando las referencies en otras tablas, utilizar los nombres no es correcto!

-- La db se reinicia correctamente, genial!