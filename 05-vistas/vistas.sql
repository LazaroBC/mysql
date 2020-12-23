/*
 * Una consulta almacenada en la base de datos que se utiliza como una tabla virtual.
 * No almacena datos si no que utiliza asiciaciones y los datos de las tablas originales
 * de forma que siempre se mantiene actualizadas
 */

CREATE VIEW entradas_con_nombre AS
    SELECT e.id, e.titulo, u.nombre AS 'Autor', c.nombre AS 'Categoría'
        FROM entradas e
            INNER JOIN usuarios u ON e.usuario_id = u.id
                INNER JOIN categorias c ON e.categoria_id = c.id;

/* 
 * A partir de el momento que ejecutamos esta sentncia solo tendremos que ejecutar
 * SELECT * FROM entradas_con_nombre;
 * Tendremos una tabla con la que operar exactemante igual que una tabla más.
 */

 SELECT * FROM entradas_con_nombre;
 DROP VIEW entradas_con_nombre;
