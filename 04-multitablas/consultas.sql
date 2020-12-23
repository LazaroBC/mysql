/* 
 * CONSULTA MULTITABLA
 * Son consultas que sirven para consultar varias tablas en una sola sentencia
 */

/* Mostrar las entradas con el nombre del autos y el nombre de la categoria*/
SELECT e.id, e.titulo, u.nombre, c.nombre
    FROM entradas e, usuarios u , categorias c
        WHERE e.usuario_id = u.id AND e.categoria_id = c.id;
        
/* Con INNER JOIN */
SELECT e.id, e.titulo, u.nombre AS 'Autor', c.nombre AS 'Categoría'
    FROM entradas e
        INNER JOIN usuarios u ON e.usuario_id = u.id
            INNER JOIN categorias c ON e.categoria_id = c.id;

/* Mostrar el nombre de las categorías y al lado cuantas entradas tienen*/
SELECT c.nombre, COUNT(e.id) 
    FROM categorias c, entradas e 
        WHERE e.categoria_id = c.id GROUP BY e.categoria_id; 

/* Con INNER JOIN */ 
SELECT c.nombre, COUNT(e.id) 
    FROM categorias c 
        LEFT JOIN entradas e ON e.categoria_id = c.id /* LEFT JOIN mantiene todas las filas de la tabla de la izquierda y las coincidentes de la tabla derechca con la condicion*/
            GROUP BY e.categoria_id;

SELECT c.nombre, COUNT(e.id) 
    FROM entradas e
        RIGHT JOIN categorias c ON e.categoria_id = c.id /* LEFT JOIN mantiene todas las filas de la tabla de la drecha y las coincidentes de la tabla izquierda con la condicion*/
            GROUP BY e.categoria_id;


/* Mostrar el mail de los usuarios y al lado cuantas entradas tiene*/
SELECT u.email, COUNT(titulo) FROM usuarios u, entradas e
    WHERE e.usuario_id = u.id GROUP BY e.usuario_id;