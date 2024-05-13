DROP TABLE IF EXISTS 'usuarios';
DROP TABLE IF EXISTS 'mensajes';
DROP TABLE IF EXISTS 'followers';

CREATE TABLE usuarios(
    id INTEGER  NOT NULL UNIQUE,
    usuario TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    puntos INTEGER NOT NULL,
    PRIMARY KEY (id AUTOINCREMENT)

);

CREATE TABLE mensajes(
    id INTEGER NOT NULL ,
    autor TEXT,
    mensaje TEXT NOT NULL,
    
    PRIMARY KEY (id AUTOINCREMENT)
    FOREIGN KEY (autor) REFERENCES usuarios(id)
);


CREATE TABLE followers(
    id INTEGER  NOT NULL,
    usuarioThatFollows TEXT NOT NULL,
    follower TEXT,

    PRIMARY KEY (id AUTOINCREMENT)
    FOREIGN KEY (usuarioThatFollows) REFERENCES usuarios(id)
    FOREIGN KEY (follower) REFERENCES usuarios(id)
);


INSERT INTO 'usuarios' (usuario, password, puntos) VALUES ('Pepe', 'gatetes005', '0'),
('Lolo', 'miPerroChico49', '10'),
('Mercedes', 'senIsIdWARgHTHyS', '8');

INSERT INTO 'mensajes' (autor, mensaje) VALUES ('Lolo', 'Hola sabes que es lo que quiero'),
('Mercedes', 'Hoy el dia esta un poco NaN'),
('Pepe', 'Si hoy llueve no entenderia nada de lo que pasa a mi alrededor');

INSERT INTO 'followers' (usuarioThatFollows, follower) VALUES ('Pepe', 'Mercedes'),
('Pepe', 'Lolo'),
('Lolo', 'Pepe'),
('Mercedes', 'Pepe'),
('Mercedes', 'Lolo');


UPDATE usuarios 
SET password = 'miContraseñaEsIncreible90', puntos = '40'
WHERE id = '1';

-- En la tabla de mensajes, sería buena idea hacer el autor un campo NOT NULL
-- De la misma forma, en la tabla followers el campo follower debería ser NOT NULL, no se puede hacer follow a nadie, además, usuarioThatFollows y follower deberían datos de tipo INTEGER, no TEXT
-- Está bien, pero ten cuidado con esas inconsistencias, recuerda que SQLite da mucha libertad con los tipos, asi que no se queja si tiene que convertir tipos, ten cuidado!




