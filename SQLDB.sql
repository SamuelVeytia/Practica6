CREATE TABLE clientes (
    id_cliente bigint identity(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_compra DATE,
    total DECIMAL(10, 2)
);
CREATE TABLE comics (
    id_comic bigint identity(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    año date,
    precio  DECIMAL(10,2)
);

CREATE TABLE compras (
    id_compra bigint identity(100,1) PRIMARY KEY,
    id_cliente bigint,
	id_comic bigint,
    fecha_compra DATE,
    año datetime,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	FOREIGN KEY (id_comic) REFERENCES comics(id_comic)
);

CREATE TABLE inventario (
    id_inventario bigint identity(200,1) PRIMARY KEY,
    id_comic bigint,
    cantidad bigint,
    disponibilidad binary,
    FOREIGN KEY (id_comic) REFERENCES comics(id_comic)
);

CREATE TABLE comic_compras (
    id_cc bigint identity(1,1) PRIMARY KEY,
    id_compra bigint,
    id_comic bigint,
    cantidad int,
    FOREIGN KEY (id_compra) REFERENCES compras(id_compra),
    FOREIGN KEY (id_comic) REFERENCES comics(id_comic)
);
