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

`usando ".table"`

👎 7. ¿Como puedes saber de que datos se componen las tablas?

`usando el comando "SELECT * FROM"`

Corrección: Eso nos devuelve los datos, si queremos saber de qué estan compuestas nuestras tablas, podemos usar `.schema`.

👎 8. Devuelve los 5 primeros usuarios de la tabla `usuarios`.

`usando "SELECT * FROM Usuarios LIMIT 5;"`

Corrección: Ese "Usuarios" te daría fallo, por favor, ten cuidado con esos despistes

👍 9. Devuelve los 5 primeros usuarios de la tabla `usuarios` ordenados por su balance de forma descendente.

`"SELECT * FROM usuarios ORDER BY balance DESC LIMIT 5;"` 

👎 10. Devuelve el numero de paises diferentes que existen en la tabla `usuarios`.

` "SELECT COUNT(DISTINCT cuidad) FROM usuarios;"`

Corrección:
`SELECT COUNT(DISTINCT(ciudad)) FROM usuarios;`

👍 11. Devuelve los usuarios con un balance superior a 10.000€ en España.

`"SELECT * FROM usuarios WHERE balance > 10000 AND pais = 'España';"`

👍 12. Devuelve una tabla que muestre los productos que han sido comprados por los usuarios junto al nombre del usuario que lo ha comprado.

`SELECT u.nombre AS 'Nombre del Usuario', p.nombre AS 'Nombre del Producto'`
`FROM usuarios u`
`JOIN pedidos pd ON u.id = pd.usuario`
`JOIN productos p ON pd.producto = p.id;` 

👎 13. Whooops! Un junior furioso con acceso al backend hizo *algo*, ¡y no sabemos que es!, la única pista que tenemos es este log que alguien en el equipo pudo identificar al momento que hizo el cambio:

`el junior que se ha metido ha hecho una update en la tabla de usuarios añadiendole el rol de hacker a alguien ramdon de la tabla, solo a una persona.`

Corrección: una sentencia para poder corregir esto habria estado bien, ademas, hay que especificar *como* llegaste a ver ese rol.

~~~plain
07MAY2024[18:32:12]: user #2831 logged in!
07MAY2024[18:32:20]: user #31 bought product #123!
07MAY2024[18:32:21]: 1 row updated in table 'usuarios'!
07MAY2024[18:32:22]: user #31 bought product #32!
~~~

Nota: 6

El examen está bien! Pero tienes despistes tan tontos que te ha bajado (bastante) la nota :( ten cuidado y repasa todo antes de entregarlo, compruebalo en la terminal, y asegúrate de que realmente funciona! Se nota que tienes experiencia con SQL, asi que no puedes permitirte estos fallos.