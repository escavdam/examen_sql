SELECT u.nombre AS 'Nombre del Usuario', p.nombre AS 'Nombre del Producto'
FROM usuarios u
JOIN pedidos pd ON u.id = pd.usuario
JOIN productos p ON pd.producto = p.id;