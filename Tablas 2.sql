use sportexpress3;

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
    ID_Marca INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor),
    FOREIGN KEY (ID_Marca) REFERENCES Marcas(ID_Marca)
);

-- Creación de la tabla de Pedidos
CREATE TABLE Pedidos (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    ID_Cliente INT,
    ID_Empleado INT,
    ID_MetodoPago INT,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado),
    FOREIGN KEY (ID_MetodoPago) REFERENCES MetodosPago(ID_MetodoPago)
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

-- Creación de la tabla de Marcas
CREATE TABLE Marcas (
    ID_Marca INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

-- Creación de la tabla de Métodos de Pago
CREATE TABLE MetodosPago (
    ID_MetodoPago INT AUTO_INCREMENT PRIMARY KEY,
    Descripcion VARCHAR(100) NOT NULL
);

-- Creación de la tabla de Envíos
CREATE TABLE Envios (
    ID_Envio INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido INT,
    FechaEnvio DATE NOT NULL,
    Estado VARCHAR(50),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido)
);

-- Creación de la tabla de Valoraciones
CREATE TABLE Valoraciones (
    ID_Valoracion INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    ID_Producto INT,
    Puntuacion INT NOT NULL,
    Comentario TEXT,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);
