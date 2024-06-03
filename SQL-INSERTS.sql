INSERT INTO clientes (nombre, fecha_compra, total) VALUES
('Juan Pérez', '2023-01-15', 150.75),
('María López', '2023-02-20', 200.50),
('Carlos García', '2023-03-10', 75.00),
('Ana Rodríguez', '2023-04-25', 300.00),
('Luis Fernández', '2023-05-30', 50.25),
('Elena Gómez', '2023-06-15', 120.00),
('Ricardo Sánchez', '2023-07-05', 180.40);

INSERT INTO comics (id_comic, nombre, año, precio) VALUES
(1, 'Spider-Man: Homecoming', '2017-07-07', 15.99),
(2, 'Batman: Year One', '1987-02-01', 12.50),
(3, 'Superman: Red Son', '2003-07-15', 14.75),
(4, 'X-Men: Days of Future Past', '1981-01-15', 10.00),
(5, 'The Walking Dead: Issue #1', '2003-10-08', 25.00),
(6, 'Watchmen', '1987-09-01', 20.00),
(7, 'V for Vendetta', '1988-03-01', 18.50);

INSERT INTO comics (nombre, año, precio) VALUES
('Spider-Man: Homecoming', '2017-07-07', 15.99),
('Batman: Year One', '1987-02-01', 12.50),
('Superman: Red Son', '2003-07-15', 14.75),
('X-Men: Days of Future Past', '1981-01-15', 10.00),
('The Walking Dead: Issue #1', '2003-10-08', 25.00),
('Watchmen', '1987-09-01', 20.00),
('V for Vendetta', '1988-03-01', 18.50);


INSERT INTO compras (id_cliente, id_comic, fecha_compra, año) VALUES
(1, 1, '2023-01-15', '2023-01-15 10:00:00'),
(2, 2, '2023-02-20', '2023-02-20 11:00:00'),
(3, 3, '2023-03-10', '2023-03-10 12:00:00'),
(4, 4, '2023-04-25', '2023-04-25 13:00:00'),
(5, 5, '2023-05-30', '2023-05-30 14:00:00'),
(6, 6, '2023-06-15', '2023-06-15 15:00:00'),
(7, 7, '2023-07-05', '2023-07-05 16:00:00');

INSERT INTO inventario (id_comic, cantidad, disponibilidad) VALUES
(1, 2, 1),
(2, 2, 1),
(3, 2, 1),
(4, 2, 1),
(5, 2, 1),
(6, 0, 0),
(7, 0, 0);


INSERT INTO comic_compras (id_compra, id_comic, cantidad) VALUES
(100, 1, 1),
(101, 2, 2),
(102, 3, 1),
(103, 4, 3),
(104, 5, 1),
(105, 6, 4),
(106, 7, 2);