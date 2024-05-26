SELECT u.nombre AS nombre_usuario, p.nombre AS nombre_producto, p.precio, p.stock, pd.cantidad
FROM pedidos pd
INNER JOIN usuarios u ON pd.usuario = u.id
INNER JOIN productos p ON pd.producto = p.id;