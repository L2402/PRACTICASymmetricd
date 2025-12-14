CREATE TABLE peliculas (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255),
    lanzamiento DATE,
    precio DECIMAL(10,2),
    disponible BOOLEAN
);

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    correo VARCHAR(255)
);

CREATE TABLE alquileres (
    id SERIAL PRIMARY KEY,
    cliente_id INT,
    pelicula_id INT,
    fecha_alquiler DATE
);

CREATE TABLE devoluciones (
    id SERIAL PRIMARY KEY,
    alquiler_id INT,
    fecha_devolucion DATE
);
