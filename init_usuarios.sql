
CREATE TABLE Usuarios (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    password TEXT NOT NULL,
    puntos INTEGER DEFAULT 0
);


CREATE TABLE Mensajes (
    id INTEGER PRIMARY KEY,
    id_usuario INTEGER,
    mensaje TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id)
);


CREATE TABLE Followers (
    id_follower INTEGER,
    id_followee INTEGER,
    PRIMARY KEY (id_follower, id_followee),
    FOREIGN KEY (id_follower) REFERENCES Usuarios(id),
    FOREIGN KEY (id_followee) REFERENCES Usuarios(id)
);


INSERT INTO Usuarios (nombre, password, puntos) VALUES ('Usuario1', 'contraseña1', 100);
INSERT INTO Usuarios (nombre, password, puntos) VALUES ('Usuario2', 'contraseña2', 50);
INSERT INTO Usuarios (nombre, password, puntos) VALUES ('Usuario3', 'contraseña3', 75);


INSERT INTO Mensajes (id_usuario, mensaje) VALUES (1, 'Este es un mensaje testeo del Usuario1.');
INSERT INTO Mensajes (id_usuario, mensaje) VALUES (2, 'Este es un mensaje testeillo del Usuario2.');


INSERT INTO Followers (id_follower, id_followee) VALUES (1, 2);
INSERT INTO Followers (id_follower, id_followee) VALUES (2, 3);
INSERT INTO Followers (id_follower, id_followee) VALUES (3, 1);


UPDATE Usuarios SET nombre = 'idaira' WHERE id = 1;

-- Faltarian unas sentencias de DROP TABLE al principio de todo, para poder resetear la base de datos durante el desarrollo facilmente.

-- Utiliza autoincrementos para tus id's en las tablas, no es necesario gestionarlas nosotros a mano.

-- Y si no los utilizas, deberías escribir el id a mano cuando insertas usuarios :)

-- Utiliza otro id autoincremental para identificar los seguimientos de usuarios.

-- Quizá la eleccion de los nombres 'id_follower' e ' id_followee' vuelven loco a mas de uno que tenga que interactuar con la base de datos, son muy parecidos!