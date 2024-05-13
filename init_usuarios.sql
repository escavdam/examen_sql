DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS mensajes;
DROP TABLE IF EXISTS followers;

CREATE TABLE usuarios(
    'ID' INTEGER NOT NULL UNIQUE PRIMARY KEY,
    'NOMBRE' TEXT NOT NULL UNIQUE,
    'CONTRASEÑA' TEXT NOT NULL,
    'PUNTOS' INTEGER NOT NULL
);

CREATE TABLE mensajes(
    'ID' INTEGER NOT NULL UNIQUE PRIMARY KEY,
    'USUARIO' TEXT NOT NULL UNIQUE,
    'MENSAJE' TEXT NOT NULL,
    'TIEMPO' TEXT NOT NULL,
    'FECHA' TEXT NOT NULL,
    FOREIGN KEY (USUARIO) REFERENCES usuarios(NOMBRE)
);

CREATE TABLE followers(
    'ID' INTEGER NOT NULL UNIQUE PRIMARY KEY,
    'SIGUIDIDO' TEXT NOT NULL,
    'SIGUIDOR' TEXT NOT NULL,
    FOREIGN KEY (SIGUIDIDO) REFERENCES usuarios(NOMBRE),
    FOREIGN KEY (SIGUIDOR) REFERENCES usuarios(NOMBRE)
);

INSERT INTO usuarios (ID, NOMBRE, CONTRASEÑA, PUNTOS) VALUES(1, 'Alejandro', 'PRIMERODETODOS', 143);
INSERT INTO usuarios (ID, NOMBRE, CONTRASEÑA, PUNTOS) VALUES(2, 'Bruno', 'SegundoDeTodo', 125);
INSERT INTO usuarios (ID, NOMBRE, CONTRASEÑA, PUNTOS) VALUES(3, 'Carlos', 'tercerodetodo', 90);

INSERT INTO mensajes (ID, USUARIO, MENSAJE, TIEMPO, FECHA) VALUES(1, 'Alejandro', '¡VIVA ESPAÑA! ¡EL MAS GRANDE DE TODOS LOS PAÍSES!', '00:00', '12 OCTOBRE 2024');
INSERT INTO mensajes (ID, USUARIO, MENSAJE, TIEMPO, FECHA) VALUES(2, 'Bruno', 'Bruh', '9:42', '12 OCTOBRE 2024');

INSERT INTO followers (ID, SIGUIDIDO, SIGUIDOR) VALUES(1, 'Alejandro', 'Bruno');
INSERT INTO followers (ID, SIGUIDIDO, SIGUIDOR) VALUES(2, 'Bruno', 'Carlos');
INSERT INTO followers (ID, SIGUIDIDO, SIGUIDOR) VALUES(3, 'Bruno', 'Alejandro');

UPDATE usuarios
SET NOMBRE = 'André', CONTRASEÑA = 'AlphaOmega', PUNTOS = 2020
WHERE ID = 1;

UPDATE mensajes 
Set USUARIO = 'André'
WHERE ID = 1;

UPDATE followers 
Set SIGUIDIDO = 'André'
WHERE ID = 1;

UPDATE followers 
Set SIGUIDOR = 'André'
WHERE ID = 3;

SELECT * FROM usuarios;
SELECT * FROM mensajes;
SELECT * FROM followers;

-- La tabla de usuarios utiliza id's para identificar sus usuarios, pero no utiliza la propiedad AUTOINCREMENT para gestionar su valor.
-- La tabla mensajes usa de referencia los nombres de la tabla usuarios en lugar de su ID, puede funcionar, pero deberias utilizar un ID autoincremental, que es lo que realmente identifica cada entrada, utilizar nombres puede ralentizar las queries.
