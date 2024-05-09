-- Dropear las tablas por si existen

-- Crear 3 tipos de tablas
CREATE TABLE usuarios(
    id INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    puntos INTEGER
);

CREATE TABLE mensajes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mensaje TEXT NOT NULL
);

-- CREATE TABLE followers(
--     id INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
-- );

-- Insertar al menos 3 usuarios
INSERT INTO usuarios (nombre, password, puntos) VALUES 
('admin', 'admin123', 5),
('usuario', 'usuario123', 10),
('usuario2', 'vivalapepa1', 0);

-- Insertar al menos 2 mensajes
INSERT INTO mensajes (mensaje) VALUES 
('Hola Pepito, ¿que tal estas?'),
('Bien, me gusta el furbo');

--Actualizar los usuarios
UPDATE usuarios
SET nombre='usuario1', password='holamundo123'
WHERE id = 2;  