/* Crear base de datos */

CREATE DATABASE IF NOT EXISTS concesionario;
USE concesionario;
CREATE TABLE coches (
    id    int(10) auto_increment not null,
    modelo varchar(100) not null, 
    marca varchar(50) not null, 
    precio int(20) not null, 
    stock int(255) not null, 
    CONSTRAINT pk_coches PRIMARY KEY(id)
)ENGINE=InnoDB;

CREATE TABLE grupos (
    id    int(10) auto_increment not null,
    nombre varchar(100) not null, 
    ciudad varchar(100), 
    CONSTRAINT pk_grupos PRIMARY KEY(id)
)ENGINE=InnoDB;

CREATE TABLE empleados (
    id    int(10) auto_increment not null,
    grupo_id int(10) not null,
    jefe int(10),
    nombre varchar(100) not null,
    apellidos varchar(100),
    cargo varchar(50) not null,
    fecha_alta date,
    sueldo float(20,2),
    comision float(20,2) not null, 
    CONSTRAINT pk_empleados PRIMARY KEY(id),
    CONSTRAINT fk_empleado_grupo FOREIGN KEY(grupo_id) REFERENCES grupos (id),
    CONSTRAINT fk_empelado_jefe FOREIGN KEY(jefe) REFERENCES empleados (id)
)ENGINE=InnoDB;

CREATE TABLE clientes (
    id    int(10) auto_increment not null,
    empleado_id int(10),
    nombre varchar(150) not null,
    ciudad varchar(100),
    gastado float(50,2),
    CONSTRAINT pk_clientes PRIMARY KEY(id),
    CONSTRAINT fk_cliente_empleado FOREIGN KEY(empleado_id) REFERENCES empleados (id)
)ENGINE=InnoDB;

CREATE TABLE encargos (
    id    int(10) auto_increment not null,
    cliente_id int(10) not null,
    coche_id int(10) not null,
    cantidad int(100),
    fecha_alta date,
    CONSTRAINT pk_encargos PRIMARY KEY(id),
    CONSTRAINT fk_encargo_cliente FOREIGN KEY(cliente_id) REFERENCES clientes (id),
    CONSTRAINT fk_encargo_coche FOREIGN KEY(coche_id) REFERENCES coches (id)
)ENGINE=InnoDB;

/* Rellenar base de datos */

/* Tabla coches */
INSERT  INTO coches VALUES(null, 'Clio', 'Renault', 12000, 13);
INSERT  INTO coches VALUES(null, 'GT', 'Toyota', 32000, 4);
INSERT  INTO coches VALUES(null, 'Panda', 'Seat', 14000, 10);
INSERT  INTO coches VALUES(null, 'Cayene', 'Porche', 52000, 6);
INSERT  INTO coches VALUES(null, 'Spider', 'Ferrari', 62000, 7);
INSERT  INTO coches VALUES(null, 'Ranchera', 'Mercedes', 42000, 25);
/* Tabla grupos */
INSERT  INTO grupos VALUES(null, 'Vendedores', 'Madrid');
INSERT  INTO grupos VALUES(null, 'Vendedores', 'Valencia');
INSERT  INTO grupos VALUES(null, 'Vendedores', 'Barcelona');
INSERT  INTO grupos VALUES(null, 'Mecanicos', 'Madrid');
INSERT  INTO grupos VALUES(null, 'Mecanicos', 'Valencia');
INSERT  INTO grupos VALUES(null, 'Mecanicos', 'Barcelona');
INSERT  INTO grupos VALUES(null, 'Oficina', 'Madrid');
INSERT  INTO grupos VALUES(null, 'Oficina', 'Valencia');
INSERT  INTO grupos VALUES(null, 'Oficina', 'Barcelona');

/* Tabla empleados */
INSERT  INTO empleados VALUES(null, 1, 1, 'Jorge', 'García', 'Responsable tienda', CURDATE(), 30000, 4);
INSERT  INTO empleados VALUES(null, 1, 1, 'Alfredo', 'Setz', 'Tienda', CURDATE(), 25000, 4);
INSERT  INTO empleados VALUES(null, 4, 3, 'Luís', 'Fernández', 'Responsable taller', CURDATE(), 30000, 4);
INSERT  INTO empleados VALUES(null, 4, 3, 'Luisa', 'García', 'Taller', CURDATE(), 25000, 4);
INSERT  INTO empleados VALUES(null, 7, 5, 'Miriam', 'Clos', 'Responsable oficina', CURDATE(), 30000, 4);
INSERT  INTO empleados VALUES(null, 7, 5, 'Alberto', 'Dexter', 'Oficina', CURDATE(), 25000, 4);
INSERT  INTO empleados VALUES(null, 2, 7, 'María', 'Belloch', 'Responsable tienda', CURDATE(), 30000, 4);
INSERT  INTO empleados VALUES(null, 2, 7, 'Carlos', 'Casany', 'Tienda', CURDATE(), 25000, 4);
INSERT  INTO empleados VALUES(null, 5, 9, 'Rita', 'Díaz', 'Responsable taller', CURDATE(), 30000, 4);
INSERT  INTO empleados VALUES(null, 5, 9, 'Luisa', 'Gómez', 'Taller', CURDATE(), 25000, 4);
INSERT  INTO empleados VALUES(null, 8, 11, 'Marta', 'Clotildes', 'Responsable oficina', CURDATE(), 30000, 4);
INSERT  INTO empleados VALUES(null, 8, 11, 'Alberto', 'Justin', 'Oficina', CURDATE(), 25000, 4);
INSERT  INTO empleados VALUES(null, 3, 13, 'Roberta', 'Querla', 'Responsable tienda', CURDATE(), 30000, 4);
INSERT  INTO empleados VALUES(null, 3, 13, 'Lázaro', 'Cordoba', 'Tienda', CURDATE(), 25000, 4);
INSERT  INTO empleados VALUES(null, 6, 15, 'Luís', 'Carrño', 'Responsable taller', CURDATE(), 30000, 4);
INSERT  INTO empleados VALUES(null, 6, 15, 'Lourdes', 'Castro', 'Taller', CURDATE(), 25000, 4);
INSERT  INTO empleados VALUES(null, 9, 17, 'Blanca', 'Dartte', 'Responsable oficina', CURDATE(), 30000, 4);
INSERT  INTO empleados VALUES(null, 9, 117, 'Manuel', 'Cuenca', 'Oficina', CURDATE(), 25000, 4);
/* Tabla clientes */
INSERT INTO clientes VALUES(null, 2, 'Carmina Burana Madrid', 'Madrid', 48000,CURDATE());
INSERT INTO clientes VALUES(null, 2, 'Taxis Madrid', 'Madrid', 208000,CURDATE());
INSERT INTO clientes VALUES(null, 3, 'Carlos Andrade', 'Madrid', 62000,CURDATE());
INSERT INTO clientes VALUES(null, 7, 'Carmina Burana Valencia', 'Valencia', 72000,CURDATE());
INSERT INTO clientes VALUES(null, 7, 'Taxis Valencia', 'Valencia', 104000,CURDATE());
INSERT INTO clientes VALUES(null, 17, 'Pedro Jocosa', 'Valencia', 42000,CURDATE());
INSERT INTO clientes VALUES(null, 13, 'Carmina Burana Barcelona', 'Barcelona', 96000,CURDATE());
INSERT INTO clientes VALUES(null, 13, 'Taxis Barcelona', 'Barcelona', 260000,CURDATE());
INSERT INTO clientes VALUES(null, 16, 'Dario Pastor', 'Barcelona', 42000,CURDATE());
/* Tabla encargos */
INSERT INTO encargos VALUES(NULL, 1, 1, (4), CURDATE());
INSERT INTO encargos VALUES(NULL, 2, 4, (4), CURDATE());
INSERT INTO encargos VALUES(NULL, 3, 5, (1), CURDATE());
INSERT INTO encargos VALUES(NULL, 4, 1, (6), CURDATE());
INSERT INTO encargos VALUES(NULL, 5, 4, (2), CURDATE());
INSERT INTO encargos VALUES(NULL, 6, 6, (1), CURDATE());
INSERT INTO encargos VALUES(NULL, 7, 1, (8), CURDATE());
INSERT INTO encargos VALUES(NULL, 8, 4, (5), CURDATE());
INSERT INTO encargos VALUES(NULL, 9, 6, (1), CURDATE());

/*
 * 2.- Modificar la comisión de los vendedores y ponerla al 10% cuando ganan más de 50000
 */

UPDATE empleados SET sueldo= 90000 WHERE nombre='Alfredo';
UPDATE empleados SET sueldo= 80000 WHERE nombre='Carlos';
UPDATE empleados SET sueldo= 70000 WHERE nombre='Luisa';
UPDATE empleados SET sueldo= 190000 WHERE nombre='Lázaro';

UPDATE empleados SET comision = 10 WHERE sueldo >= 50000;

/*
 * 3.- Incrementar el precio de todos los coches en un 2%
 */

UPDATE coches SET precio = (precio * 0.02) + precio;
UPDATE coches SET precio = precio*1.02;

/*
 * 4.-Sacar a todos los vendedores sea posterior al 1 de Julio de 2018
 */

SELECT * FROM empleados WHERE fecha_alta > '2018-07-01';
SELECT * FROM empleados WHERE fecha_alta < '2018-07-01';

/*
 * 5.-Listar todos los vendedores y mostrar nombre y los dias que lleva registrado
 */

 SELECT nombre, DATEDIFF(CURDATE(), fecha_alta) as 'dias_alta' FROM empleados;

 /* 
 * 6.-Visualizar el nombre y los apellidos de los empleados en una misma columna,
 * fecha de registro y el día de la semana en que se registraron
 */

SELECT CONCAT(nombre, ' ', apellidos) AS 'Empleado', fecha_alta,  DAYOFWEEK(fecha_alta) AS 'Día de la semana' FROM empleados; 
SELECT CONCAT(nombre, ' ', apellidos) AS 'Empleado', fecha_alta,  DAYNAME(fecha_alta) AS 'Día' FROM empleados;

/*
 * 7.-Mostrar el nombre y el salario de los empleados con cargo de Oficina
 */

 SELECT nombre, sueldo FROM empleados WHERE  cargo =  'Oficina';

 /*
 * 8.-Visualizar todos los coches en cuya marca exista la letra a y cuyo modelo empemiece por F. 
 */

SELECT * FROM coches WHERE marca LIKE '%a%' AND modelo LIKE 'S%';
SELECT * FROM coches WHERE marca LIKE '%a%' AND modelo LIKE '%a%';
SELECT * FROM coches WHERE marca LIKE '%r%' OR modelo LIKE '%r%';

/*
 * 9.-Mostrar todos los vendedores del grupo nº dos ordenados por salario de mayor  a menor
 */

SELECT * FROM empleados WHERE grupo_id = 2 ORDER BY sueldo desc;
SELECT * FROM empleados WHERE grupo_id = 2 ORDER BY sueldo;

/*
 * 10.-Visualizar los apellidos de los vendedores su fecha de alta y su numero de grupo,
 * ordenados por fecha descendente de los cuatro últimos
 */

SELECT apellidos, fecha_alta, grupo_id FROM empleados ORDER BY fecha_alta desc LIMIT 4;
SELECT apellidos, fecha_alta, grupo_id FROM empleados ORDER BY id desc LIMIT 4;