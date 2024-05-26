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
 

👍 6. ¿Como puedes saber que tablas existen en la base de datos?
``` SQL 
.tables 
```

👎 7. ¿Como puedes saber de que datos se componen las tablas?
``` SQL
SELECT * FROM nombre_de_la_tabla;
 ```
Corrección: `.schema` sería mas correcto, nos mostraria de que datos se componen las tablas, en lugar de que entradas hay almacenadas en ellos.

👍 8. Devuelve los 5 primeros usuarios de la tabla `usuarios`.
``` SQL
SELECT * FROM usuarios LIMIT 5;
 ```

👍 9. Devuelve los 5 primeros usuarios de la tabla `usuarios` ordenados por su balance de forma descendente.
``` SQL
SELECT * FROM usuarios ORDER BY balance DESC LIMIT 5;
```
👎 10.   Devuelve el numero de paises diferentes que existen en la tabla `usuarios`.
``` SQL
 SELECT DISTINCT (ciudad) FROM usuarios;
```
Corrección: `SELECT COUNT(DISTINCT(ciudad)) FROM usuarios`
Recuerda que se pide el *numero* de paises, no las diferentes entradas que existen.

👍 11. Devuelve los usuarios con un balance superior a 10.000€ en España.
``` SQL
SELECT * FROM usuarios WHERE balance > 10000;
```

👍 12. Devuelve una tabla que muestre los productos que han sido comprados por los usuarios junto al nombre del usuario que lo ha comprado.
 ``` SQL   
SELECT u.nombre AS nombre_usuario, p.nombre AS nombre_producto, p.precio, p.stock, pd.cantidad
FROM pedidos pd
INNER JOIN usuarios u ON pd.usuario = u.id
INNER JOIN productos p ON pd.producto = p.id;
 ```

Nota: Ojo! no se pide el stock ni la cantidad pedida

1. Whooops! Un junior furioso con acceso al backend hizo *algo*, ¡y no sabemos que es!, la única pista que tenemos es este log que alguien en el equipo pudo identificar al momento que hizo el cambio:

~~~plain
07MAY2024[18:32:12]: user #2831 logged in!
07MAY2024[18:32:20]: user #31 bought product #123!
07MAY2024[18:32:21]: 1 row updated in table 'usuarios'!
07MAY2024[18:32:22]: user #31 bought product #32!
~~~
Lo que ha pasado es que han añadido un rol de Hacker, y han modificado la columna de roles, donde se ve que ha añadido el rol de hacker de manera random.

Para arreglarlo No permitiría que el rol sea actualizado directamente a través de consultas SQL como la que hemos mostrado en el primer mensaje. En su lugar, manejamos la asignación de roles en el código de tu aplicación, donde tengas más control sobre quién tiene qué rol o antes de permitir que se actualice el rol de un usuario en la base de datos, asegúrarnos de validar y autorizar esta acción adecuadamente en el nivel de la aplicación, sobre todo para comprobar que el usuario tiene los permisos adecuados para actualizar el rol.

Corrección: Ojo! Aqui estamos analizando algo que ya ha pasado, estamos preguntando como encontrar ese fallo, y como solucionarlo, una sentencia SQL para corregir el problema habria sido perfecto.

Nota: 8
Aunque has tenido algunos fallos en preguntas tontas (y creo que sobre todo por confusion con el enunciado), el init.sql esta genial, no falla al reiniciar multiples veces, y las foreign keys estan bien configuradas.