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

-- En la tabla de followers añades como PRIMARY KEY la combinación de seguidor_id y seguido_id, esto no tiene sentido en la estructura de la base de datos, no es necesario identificar cada seguimiento de usuarios que existe, pero en caso de que se quiera hacer, se puede hacer con un id autoincremental.

-- En la tabla de usuarios, el id debería ser un campo autoincremental, para que no se tenga que especificar en cada inserción, hacer esto puede llevar a inconsistencias en la base de datos y la manipulación de los datos.

-- En las sentencias de insercion de usuarios y mensajes faltan comas para separar los valores, el archivo no se ejecuta correctamente y la base de datos no se inicia como debería.

-- Ten cuidado, hay bastantes inconsistencias en la estructura, revísala bien.
