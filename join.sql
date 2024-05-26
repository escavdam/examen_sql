SELECT productos.nombre, usuarios.nombre
FROM productos
JOIN pedidos ON productos.id = pedidos.producto
JOIN usuarios ON pedidos.usuario = usuarios.id;
