CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    lanzamiento DATE,
    precio DECIMAL(10,2),
    disponible BOOLEAN
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    correo VARCHAR(255)
);

CREATE TABLE alquileres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    pelicula_id INT,
    fecha_alquiler DATE
);

CREATE TABLE devoluciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    alquiler_id INT,
    fecha_devolucion DATE
);
