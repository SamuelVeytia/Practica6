select c.nombre, i.cantidad
from comics c
join inventario i on i.id_comic = i.id_comic

select p.nombre as nombre_cliente, c.id_compra, k.nombre as nombre_comic, i.cantidad
from compras c
join clientes p on p.id_cliente = p.id_cliente
join comics k on k.id_comic = k.id_comic
join inventario i on i.id_inventario = i.id_inventario

select * from compras

select c.id_compra, k.nombre as nombre_comic, i.cantidad
from compras c
join comics k on k.id_comic = k.id_comic
join inventario i on i.id_inventario = i.id_inventario


select c.nombre as nombre_comic, i.cantidad as cantidad_disponible
from inventario i
join comics c on c.id_comic = c.id_comic


select c.id_comic, c.nombre, c.precio, i.id_inventario, c.id_comic, i.cantidad as cantidad_disponible, i.disponibilidad, cc.id_cc, cc.cantidad,k.id_compra, k.id_comic
from comics c
join inventario i on i.id_inventario = i.id_inventario
join comic_compras cc on cc.id_cc= cc.id_cc
join compras k on k.id_compra = k.id_compra




