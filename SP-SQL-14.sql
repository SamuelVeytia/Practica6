--PROCEDIMIENTO ALMACENADO DE INSERT 
CREATE PROCEDURE  sp_insertautores
@nombre_autor VARCHAR(100),
@pais_origen VARCHAR(100)

AS
BEGIN

	INSERT INTO Autores(nombre, pais_origen)
	VALUES (@nombre_autor, @pais_origen)

END;

----EJECUCION DEL PROCEDIMIENTO ALMACENADO
EXEC sp_insertautores @nombre_autor ='Carolina Alvarez', @pais_origen = 'Colombia';
EXEC sp_insertautores @nombre_autor ='Gabriela Lopez', @pais_origen = 'Brasil';
EXEC sp_insertautores @nombre_autor ='José Gregorio', @pais_origen = 'Tulancingo';

select * from Autores

-----PROCEDIMIENTO ALMACENADO DE UPDATE 


CREATE PROCEDURE  sp_updatecomics
@id_comic bigint,
@nombre VARCHAR(100),
@año DATE,
@precio DECIMAL(10,2)

AS
BEGIN

	UPDATE comics
	SET nombre = @nombre,
	año = @año,
	precio = @precio
	WHERE  id_comic = @id_comic

END;


----EJECUCION DEL PROCEDIMIENTO ALMACENADO
EXEC sp_updatecomics @id_comic = '1', @nombre='Prueba ejemplo 1', @año = '2024-06-29', @precio = '34.50';
EXEC sp_updatecomics @id_comic = '2', @nombre='Prueba ejemplo 2', @año = '2024-06-29', @precio = '35.50';
EXEC sp_updatecomics @id_comic = '3', @nombre='Prueba ejemplo 3', @año = '2024-06-29', @precio = '36.50';


select * from comics



-----PROCEDIMIENTO ALMACENADO DE DELETE


CREATE PROCEDURE  sp_deleteclientes
@id_cliente bigint
AS
BEGIN
	BEGIN 
	DELETE CC 
	FROM comic_compras CC 
	inner join compras c ON CC.id_compra = c.id_compra
	WHERE c.id_cliente = @id_cliente;

	
    DELETE FROM compras
    WHERE id_cliente = @id_cliente;

   DELETE FROM Clientes
   WHERE id_cliente = @id_cliente;



	DELETE FROM clientes
	WHERE id_cliente = @id_cliente;


	END
END

----EJECUCION DEL PROCEDIMIENTO ALMACENADO

EXEC sp_deleteclientes @id_cliente = 1;
EXEC sp_deleteclientes @id_cliente = 2;
EXEC sp_deleteclientes @id_cliente = 3;


SELECT * FROM clientes


-----------PROCEDIMIENTO ALMACENADO PARA JOINS

CREATE PROCEDURE  sp_querycompras
@Fecha_compra DATE

AS
BEGIN

	SELECT
	cm.nombre,
	cm. precio,
	a.nombre as Autor,
	c.fecha_compra
	FROM
	compras c
	LEFT JOIN comics cm ON c.id_comic = cm.id_comic
	LEFT JOIN Autores a ON cm.id_autor = a.id_autor

	WHERE fecha_compra = @Fecha_compra

END;


EXEC sp_querycompras @Fecha_compra = '2023-04-25';
EXEC sp_querycompras @Fecha_compra = '2023-05-30';
EXEC sp_querycompras @Fecha_compra = '2023-07-05';



