

--PROCEDIMIENTO ALMACENADO DE INSERT 
CREATE PROCEDURE  sp_insertusuarios
@nombre NVARCHAR(100),
@Email NVARCHAR(100),
@Pass NVARCHAR(100)
AS
BEGIN

	INSERT INTO Usuarios(Nombre, Email, Pass)
	VALUES (@nombre, @Email,@Pass)

END;

----EJECUCION DEL PROCEDIMIENTO ALMACENADO
EXEC sp_insertusuarios @nombre='Lalin Bombin', @Email = 'Laloidk@gmail.com', @Pass = 'contraseña';
EXEC sp_insertusuarios @nombre='Saul Veytia', @Email = 'saulvey@gmail.com', @Pass = 'contraseña12';
EXEC sp_insertusuarios @nombre='Haziel Veytia', @Email = 'haz@gmail.com', @Pass = '12345sdj';

select * from Usuarios


----PROCEDIMIENTO ALMCENADO PARA EDITAR SUSCRIPCIÓN
CREATE PROCEDURE  sp_updatesuscripcion
@SuscripcionID INT,
@FechaInicio DATE,
@FechaFin DATE,
@Tipo NVARCHAR(50)
AS
BEGIN

	UPDATE Suscripciones
	SET FechaInicio = @FechaInicio,
	FechaFin = @FechaFin,
	Tipo = @Tipo
	WHERE  SuscripcionID = @SuscripcionID

END;

EXEC sp_updatesuscripcion @SuscripcionID = '1', @FechaInicio='2023-06-12', @FechaFin = '2023-07-12', @Tipo = 'Mensual';
EXEC sp_updatesuscripcion @SuscripcionID = '2', @FechaInicio='2023-06-12', @FechaFin = '2023-06-12', @Tipo = 'Anual';
EXEC sp_updatesuscripcion @SuscripcionID = '3', @FechaInicio='2023-06-01', @FechaFin = '2023-06-01', @Tipo = 'Anual';

select * from Suscripciones

---------PROCEDIMIENTO ALMACENADO PARA ELIMINAR UN REGISTRO DE HISTORIAL

CREATE PROCEDURE  sp_deletehistorial
@HistorialID INT
AS
BEGIN

	DELETE FROM HistorialVisualizacion
	WHERE HistorialID = @HistorialID

END;

EXEC sp_deletehistorial @HistorialID = '1';
EXEC sp_deletehistorial @HistorialID = '19';
EXEC sp_deletehistorial @HistorialID = '20';

SELECT * FROM HistorialVisualizacion


------PROCEDIMIENTO ALMACENADO PARA CONSULTAR USUARIOS


CREATE PROCEDURE  sp_queryusuarios
@Tipo NVARCHAR(50)

AS
BEGIN

	SELECT
	u.UsuarioID,
	u.Nombre,
	u.Email,
	s.FechaInicio,
	s.FechaFin,
	s.Tipo
	FROM
	Usuarios u
	LEFT JOIN Suscripciones s ON u.UsuarioID = s.UsuarioID

	WHERE s.Tipo = @Tipo

END;


EXEC sp_queryusuarios @Tipo = 'mensual';
EXEC sp_queryusuarios @Tipo = 'Anual';



----------------------PROCEDIMIENTO ALMACENADO PARA CONSULTAR PELICULAS



CREATE PROCEDURE  sp_querypeliculas
@Genero NVARCHAR(50)

AS
BEGIN

	SELECT
	h.HistorialID,
	u.Nombre,
	u.Email,
	p.Titulo,
	p.Genero
	FROM
	HistorialVisualizacion h
	LEFT JOIN Usuarios u ON h.UsuarioID = u.UsuarioID
	LEFT JOIN Peliculas p ON h.PeliculaID = p.PeliculaID

	WHERE p.Genero = @Genero

END;

EXEC sp_querypeliculas @Genero = 'Animada';
EXEC sp_querypeliculas @Genero = 'Ciencia ficción';
EXEC sp_querypeliculas @Genero = 'Biografía';

select * from Peliculas