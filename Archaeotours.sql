CREATE DATABASE ARCHAEOTOURS;

USE ARCHAEOTOURS;

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20),
    email VARCHAR(20),
    tarjeta_credito VARCHAR(16)
);

CREATE TABLE Lugar (
    id_lugar INT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    codigo_postal INT(5) NOT NULL,
    periodo VARCHAR(30) NOT NULL,
    subperiodo VARCHAR(30),
    descripcion TEXT NOT NULL
);

CREATE TABLE Transaccion (
    id_transaccion INT PRIMARY KEY,
    fecha_transaccion DATE NOT NULL,
    metodo_pago VARCHAR(30) NOT NULL,
    cantidad_pagada DECIMAL(6, 2) NOT NULL,
    codigo_descuento VARCHAR(20)
);

CREATE TABLE Comentario (
    id_comentario INT PRIMARY KEY,
    texto_comentario TEXT,
    valoracion INT CHECK (valoracion >= 0 AND valoracion <= 10),
    hora TIME NOT NULL,
    fecha DATE NOT NULL
);

CREATE TABLE Guia (
    id_guia INT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20),
    email VARCHAR(20) NOT NULL,
    especialidad VARCHAR(20)
);

CREATE TABLE Ruta (
    id_ruta INT PRIMARY KEY,
    descripcion TEXT,
    valoracion INT CHECK (valoracion >= 0 AND valoracion <= 10),
    distancia INT CHECK (distancia >= 0 AND distancia <= 100),
    desnivel INT CHECK (desnivel >= 0 AND desnivel <= 10000)
);

CREATE TABLE Visita_Usuario_Lugar (
    id_usuario INT,
    id_lugar INT,
    PRIMARY KEY (id_usuario, id_lugar),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_lugar) REFERENCES Lugar(id_lugar)
);

CREATE TABLE Tiene_Lugar_Comentario (
    id_lugar INT,
    id_comentario INT,
    PRIMARY KEY (id_lugar, id_comentario),
    FOREIGN KEY (id_lugar) REFERENCES Lugar(id_lugar),
    FOREIGN KEY (id_comentario) REFERENCES Comentario(id_comentario)
);

CREATE TABLE Realiza_Usuario_Transaccion (
    id_usuario INT,
    id_transaccion INT,
    PRIMARY KEY (id_usuario, id_transaccion),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_transaccion) REFERENCES Transaccion(id_transaccion)
);

CREATE TABLE Paga_Transaccion_Guia (
    id_transaccion INT,
    id_guia INT,
    PRIMARY KEY (id_transaccion),
    FOREIGN KEY (id_transaccion) REFERENCES Transaccion(id_transaccion),
    FOREIGN KEY (id_guia) REFERENCES Guia(id_guia)
);

CREATE TABLE Escribe_Usuario_Comentario (
    id_comentario INT,
    id_usuario INT,
    PRIMARY KEY (id_comentario, id_usuario),
    FOREIGN KEY (id_comentario) REFERENCES Comentario(id_comentario),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Contiene_Lugar_Ruta (
    id_lugar INT,
    id_ruta INT,
    PRIMARY KEY (id_lugar, id_ruta),
    FOREIGN KEY (id_lugar) REFERENCES Lugar(id_lugar),
    FOREIGN KEY (id_ruta) REFERENCES Ruta(id_ruta)
);

INSERT INTO Usuario (id_usuario, nombre, apellido1, apellido2, email, tarjeta_credito) VALUES
    (1, 'Juan', 'Gómez', 'López', 'juan_gomez@gmail.com', '1234567890123456'),
    (2, 'María', 'Martínez', 'Sánchez', 'maria_martinez@gmail.com', '9876543210987654'),
    (3, 'Pedro', 'Díaz', 'García', 'pedro_diaz@gmail.com', '6543210987654321'),
    (4, 'Ana', 'González', 'Martínez', 'ana_gonzalez@gmail.com', '8765432109876543'),
    (5, 'Carlos', 'Fernández', 'Pérez', 'carlos_fernandez@gmail.com', '3456789012345678'),
    (6, 'Laura', 'Rodríguez', 'Santos', 'laura_rodriguez@gmail.com', '5678901234567890'),
    (7, 'Miguel', 'López', 'Gómez', 'miguel_lopez@gmail.com', '4321098765432109'),
    (8, 'Elena', 'Sánchez', 'Martín', 'elena_sanchez@gmail.com', '8901234567890123'),
    (9, 'Javier', 'Pérez', 'González', 'javier_perez@gmail.com', '2109876543210987'),
    (10, 'Isabel', 'Martín', 'Díaz', 'isabel_martin@gmail.com', '7890123456789012');

INSERT INTO Lugar (id_lugar, nombre, direccion, codigo_postal, periodo, subperiodo, descripcion) VALUES
    (1, 'Parque Güell', 'Carrer Olot', 08024, 'Modernismo', 'Siglo XX', 'Parque público con elementos arquitectónicos diseñados por Antoni Gaudí.'),
    (2, 'Barrio Gótico', 'Barri Gòtic', 08002, 'Medieval', 'Siglo XIV', 'Centro histórico con calles estrechas y edificios antiguos.'),
    (3, 'Sagrada Familia', 'Carrer de Mallorca', 08013, 'Modernismo', 'Siglo XIX', 'Basílica diseñada por Antoni Gaudí, aún en construcción.'),
    (4, 'Museo Picasso', 'Carrer Montcada', 08003, 'Contemporáneo', 'Siglo XX', 'Museo dedicado a la obra del pintor Pablo Picasso.'),
    (5, 'Templo de Augusto', 'Carrer del Paradís', 08002, 'Romano', 'Siglo I aC', 'Templo romano dedicado al culto imperial a César Augusto.'),
    (6, 'Parque de la Ciutadella', 'Passeig de Picasso', 08003, 'Siglo XIX', 'Siglo XIX', 'Parque público con zoológico, lago y edificios históricos.'),
    (7, 'Palau de la Música Catalana', 'Carrer Palau de la Música', 08003, 'Modernismo', 'Siglo XX', 'Sala de conciertos modernista diseñada por Lluís Domènech i Montaner.'),
    (8, 'Monasterio de Montserrat', 'Santa Maria de Montserrat', 08199, 'Medieval', 'Siglo X', 'Monasterio benedictino en la montaña de Montserrat.'),
    (9, 'Parc de Montjuïc', 'Avinguda de Miramar', 08038, 'Siglo XX', 'Siglo XX', 'Zona montañosa con parques, museos y vistas panorámicas de la ciudad.'),
    (10, 'Catedral de Barcelona', 'Pla de la Seu', 08002, 'Gótico', 'Siglo XIII', 'Catedral gótica dedicada a la Santa Cruz y Santa Eulalia.');

INSERT INTO Transaccion (id_transaccion, fecha_transaccion, metodo_pago, cantidad_pagada, codigo_descuento) VALUES
    (1, '2024-01-26', 'Tarjeta de crédito', 50.00, 'DESC50'),
    (2, '2024-01-27', 'PayPal', 30.00, NULL),
    (3, '2024-01-28', 'Tarjeta de débito', 75.00, 'SUMMER25'),
    (4, '2024-01-29', 'Transferencia bancaria', 40.00, NULL),
    (5, '2024-01-30', 'Tarjeta de crédito', 60.00, NULL),
    (6, '2024-02-01', 'PayPal', 25.00, 'NEWUSER10'),
    (7, '2024-02-02', 'Tarjeta de débito', 90.00, NULL),
    (8, '2024-02-03', 'Transferencia bancaria', 55.00, 'FRIENDS20'),
    (9, '2024-02-04', 'Tarjeta de crédito', 70.00, NULL),
    (10, '2024-02-05', 'PayPal', 45.00, NULL);

INSERT INTO Comentario (id_comentario, texto_comentario, valoracion, hora, fecha) VALUES
    (1, '¡Excelente tour! Muy informativo.', 9, '12:30:00', '2024-01-26'),
    (2, 'El guía era muy amable, pero la ruta podría mejorar.', 7, '15:45:00', '2024-01-27'),
    (3, 'Increíble experiencia, definitivamente lo recomendaría.', 10, '10:00:00', '2024-01-28'),
    (4, 'El lugar es hermoso, pero el clima no ayudó mucho.', 8, '14:20:00', '2024-01-29'),
    (5, 'El guía conocía muy bien la historia, fue fascinante.', 9, '11:45:00', '2024-01-30'),
    (6, 'Buena relación calidad-precio, disfrutamos mucho.', 8, '16:30:00', '2024-02-01'),
    (7, 'El recorrido fue un poco corto para mi gusto.', 6, '13:10:00', '2024-02-02'),
    (8, 'Gran atención al cliente, resolveram todos nuestros problemas.', 10, '09:20:00', '2024-02-03'),
    (9, 'El sitio histórico es impresionante, no dudaría en volver.', 9, '12:00:00', '2024-02-04'),
    (10, 'Una maravillosa experiencia, en un lugar que transmite mucha historia', 8, '16:15:00', '2024-02-04');
    
INSERT INTO Guia (id_guia, nombre, apellido1, apellido2, email, especialidad) VALUES
    (1, 'Carlos', 'Fernández', 'García', 'carlos@email.com', 'Historia'),
    (2, 'Laura', 'Rodríguez', 'Pérez', 'laura@email.com', 'Arqueología'),
    (3, 'Javier', 'Gómez', 'López', 'javier@email.com', 'Arquitectura'),
    (4, 'Ana', 'Martínez', 'Sánchez', 'ana@email.com', 'Arte'),
    (5, 'Miguel', 'Santos', 'Pérez', 'miguel@email.com', 'Naturaleza'),
    (6, 'Elena', 'Díaz', 'González', 'elena@email.com', 'Cultura'),
    (7, 'Pablo', 'López', 'Fernández', 'pablo@email.com', 'Historia'),
    (8, 'Isabel', 'Pérez', 'Martín', 'isabel@email.com', 'Arqueología'),
    (9, 'Sara', 'García', 'Rodríguez', 'sara@email.com', 'Arte'),
    (10, 'Daniel', 'Martín', 'Gómez', 'daniel@email.com', 'Naturaleza');

INSERT INTO Ruta (id_ruta, descripcion, valoracion, distancia, desnivel) VALUES
    (1, 'Ruta histórica por el Barrio Gótico', 8, 5, 100),
    (2, 'Descubriendo el Modernismo en Barcelona', 7, 8, 150),
    (3, 'Tour arqueológico por Montjuïc', 9, 12, 200),
    (4, 'Paseo cultural por la Ciutadella', 6, 6, 80),
    (5, 'Senderismo en Montserrat', 9, 15, 300),
    (6, 'Explorando el Raval', 7, 7, 120),
    (7, 'Ruta gastronómica en el Born', 8, 4, 60),
    (8, 'Camino a la Sagrada Familia', 6, 10, 180),
    (9, 'Travesía por el Parc de la Ciutadella', 9, 8, 100),
    (10, 'Tour nocturno por el Barrio Gótico', 7, 5, 80);

INSERT INTO Visita_Usuario_Lugar (id_usuario, id_lugar) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO Tiene_Lugar_Comentario (id_lugar, id_comentario) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO Realiza_Usuario_Transaccion (id_usuario, id_transaccion) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO Paga_Transaccion_Guia (id_transaccion, id_guia) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO Escribe_Usuario_Comentario (id_comentario, id_usuario) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO Contiene_Lugar_Ruta (id_lugar, id_ruta) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);