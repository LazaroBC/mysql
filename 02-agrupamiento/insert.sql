#INSERTS PARA usuarios#
INSERT INTO usuarios VALUES(null, 'Victor', 'Ramírez', 'victor@victor.com', '1234', '2019-07-02');
INSERT INTO usuarios VALUES(null, 'Antonio', 'Martínez','antonio@antonio.com','1234','2020-05-03');
INSERT INTO usuarios VALUES(null, 'Lázaro', 'Belloch','lazaro@lazaro.com','1234','2007-06-03');

#INSERTS PARA categorias#
INSERT INTO categorias VALUES(null, 'accion');
INSERT INTO categorias VALUES(null, 'rol');
INSERT INTO categorias VALUES(null, 'deportes');

#INSERTS entradas#

INSERT INTO entradas VALUES(null, 1, 1, 'Novedades del GTA V online', 'Review del GTA 5', CURDATE());
INSERT INTO entradas VALUES(null, 1, 2, 'Novedades del LOL online', 'Review del LOL', CURDATE());
INSERT INTO entradas VALUES(null, 1, 3,'Nuevos jugadores de Fifa 19', 'Review del Fifa 19', CURDATE());

INSERT INTO entradas VALUES(null, 2, 1, 'Novedades del Asassins online', 'Review del Asassins', CURDATE());
INSERT INTO entradas VALUES(null, 2, 2,'Novedades del WOW online', 'Review del WOW', CURDATE());
INSERT INTO entradas VALUES(null, 2, 3,'Nuevos jugadores de PES 19', 'Review del PES 19', CURDATE());

INSERT INTO entradas VALUES(null, 3, 1,'Novedades del CODuty online', 'Review del CODuty', CURDATE());
INSERT INTO entradas VALUES(null, 3, 2,'Novedades del Fornite online', 'Review del Fornite', CURDATE());
INSERT INTO entradas VALUES(null, 3, 3,'Nuevos jugadores de F1 19', 'Review del F1 19', CURDATE());