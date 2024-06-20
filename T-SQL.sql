--TSQL
--declarar variables
/*
declare @idCliente int

--inicializar o asignar valor

set @idCliente = 8

--if 
--IF @idCliente = 8
	--select * from clientes where id_cliente = @idCliente

declare @edad int
set @idCliente = 9
set @edad = 8

IF @idCliente = 9
BEGIN
	set @edad = 25 
	select * from clientes where id_cliente = @idCliente
	print @edad 
	IF EXISTS(select * from clientes where id_cliente = 10)
		print'si existe'
END
ELSE 
BEGIN
print 'Error:'
print 'id no autorizado para la consulta'
END
*/

--WHILE 
/*
declare @contador int  = 0

WHILE @contador <= 10
BEGIN 
	print @contador
	set @contador = @contador + 1
END


--Return


declare @contador int  = 0

WHILE @contador <= 10
BEGIN 
	print @contador
	set @contador = @contador + 1
	IF @contador = 3 
		BREAK
	print('Hola mundo')
END
print ('Aquí continua el flujo')

BEGIN TRY
	set @contador = 'Samuel Veytia'
END TRY
BEGIN CATCH 
	print ('La variable contador solo acepta valores enteros')
END CATCH
print ('Soy otra consulta')
print('yo también')

*/

------ CASE 

declare @valor int
declare @resultado char(10) = ''

set @valor = 20
set @resultado = (CASE WHEN @valor = 10 THEN 'ROJO'
					   WHEN @valor = 20 THEN 'MORADO'
					   WHEN @valor = 30 THEN 'NEGRO'
					   ELSE 'GRIS'
					   END)
print @resultado


select * , (CASE WHEN disponibilidad  = 1 THEN 'VERDE'
			     WHEN disponibilidad = 0 THEN 'ROJO'
				 ELSE 'NEGRO' END) AS INDICADOR
				 FROM inventario