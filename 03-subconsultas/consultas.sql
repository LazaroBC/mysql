/*
SUBCONSULTAS
- Son consultas que se ejecutan dentro de otras.
- Consiste en utilizar los resualtados de la subconsulta para operar en la consulta principal.
- Jugando con las claves ajenas / foraneas.
*/

/* Sacar usuarios con y sin entradas */
SELECT * FROM usuarios WHERE id IN (SELECT usuario_id FROM entradas);

SELECT * FROM usuarios WHERE id NOT IN (SELECT usuario_id FROM entradas);

/* Sacar los usuarios que tengan una entrada que en su título hablen de GTA*/


SELECT nombre, apellidos FROM usuarios WHERE id IN 
    (SELECT usuario_id FROM entradas WHERE titulo LIKE "%GTA%");

/* Sacar todas las entradas de la categoría acción */
SELECT categoria_id, titulo FROM entradas WHERE categoria_id 
    IN (SELECT id FROM categorias WHERE nombre = 'accion');

/* Mostrar las categorías con más de tres entradas */
SELECT nombre FROM categorias WHERE 
    id IN  (SELECT categoria_id FROM  entradas GROUP BY categoria_id HAVING COUNT(categoria_id) >= 4);

SELECT * FROM categorias WHERE 
    id IN  (SELECT categoria_id FROM  entradas GROUP BY categoria_id HAVING COUNT(categoria_id) >= 3);    

/* Mostrar los usuarios que crearon una entrada un martes */
SELECT * FROM usuarios WHERE id IN 
    (SELECT usuario_id FROM entradas WHERE DAYOFWEEK(fecha)=5);

/* Mostrar el nombre del usuario que tenga más entradas */
SELECT CONCAT(nombre, ' ', apellidos) AS 'Usuario con más entradas' FROM usuarios WHERE id =
    (SELECT usuario_id FROM entradas GROUP BY usuario_id ORDER BY  COUNT(id) DESC LIMIT 1);

/* Mostrar las categorías con entradas */
SELECT * FROM categorias WHERE id IN (SELECT categoria_id FROM entradas);

/* Mostrar las categorías sin entradas */
SELECT * FROM categorias WHERE id NOT IN (SELECT categoria_id FROM entradas);