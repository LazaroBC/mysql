/*
 * Ejercicio 21.- Obtener los nombres y ciudades de los clientes con encargos de tres o más
 */

SELECT nombre, ciudad FROM clientes WHERE id IN
    (SELECT cliente_id FROM encargos WHERE cantidad >= 3);

/*
 * Ejercicio 22.- Mostrar listado de clientes(número de cliente y el nombre)
 * mostrar también el número de vendedor y su nombre
 */

SELECT c.id, c.nombre, e.id, CONCAT(e.nombre,' ', e.apellidos)  AS 'Empleado'
    FROM clientes c, empleados e
        WHERE c.empleado_id = e.id;

/*
 * Ejercicio 23.- Listar todos los encargos realizados con la marca del coche y el nombre del cliente
 */

SELECT e.id, co.marca, c.nombre FROM encargos e 
    INNER JOIN coches co ON co.id = e.coche_id
    INNER JOIN clientes c ON c.id = e.cliente_id;

/*
 * Ejercicio 24.- Listar los encargos con el nombre del coche , 
 * el nombre del cliente y el nombre de la ciudad, 
 * pero únicamente cuando sean de Madrid
 */

SELECT e.id, co.modelo, c.nombre, c.ciudad FROM encargos e
    INNER JOIN coches co ON co.id = e.coche_id
    INNER JOIN clientes c ON c.id = e.cliente_id
        WHERE c.ciudad = 'Madrid';

/*
 * Ejercicio 25.- Obtener una lista de los nombres de los clientes con el importe de sus enccargos acumulados
 */

SELECT ci.id, ci.nombre AS 'Nombre Cliente', SUM(precio*cantidad) AS 'Importe' 
FROM clientes ci
    INNER JOIN encargos en ON ci.id = en.cliente_id
    INNER JOIN coches co ON en.coche_id = co.id
        GROUP BY ci.nombre
        ORDER BY 3;

/*
 * Ejercicio 26.- Sacar empleados que tienen jefe y el nombre del jefe
 */

SELECT CONCAT(e1.nombre,' ', e1.apellidos) AS 'Empleado', CONCAT(e2.nombre,' ', e2.apellidos) AS 'Jefe' FROM empleados e1
    INNER JOIN empleados e2 ON e1.jefe = e2.id;

/*
 * Ejercicio 27.- Visualizar los nombres de los clientes y la cantidad de encargos realizados
 * incluyendo los que no hayan realizado encargos
 */

SELECT c.nombre, COUNT(e.id) FROM clientes c
    LEFT JOIN encargos e ON c.id = e.cliente_id
        GROUP BY 1;

/*
 * Ejercicio 28.- Listar todos los empleados y el número de clientes tengan o no clientes
 */

SELECT e.nombre, e.apellidos, COUNT(c.id) AS 'Nº Clientes' FROM empleados e
    LEFT JOIN clientes c ON c.empleado_id = e.id
        GROUP BY e.nombre;

/*
 * Ejercicio 29.- Crear una vista llamada vendedores que incluirá todos los empleados 
 * del grupo vendedores 
 */

CREATE VIEW vendedores AS 
    SELECT * FROM empleados WHERE grupo_id IN
        (SELECT id FROM grupos WHERE nombre = 'Vendedores');

CREATE VIEW mecanicos AS 
    SELECT * FROM empleados WHERE grupo_id IN
        (SELECT id FROM grupos WHERE nombre = 'Mecanicos');

CREATE VIEW oficina AS 
    SELECT * FROM empleados WHERE grupo_id IN
        (SELECT id FROM grupos WHERE nombre = 'Oficina');

SELECT * FROM vendedores;
SELECT * FROM mecanicos;
SELECT * FROM oficina;

/*
 * Ejercicio 30.- Mostrar los datos del empleado con más antigüedad en el concesionario
 */

SELECT * FROM empleados ORDER BY fecha_alta ASC LIMIT 1;

/*
 * Ejercicio 31.- Obtener los coches con más unidades vendidas
 */

SELECT * FROM coches WHERE id IN
    (SELECT coche_id FROM encargos WHERE cantidad IN
        (SELECT MAX(cantidad) FROM encargos));
