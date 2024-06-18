--TSQL
--declarar variables

declare @idCliente int

--inicializar o asignar valor

set @idCliente = 8

--if 
--IF @idCliente = 8
	--select * from clientes where id_cliente = @idCliente

declare @edad int
set @idCliente = 90
set @edad = 9

IF @idCliente = 9
BEGIN
	set @edad = 25 
	select * from clientes where id_cliente = @idCliente
	print @edad 
END


