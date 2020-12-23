/*
 *  Ejercicio 11.- Visualizar todos los cargos y el número de vendedores que hay en cada cargo
 */

SELECT cargo, COUNT(id) FROM empleados GROUP BY cargo ORDER BY COUNT(id);

/*
 *  Ejercicio 12.- Conseguir la masa salarial (anual) del concesionario
 */

SELECT SUM(sueldo) AS 'Masa salarial anual' FROM empleados;

/*
 *  Ejercicio 13.- Sacar la media  del sueldo entre todos los vendedores por grupos.
 */

SELECT grupo_id, AVG(sueldo) AS 'Media salarial' FROM empleados GROUP BY grupo_id;

SELECT g.nombre, AVG(e.sueldo) AS 'Media salarial' FROM empleados  e
    INNER JOIN grupos g ON e.id = e.grupo_id
        GROUP BY grupo_id;

SELECT g.nombre, AVG(e.sueldo) AS 'Media salarial' FROM empleados  e
    INNER JOIN grupos g ON g.id = e.grupo_id
        GROUP BY g.nombre;

/*
 * Ejercicio 14.- Visaulizar las unidades totales vendidas de cada coche a cada cliente.
 * Mostrando  el nombre del producto, número del cliente y suma de unidades
 */

SELECT co.modelo, cl.nombre, SUM(e.cantidad) FROM encargos e
    INNER JOIN coches co ON co.id = e.coche_id 
    INNER JOIN clientes cl ON cl.id = e.cliente_id
        GROUP BY e.coche_id; //, e.cliente_id;

SELECT co.modelo, cl.nombre, SUM(e.cantidad) FROM encargos e
    INNER JOIN coches co ON co.id = e.coche_id 
    INNER JOIN clientes cl ON cl.id = e.cliente_id
        GROUP BY e.coche_id, e.cliente_id;

/*
 * Ejercicio 15.- Mostrar los clientes que más encargos han hecho y mostrar cuantos hicieron
 */

SELECT cliente_id, COUNT(id) FROM encargos GROUP BY cliente_id ORDER BY 2 DESC LIMIT 2;

SELECT c.nombre, COUNT(c.id) FROM encargos e
    INNER JOIN clientes c ON c.id = e.cliente_id 
        GROUP BY cliente_id ORDER BY 2 DESC LIMIT 2;

/*
 * Ejercicio 16.- Obtener listado de clientes atendidos por el vendedor 'María Belloch'
 */

SELECT * FROM clientes WHERE empleado_id IN
    (SELECT id FROM empleados WHERE nombre = 'María' AND apellidos = 'Belloch' );

/*
 * Ejercicio 17.- Obtener listado con los encargos realizados por el cliente 'Carmina Burana Valencia'
 */

SELECT * FROM encargos WHERE cliente_id IN  
    (SELECT id FROM clientes WHERE nombre  = 'Carmina Burana Valencia');

SELECT * FROM encargos e
    INNER JOIN clientes c ON c.id = e.cliente_id
    INNER JOIN coches co ON co.id =e.coche_id
        WHERE e.cliente_id IN  
            (SELECT id FROM clientes WHERE nombre  = 'Carmina Burana Valencia'); 

SELECT e.id AS 'Nº Encargo', cantidad, c.nombre, co.modelo, e.fecha_alta FROM encargos e
    INNER JOIN clientes c ON c.id = e.cliente_id
    INNER JOIN coches co ON co.id =e.coche_id
        WHERE e.cliente_id IN  
            (SELECT id FROM clientes WHERE nombre  = 'Carmina Burana Valencia');

/*
 * Ejercicio 18.- Listar los clientes que han hecho un encargo del coche 'Ranchera'
 */

SELECT * FROM clientes WHERE id IN
    (SELECT cliente_id FROM encargos WHERE coche_id 
        IN (SELECT id FROM coches WHERE modelo LIKE '%Ranchera%'));

/*
 * Ejercicio 19.- Obtener vendedores con dos o más clientes
 */

SELECT * FROM empleados WHERE id IN 
    (SELECT empleado_id FROM clientes GROUP BY empleado_id HAVING COUNT(id) >= 2);

/*
 * Ejercicio 20.- Selecionar el grupo en el quetrabaja el vendedor con mayor salario y
 * mostrar el nombre del grupo
 */

SELECT * FROM grupos WHERE id IN 
    (SELECT grupo_id FROM empleados WHERE sueldo = 
        (SELECT MAX(sueldo) FROM empleados ));

SELECT * FROM empleados ORDER BY sueldo DESC;