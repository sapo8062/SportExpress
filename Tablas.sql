
use sportexpress;

-- Creación de la tabla de Clientes
CREATE TABLE Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Telefono VARCHAR(15)
);

-- Creación de la tabla de Productos
CREATE TABLE Productos (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    ID_Categoria INT,
    ID_Proveedor INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor)
);

-- Creación de la tabla de Pedidos
CREATE TABLE Pedidos (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    ID_Cliente INT,
    ID_Empleado INT,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado)
);

-- Creación de la tabla de Empleados
CREATE TABLE Empleados (
    ID_Empleado INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Posicion VARCHAR(50)
);

-- Creación de la tabla de Categorías
CREATE TABLE Categorias (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion TEXT
);

-- Creación de la tabla de Proveedores
CREATE TABLE Proveedores (
    ID_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Contacto VARCHAR(100)
);

-- Creación de la tabla intermedia para Pedidos y Productos (Detalle_Pedido)
CREATE TABLE Detalle_Pedido (
    ID_Pedido INT,
    ID_Producto INT,
    Cantidad INT NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto),
    PRIMARY KEY (ID_Pedido, ID_Producto)
);
