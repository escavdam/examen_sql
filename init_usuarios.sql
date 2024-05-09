DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS mensajes;
DROP TABLE IF EXISTS followers;

CREATE TABLE usuarios (
    id INTEGER NOT NULL UNIQUE PRIMARY KEY,
    nombre TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    puntos INTEGER NOT NULL
);

CREATE TABLE mensajes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario INTEGER NOT NULL,
    contenido TEXT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE followers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario_seguidor INTEGER NOT NULL,
    id_usuario_seguido INTEGER NOT NULL,
    FOREIGN KEY (id_usuario_seguidor) REFERENCES usuarios(id),
    FOREIGN KEY (id_usuario_seguido) REFERENCES usuarios(id)
);


INSERT INTO usuarios (id, nombre, password, puntos) VALUES
(1, 'menendez', 'password1', 0),
(2, 'rafael', 'password2', 1),
(3, 'messi', 'password3', 2);


INSERT INTO mensajes (id_usuario, contenido) VALUES
(1, 'Buenos dias por la mañana'),
(2, 'Luego me como un kebab');


INSERT INTO followers (id_usuario_seguidor, id_usuario_seguido) VALUES
(1, 2),
(2, 1),
(3, 1);

UPDATE usuarios SET nombre = 'pepo' WHERE id = 1;