DROP TABLE IF EXISTS `mensajes`;
DROP TABLE IF EXISTS `usuarios`;
DROP TABLE IF EXISTS `followers`;

PRAGMA foreign_keys = ON;

CREATE TABLE `usuarios` (
    `id` INTEGER NOT NULL UNIQUE,
    `nombre` TEXT NOT NULL UNIQUE,
    `password` TEXT,
    `puntos` INTEGER DEFAULT 0,
    PRIMARY KEY (`id` AUTOINCREMENT)
);

CREATE TABLE `mensajes` (
    `id` INTEGER NOT NULL UNIQUE,
    `mensaje` TEXT NOT NULL,
    `autor` INTEGER NOT NULL,
    PRIMARY KEY (`id` AUTOINCREMENT)
);

CREATE TABLE `followers` (
    `seguidor` INTEGER NOT NULL,
    `seguido` INTEGER NOT NULL,
    PRIMARY KEY (`seguidor`, `seguido`),
    FOREIGN KEY (`seguidor`) REFERENCES `usuarios` (`id`),
    FOREIGN KEY (`seguido`) REFERENCES `usuarios` (`id`)
);

INSERT INTO `usuarios` (`nombre`, `password`, `puntos`) 
VALUES
('Juan', 'elTeacherD10', 10), -- subeme un puntillo
('Alejandro', 'polvoraa', 20),
('Camacho', 'elPrimo69', 15);

INSERT INTO `mensajes` (`mensaje`, `autor`) 
VALUES
('Estrepitosamente mal', 1),
('ola', 2),
('no será que hace frio pq es verano,ABEE', 3);

INSERT INTO `followers` (`seguidor`, `seguido`) 
VALUES
(1, 2),
(2, 3),
(3, 1);

UPDATE `usuarios`
SET `password` = 'NuevaContraseña',
    `puntos` = 50  
WHERE `id` = 1;


-- El script falla si se intenta ejecutar con la base de datos ya creada
-- El autor de los mensajes deberia ser una foreign key
-- La primary key de la tabla de followers deberia ser un id autoincremental, no podemos usar dos ids para identificar una entrada
