

--Explorar la propiedades de una Base de Datos

EXEC sp_helpdb
EXEC sp_helpdb 'PlataformaStreaming'

--Explorar las propiedades de un objeto de la BD 
EXEC sp_help 'Peliculas'

--Llaves primarias de una tabla
EXEC sp_helpindex 'Peliculas'

--Infromación de los usuarios y procesos actuales
EXEC sp_who

--rendimiento del sevidor
EXEC sp_monitor

--Espacio usado por la BD
EXEC sp_spaceused

--Puerto de escucha del SQL SERVER 
EXEC sp_readerrorlog 0,1


-----EJERCICIOS DE CLASE 

CREATE PROCEDURE sp_ObtenerHistorial
	@usuarioID int
AS
BEGIN

SELECT h.HistorialID, p.Titulo, h.FechaVisualizacion
FROM HistorialVisualizacion h
JOIN Peliculas p ON h.PeliculaID = p.PeliculaID
WHERE h.UsuarioID = @usuarioID
ORDER BY h.FechaVisualizacion DESC

END;


---EJECUCIÓN DEL PROCEDIMIENTO ALMACENADO
EXEC sp_ObtenerHistorial 1;





-----SP para insertar películas

CREATE PROCEDURE  sp_insertpeliculas
@titulo NVARCHAR(100),
@genero NVARCHAR(50),
@fecha_estreno DATE
AS
BEGIN

	INSERT INTO Peliculas(Titulo, Genero, FechaEstreno)
	VALUES (@titulo, @genero,@fecha_estreno)

END;

----EJECUCION DEL PROCEDIMIENTO ALMACENADO
EXEC sp_insertpeliculas @titulo='Intensamente', @genero = 'Infantil', @fecha_estreno = '2024-06-13';

SELECT * FROM Peliculas