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

6. ¿Como puedes saber que tablas existen en la base de datos?

7. ¿Como puedes saber de que datos se componen las tablas?

8. Devuelve los 5 primeros usuarios de la tabla `usuarios`.

9. Devuelve los 5 primeros usuarios de la tabla `usuarios` ordenados por su balance de forma descendente.

10. Devuelve el numero de paises diferentes que existen en la tabla `usuarios`.

11. Devuelve los usuarios con un balance superior a 10.000€ en España.

12. Devuelve una tabla que muestre los productos que han sido comprados por los usuarios junto al nombre del usuario que lo ha comprado.

13. Whooops! Un junior furioso con acceso al backend hizo *algo*, ¡y no sabemos que es!, la única pista que tenemos es este log que alguien en el equipo pudo identificar al momento que hizo el cambio:

~~~plain
07MAY2024[18:32:12]: user #2831 logged in!
07MAY2024[18:32:20]: user #31 bought product #123!
07MAY2024[18:32:21]: 1 row updated in table 'usuarios'!
07MAY2024[18:32:22]: user #31 bought product #32!
~~~
