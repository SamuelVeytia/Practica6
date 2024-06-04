CREATE TABLE Autores (
id_autor bigint identity(300,1) PRIMARY KEY,
nombre VARCHAR(100),
pais_origen VARCHAR(100)
);


ALTER TABLE comics
ADD id_autor bigint,
FOREIGN KEY (id_autor) REFERENCES Autores(id_autor);



INSERT INTO Autores (nombre, pais_origen) VALUES ('William Washington Salzar', 'Colombia');
INSERT INTO Autores (nombre, pais_origen) VALUES ('Julia Quimal Padington', 'Italia');
INSERT INTO Autores (nombre, pais_origen) VALUES ('Joaquin Quiroz Lopez', 'Argentina');
INSERT INTO Autores (nombre, pais_origen) VALUES ('Travis Jhonson Escobedo', 'Afganistan');


UPDATE comics SET id_autor = 301 WHERE id_comic = 1;
UPDATE comics SET id_autor = 302 WHERE id_comic = 2;
UPDATE comics SET id_autor = 303 WHERE id_comic = 3;
UPDATE comics SET id_autor = 301 WHERE id_comic = 4;




--EJERCICIO 1

select c.nombre, a.nombre, a.pais_origen
from comic_compras 
full join comics c on c.id_comic = c.id_comic
full join Autores a on c.id_autor = c.id_autor





SELECT * FROM Autores


--EJERCICIO 2
select a.nombre, cc.cantidad 
from comic_compras cc
join Autores a on a.id_autor = a.id_autor

