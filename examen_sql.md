# Examen SQL

Para la realizacion del examen, ayudaos de la herramienta de CLI de sqlite3 o de herramientas como https://sqliteonline.com/ y https://sqlime.org/ para interactuar con la base de datos.

Algunas preguntas pueden pedirte que hagas un archivo `.sql` aparte, en caso contrario, responde a las preguntas directamente en el archivo.

Asegúrate de que tu respuesta esta correctamente formateada en Markdown.

## Examen

1. Crea una base de datos de usuarios con las siguientes características:
  - Una tabla de usuarios con: id, nombre, password y puntos
  - Una tabla de mensajes, diseña su estructura y datos necesarios.
  - Una tabla de followers que permita saber que usuario esta siguiendo a otro, diseña su estructura y datos necesarios.

2. Inserta al menos 3 usuarios.

3. Inserta al menos 2 mensajes.

4. Inserta al menos 3 seguimientos entre usuarios.

5. Modifica un usuario.

Guarda tu inicio como `init_usuarios.sql`, asegúrate de borrar toda base de datos que hayas creado durante el ejercicio.

Lo siguientes ejercicios se realizan sobre la base de datos `tienda.db`.
 

👍 6. ¿Como puedes saber que tablas existen en la base de datos? Desde la consola introducimos sqlite3 tienda.db para abrir sql en ese archivo, e introducimos el comando  SELECT COUNT(*) FROM sqlite_master WHERE type='table'; Hay 4.

Correccion: Aunque esta bien, es mas fácil usar .tables dentro del CLI.

👍 7. ¿Como puedes saber de que datos se componen las tablas? Con .tables vemos los nombres de las tablas que hay, y para ver su estructura lo hacemos con .schema seguido del nombre de la tabla, EJ: .schema usuarios. Las tablas son usuarios, pedidos y facturas.

👍 8. Devuelve los 5 primeros usuarios de la tabla `usuarios`. Lo haremos con SELECT * FROM usuarios LIMIT 5; Los usuarios son 
local-sub985, hyper_hyper756, mid-pona759, dude_ultra511, sub-resistencia998

👍 1.  Devuelve los 5 primeros usuarios de la tabla `usuarios` ordenados por su balance de forma descendente. SELECT * FROM usuarios ORDER BY balance DESC LIMIT 5; 

👎 2.   Devuelve el numero de paises diferentes que existen en la tabla `usuarios`. SELECT COUNT(DISTINCT ciudad) FROM usuarios; No hay paises. Son 49 ciudades

Corrección: DISTINCT es una funcion, deberías usarla asi `DISTINCT(ciudad)`

👍 3.   Devuelve los usuarios con un balance superior a 10.000€ en España.  SELECT * FROM usuarios WHERE balance > 10000; Son 5632 personas.

👎 4.   Devuelve una tabla que muestre los productos que han sido comprados por los usuarios junto al nombre del usuario que lo ha comprado.
SELECT usuarios.nombre AS nombre_usuario, productos AS nombre_producto
FROM usuarios
JOIN pedidos ON usuarios.id = pedidos.id_usuario
JOIN productos ON pedidos.id_producto = productos.id;

👎 1.    Whooops! Un junior furioso con acceso al backend hizo *algo*, ¡y no sabemos que es!, la única pista que tenemos es este log que alguien en el equipo pudo identificar al momento que hizo el cambio: Este ejercicio no he sabido hacerlo.

~~~plain
07MAY2024[18:32:12]: user #2831 logged in!
07MAY2024[18:32:20]: user #31 bought product #123!
07MAY2024[18:32:21]: 1 row updated in table 'usuarios'!
07MAY2024[18:32:22]: user #31 bought product #32!
~~~

Nota: 7

Está bien, aunque algunos despistes te han bajado algo la nota, se que sabes pelearte con SQL y ganarle en general, buena!