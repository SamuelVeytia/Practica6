
--------------- SP PARA INSERTAR REGISTRO EN HISTORIAL DE VISUALIZACIÓN Y PELÍCULA

CREATE PROCEDURE sp_transaccion_insertpeli_hist
@pelicula_id INT,
@titulo NVARCHAR(100),
@genero NVARCHAR(50),
@fecha_estreno DATE,
@historial_id INT,
@usuario_id INT,
@fecha_visualizacion DATETIME

AS 
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY

		INSERT INTO Peliculas(Titulo, Genero, FechaEstreno)
		VALUES ( @titulo, @genero, @fecha_estreno)

		INSERT INTO HistorialVisualizacion(UsuarioID, PeliculaID, FechaVisualizacion)
		VALUES (@usuario_id, @pelicula_id, @fecha_visualizacion);


		COMMIT TRANSACTION
	END TRY

BEGIN CATCH	

	ROLLBACK;
	DECLARE @ErrorMessage NVARCHAR(4000);
	SET @ErrorMessage = ERROR_MESSAGE();
	PRINT @ErrorMessage;

END CATCH;

END


EXEC sp_transaccion_insertpeli_hist @pelicula_id = 13, @titulo = 'NUEVA PELICULA', @genero ='EJEMPLO', @fecha_estreno = '2024-07-03',@historial_id = 19, @usuario_id= '2', @fecha_visualizacion = '2024-07-03 12:12:12';


select * from Peliculas
select * from HistorialVisualizacion



-------------------------------------------

-->SP PARA INSERTAR USUARIO, SUSCRIPCIÓN Y VISUALIZACIÓN 

create procedure sp_insert_usuario_sus_vis
@Nombre nvarchar(100),
@Email nvarchar(100),
@Pass nvarchar(100),
@FechaRegistro date,
@FechaInicio date,
@FechaFin date,
@Tipo nvarchar(50),
@PeliculaID int,
@FechaVisualizacion datetime
as
begin
begin transaction
begin try
	insert into Usuarios(Nombre, Email, Pass, FechaRegistro)
	values (@Nombre, @Email, @Pass, @FechaRegistro)

	DECLARE @UsuarioID INT;
	SET @UsuarioID = SCOPE_IDENTITY(); 

	insert into Suscripciones(UsuarioID, FechaInicio, FechaFin, Tipo)
	values (@UsuarioID, @FechaInicio, @FechaFin, @Tipo)

	insert into HistorialVisualizacion(UsuarioID, PeliculaID, FechaVisualizacion)
	values (@UsuarioID, @PeliculaID, @FechaVisualizacion)
	commit transaction
end try
		
begin catch
rollback

declare @ErrorMessage NVARCHAR(4000);
set @ErrorMessage= ERROR_MESSAGE();
print @ErrorMessage;

end catch
end;


exec sp_insert_usuario_sus_vis 'Katherine', 'kath@hotmail.com', 'genshin', '2024-06-04', '2024-07-04', '2024-08-04', 'Mensual', 8, '2024-06-22 00:00:00'

select * from Usuarios

select * from Suscripciones

select * from HistorialVisualizacion


--SP PARA UPDATE CORREO- USUARIO Y SUSCRIPCIÓN 

create procedure sp_updatecorreo_sus

@UsuarioID int,
@Email nvarchar (100),
@Tipo nvarchar(50)

as
begin
begin transaction
begin try


	update Usuarios set Email= @Email
	where UsuarioID=@UsuarioID

	update Suscripciones set Tipo=@Tipo
	where UsuarioID=@UsuarioID


	commit transaction
end try
		
begin catch

rollback
declare @ErrorMessage NVARCHAR(4000);
set @ErrorMessage= ERROR_MESSAGE();
print @ErrorMessage;

end catch
end;

exec sp_updatecorreo_sus 14, 'andrea@hotmail.com', 'Anual'

select * from Usuarios

select * from Suscripciones




---SP PARA DELETE PELICULA Y REGISTROS EN HISTORIAL

create procedure sp_deletepeli_registro
@Pelicula_id INT 

AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
	
	DELETE FROM HistorialVisualizacion
    WHERE PeliculaID = @Pelicula_id;

     
    DELETE FROM Peliculas
    WHERE PeliculaID = @Pelicula_id; 



	commit transaction
END TRY
		
BEGIN CATCH 

ROLLBACK
DECLARE @ErrorMessage NVARCHAR(4000);
set @ErrorMessage= ERROR_MESSAGE();
print @ErrorMessage;

END CATCH
END;

EXEC sp_deletepeli_registro @Pelicula_id = 8;

select * from Peliculas
select * from HistorialVisualizacion


-------------SP PARA DELETE USUARIO Y REGISTROS
CREATE PROCEDURE sp_deleteusuario_regist
@UsuarioID INT

AS

BEGIN
BEGIN TRANSACTION;
BEGIN TRY
 
	DELETE FROM HistorialVisualizacion
	WHERE UsuarioID = @UsuarioID;


    DELETE FROM Suscripciones
    WHERE UsuarioID = @UsuarioID;

    DELETE FROM Usuarios
    WHERE UsuarioID = @UsuarioID;

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH

ROLLBACK TRANSACTION;
DECLARE @ErrorMessage NVARCHAR(4000);
SET @ErrorMessage = ERROR_MESSAGE();
PRINT @ErrorMessage;

END CATCH;
END;

EXEC sp_deleteusuario_regist @UsuarioID = 8;

select * from Usuarios
select * from Suscripciones
select * from HistorialVisualizacion
