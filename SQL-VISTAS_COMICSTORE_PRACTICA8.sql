---------------------EJERCICIO 1
CREATE VIEW Vista_ComprasComic AS 
SELECT cc.id_cc, cc.cantidad, c.nombre AS nombre_comic, cm.id_compra, cm.fecha_compra, c.precio AS total
FROM comic_compras cc
JOIN comics c ON c.id_comic = cc.id_comic
JOIN compras cm ON cm.id_compra = cc.id_compra

select * from Vista_ComprasComic

---------------------EJERCICIO 2

CREATE VIEW Vista_ComicsComprados AS 
SELECT c.id_cliente, c.nombre AS nombre_cliente, cc.cantidad AS cantidad_comics_comprados
FROM clientes c 
JOIN comic_compras cc ON cc.id_cc = cc.id_cc

SELECT * FROM Vista_ComicsComprados




