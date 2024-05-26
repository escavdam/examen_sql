SELECT usuarios.nombre AS nombre_usuario, productos AS nombre_producto
FROM usuarios
JOIN pedidos ON usuarios.id = pedidos.id_usuario
JOIN productos ON pedidos.id_producto = productos.id;