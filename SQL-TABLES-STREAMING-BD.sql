

------------------------- CREAR TABLAS 


CREATE TABLE Usuarios (
	UsuarioID INT IDENTITY (1,1) PRIMARY KEY,
	Nombre NVARCHAR(100) NOT NULL,
	Email NVARCHAR(100) NOT  NULL UNIQUE,
	Pass NVARCHAR(100) NOT NULL,
	FechaRegistro DATE NOT NULL DEFAULT GETDATE()
);

CREATE TABLE Peliculas(
	PeliculaID INT IDENTITY(1,1) PRIMARY KEY,
	Titulo NVARCHAR(100) NOT NULL,
	Genero NVARCHAR(50),
	FechaEstreno DATE
);

CREATE TABLE Suscripciones (
	SuscripcionID INT IDENTITY(1,1) PRIMARY KEY,
	UsuarioID INT NOT NULL,
	FechaInicio DATE NOT NULL,
	FechaFin DATE,
	Tipo NVARCHAR(50),
	FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

CREATE TABLE HistorialVisualizacion (
	HistorialID INT IDENTITY(1,1) PRIMARY KEY,
	UsuarioID INT NOT NULL,
	PeliculaID INT NOT NULL,
	FechaVisualizacion DATETIME NOT NULL DEFAULT GETDATE()
	FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
	FOREIGN KEY(PeliculaID) REFERENCES Peliculas(PeliculaID)
);


--------- INSERTS

INSERT INTO Usuarios (Nombre, Email,Pass) VALUES 
('Samuel Veytia', 'samvey@gmail.com','password'),
('Axel Ramirez', 'axel@gmail.com','password'),
('Ivan Morales', 'ivan@gmail.com','password'),
('Jose Cabrera', 'jose@gmail.com','password'),
('Abraham Navor', 'navor@gmail.com','password'),
('Yarely Calderon', 'yarely@gmail.com','password'),
('Roberto Resendiz', 'roberto@gmail.com','password'),
('Karen Perez', 'karen@gmail.com','password'),
('Estrella Aguillon', 'estrella@gmail.com','password'),
('Domingo Araujo', 'domi@gmail.com','password');

select * from Usuarios

INSERT INTO Peliculas (Titulo, Genero, FechaEstreno) VALUES 
('Kung Fu panda', 'Animada', '2008-06-20'),
('Whiplash', 'Cine indi', '2014-01-16'),
('Blade Runner 2049', 'Ciencia ficción', '2017-10-05'),
('Forrest Gump', 'Drama', '1994-07-06'),
('La La Land', 'Musical', '2016-12-09'),
('Straight Outta Compton', 'Biografía', '2015-08-14'),
('Kung Fu Panda 2', 'Animación', '2011-05-26'),
('Crazy, Stupid, Love.', 'Comedia romántica', '2011-07-29'),
('El Diario de una Pasión', 'Romance', '2004-06-25'),
('Avatar', 'Ciencia ficción', '2009-12-18'),
('La Vida es Bella', 'Drama', '1997-12-20');

select * from Peliculas

INSERT INTO Suscripciones (UsuarioID, FechaInicio, FechaFin, Tipo) VALUES 
(1, '2024-01-01', '2024-12-31', 'Anual'),
(2, '2024-02-01', NULL, NULL),
(3, '2024-03-01', '2024-06-30', 'Mensual'),
(4, '2024-04-01', NULL, NULL),
(5, '2024-05-01', '2024-11-30', 'Mensual'),
(6, '2024-06-01', '2025-05-31', 'Anual'),
(7, '2024-07-01', '2024-07-31', 'Mensual');

select * from Suscripciones

INSERT INTO HistorialVisualizacion (UsuarioID, PeliculaID)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 11),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9);

select * from HistorialVisualizacion

select * from View_global