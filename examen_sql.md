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
      
      comando
      . tables

7. ¿Como puedes saber de que datos se componen las tablas?
      
      comando
      ´´´SQL
       SELECT * FROM usuarios;
      ´´´
8. Devuelve los 5 primeros usuarios de la tabla `usuarios`.
     
     comando
     ´´´SQL
      SELECT * FROM usuarios LIMIT 5;
     ´´´
9. Devuelve los 5 primeros usuarios de la tabla `usuarios` ordenados por su balance de forma descendente.
     
     comando
     ´´´SQL
     SELECT * FROM usuarios ORDER BY balance DESC LIMIT 5;
     ´´´
10. Devuelve el numero de ciudades diferentes que existen en la tabla `usuarios`.
     
     comando
     ´´´SQL
     SELECT COUNT (DISTINCT ciudad) FROM usuarios;
     ´´´
11. Devuelve los usuarios con un balance superior a 10.000€ en España.
     
     comando
     ´´´SQL
      SELECT * FROM usuarios WHERE balance > 10000;
     ´´´
12. Devuelve una tabla que muestre los productos que han sido comprados por los usuarios junto al nombre del usuario que lo ha comprado.
     comando
     ´´´SQL
      SELECT usuarios.nombre, pedidos.producto AS ProductosComprados FROM usuarios JOIN pedidos ON usuarios.nombre = pedidos.id
     ´´´
13. Whooops! Un junior furioso con acceso al backend hizo *algo*, ¡y no sabemos que es!, la única pista que tenemos es este log que alguien en el equipo pudo identificar al momento que hizo el cambio:

~~~plain
07MAY2024[18:32:12]: user #2831 logged in!
07MAY2024[18:32:20]: user #31 bought product #123!
07MAY2024[18:32:21]: 1 row updated in table 'usuarios'!
07MAY2024[18:32:22]: user #31 bought product #32!
~~~

Primero de todo revisamos la tabla de usuarios desde sql mirando y analizando los tipos de datos que tenemos, despues de esto nos damos cuenta que la columna de roles podria ser la unica que puede tener un cambio asi que haremos lo siguiente

´´´SQL
SELECT DISTINCT(rol) from usuarios;
´´´
Con esto veremos todo los roles que tenemos esto 
┌─────────┐
│   rol   │
├─────────┤
│ dev     │
│ user    │
│ premium │
│ admin   │
│ usuario │
│ hacker  │
└─────────┘
y nos percatamos que hay un rol de "hacker" asi que nos ponemos a mano y hacemos lo siguiente 

´´´SQL
SELECT * FROM usuarios WHERE rol = 'hacker';
´´´
┌─────┬───────────────┬───────────────┬──────┬────────┬─────────────────────────┬─────────┬────────┐
│ id  │    nombre     │   password    │ edad │ ciudad │          email          │ balance │  rol   │
├─────┼───────────────┼───────────────┼──────┼────────┼─────────────────────────┼─────────┼────────┤
│ 519 │ pona-hyper054 │ sneakultra664 │ 81   │ Toledo │ pona-hyper054@yahoo.com │ 67444.0 │ hacker │
└─────┴───────────────┴───────────────┴──────┴────────┴─────────────────────────┴─────────┴────────┘

cuando lo hagamos veremos esta tabla asi que nos pondremos manos a la obra y usaremos esto 

´´´SQL
UPDATE usuarios 
SET rol = 'user'
WHERE id = '519';
´´´
