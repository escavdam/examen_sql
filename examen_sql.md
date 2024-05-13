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
   
   Hay 4 tablas que existen en la base de datos `tienda.db`. Podemos saber con el codigo seguido : `SELECT COUNT(*) FROM sqlite_master WHERE type='table';`

   Corrección: Podemos usar `.table` mas rápido. Si prefieres usar `SQL`, con `SELECT * FROM sqlite_master WHERE type='table';` es más correcto, ya que se pide *que* tablas, no *cuantas*.

7. ¿Como puedes saber de que datos se componen las tablas? 
  
  Peudo saber los datos que componen las tablas con el condigo `.Schema`

8.  Devuelve los 5 primeros usuarios de la tabla `usuarios`.

    Con el codigo `SELECT * FROM usuarios LIMIT 5;`, tenemos los usuarios sigientes :local-sub985, hyper_hyper756, mid-pona759, dude_ultra511, sub-resistencia998

9.  Devuelve los 5 primeros usuarios de la tabla `usuarios` ordenados por su balance de forma descendente.
    
    Con el codigo `SELECT * FROM usuarios ORDER BY balance DESC LIMIT 5;`, tenemos los usuarios sigientes : lowkey-seq260 (balancia de 99992.0 euros), bro_firulai045 (balancia de 99948.0 euros), champ-cool138 (balancia de 99941.0 euros), pipo_alfonso134 (balancia de 99930.0), hyper-champ849 (balancia de 99908.0 euros)

10. Devuelve el numero de paises diferentes que existen en la tabla `usuarios`.
    
    hay 49 ciudades. Un nombre obtinado con el codigo siguento: ` SELECT DISTINCT ciudad FROM usuarios;`

    Corrección:
    El numero de ciudades es correcto, pero el script no, deberia ser `select count(distinct(ciudad)) from usuarios;`.

11. Devuelve los usuarios con un balance superior a 10.000€ en España.

    Puedo devuelvar los usuarios con un balance superior a 10.000 euro en España con el codigo sigueto: `SELECT * FROM usuarios WHERE balance > 10000;`

12. Devuelve una tabla que muestre los productos que han sido comprados por los usuarios junto al nombre del usuario que lo ha comprado.
    
    Corrección:
    ```sql
    SELECT productos.nombre, usuarios.nombre
    FROM productos
    JOIN pedidos ON productos.id = pedidos.producto
    JOIN usuarios ON pedidos.usuario = usuarios.id;
    ```

13. Whooops! Un junior furioso con acceso al backend hizo *algo*, ¡y no sabemos que es!, la única pista que tenemos es este log que alguien en el equipo pudo identificar al momento que hizo el cambio:

    El junior furioso estaba el usuario `sneak_dude129`, que `tienda.db` lo da el rol de `Hacker`. Gracias al codigo sigiente : `SELECT DISTINCT nombre FROM usuarios WHERE rol = 'hacker';`


~~~plain
07MAY2024[18:32:12]: user #2831 logged in!
07MAY2024[18:32:20]: user #31 bought product #123!
07MAY2024[18:32:21]: 1 row updated in table 'usuarios'!
07MAY2024[18:32:22]: user #31 bought product #32!
~~~

Nota:
El examen está bien, se nota que conoces SQL, pero sigues teniendo descuidos muy tontos que te cuestan puntos, ten cuidado!