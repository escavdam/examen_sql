DROP TABLE IF EXISTS followers;
DROP TABLE IF EXISTS mensajes;
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios(
    id INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    puntos INTEGER NOT NULL
);

CREATE TABLE mensajes(
    id INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    usuario TEXT NOT NULL,
    mensaje TEXT NOT NULL,
    FOREIGN KEY (usuario) REFERENCES usuarios ('nombre')
);

CREATE TABLE followers(
    id INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    usuario TEXT NOT NULL UNIQUE,
    follow TEXT NOT NULL, 
    FOREIGN KEY (usuario) REFERENCES usuarios ('nombre'),
    FOREIGN KEY (follow) REFERENCES usuarios ('nombre')
);

INSERT INTO usuarios (nombre, password, puntos) VALUES ('Javi', 'mepicaelculo', 2350);
INSERT INTO usuarios (nombre, password, puntos) VALUES ('Estiven', 'camachops', 5500);
INSERT INTO usuarios (nombre, password, puntos) VALUES ('Lucas', 'ulalalebaguet', 6450);

INSERT INTO mensajes (usuario, mensaje) VALUES ('Javi', 'Hola holita vecinillo');
INSERT INTO mensajes (usuario, mensaje) VALUES ('Estiven', 'Ooooooleeeeeeee');

INSERT INTO followers (usuario, follow) VALUES ('Javi', 'Estiven');
INSERT INTO followers (usuario, follow) VALUES ('Estiven', 'Lucas');
INSERT INTO followers (usuario, follow) VALUES ('Lucas', 'Javi');

UPDATE usuarios SET nombre = 'Camacho' WHERE password = 'camachops';