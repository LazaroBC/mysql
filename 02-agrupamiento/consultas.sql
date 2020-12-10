# CONSULTAS DE AGRUPAMIENTO#

SELECT titulo, COUNT(titulo) AS 'Nº Entradas', categoria_id FROM entradas GROUP BY categoria_id;

# CONSULTAS DE AGRUPAMIENTO CON CONDICIONES#

SELECT titulo, COUNT(titulo) AS 'Nº Entradas', categoria_id FROM entradas GROUP BY categoria_id HAVING COUNT(titulo) >= 4;

# FUNCIONES DE AGRUPAMIENTO#
/*
 * AVG Sacar la media
 * COUNT Contar el número de elementos
 * MAX Valor máximo del grupo
 * Min Valor mínimo del grupo
 * SUM Sumar todo el contenido del grupo
 */

 SELECT AVG(id) AS 'Media de entradas' FROM entradas;
 SELECT MAX(id) AS 'Usuarios Máximo id', titulo FROM entradas;
 SELECT MIN(id) AS 'Usuarios Mínimo id', titulo FROM entradas;
 SELECT SUM(id) AS 'Usuarios Suma id', titulo FROM entradas;


