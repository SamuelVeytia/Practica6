
CREATE VIEW VISTA_ClienteCompras AS
SELECT c.id_cliente, c.nombre AS CLIENTE, cm.id_compra, cm.fecha_compra, cc.cantidad as Total
FROM clientes c
JOIN comic_compras cc
ON cc.id_cc = cc.id_cc
LEFT JOIN compras cm
ON c.id_cliente = cm.id_cliente


SELECT * FROM vista_CCCI

