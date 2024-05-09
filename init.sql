DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS productos;

CREATE TABLE usuarios(
    id INTEGER NOT NULL UNIQUE PRIMARY KEY,
    nombre TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    edad INTEGER NOT NULL,
    ciudad TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    balance REAL NOT NULL,
    rol TEXT NOT NULL DEFAULT 'usuario'
);
CREATE TABLE pedidos(
    id INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    usuario INTEGER NOT NULL,
    producto INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    estado TEXT NOT NULL DEFAULT 'pendiente',
    FOREIGN KEY (usuario) REFERENCES usuarios(id),
    FOREIGN KEY (producto) REFERENCES productos(id)
);

CREATE TABLE productos(
    id INTEGER NOT NULL UNIQUE PRIMARY KEY,
    nombre TEXT NOT NULL UNIQUE,
    precio REAL NOT NULL,
    stock INTEGER NOT NULL
);