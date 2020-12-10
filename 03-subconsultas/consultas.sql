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