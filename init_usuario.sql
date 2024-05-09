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
    id INTEGER NOT NULL UNIQUE PRIMARY KEY,
    mensaje TEXT NOT NULL
);

CREATE TABLE followers (
    seguidor_id INTEGER NOT NULL,
    seguido_id INTEGER NOT NULL,
    PRIMARY KEY (seguidor_id, seguido_id),
    FOREIGN KEY (seguidor_id) REFERENCES usuarios(id),
    FOREIGN KEY (seguido_id) REFERENCES usuarios(id)
);


INSERT INTO usuarios (id, nombre, password, puntos) VALUES 
(1, 'Manolo', 'aguacate', 58) 
(2, 'Antonio', 'admin', 12) 
(3, 'Maria', 'contraseñasegura', 90);

INSERT INTO mensajes (id,mensaje) VALUES
(1,'Hola mundo')
(2, 'Adios mundo')

INSERT INTO followers (seguidor_id, seguido_id) VALUES
(1, 2), -- Manolo sigue a Antonio
(1, 3); -- Manolo sigue a Maria

UPDATE usuarios
SET password = 'nuevacontraseña'
WHERE nombre = 'Manolo';
