/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
edad INT
)


-- PASO 2
-- Tu código aquí
CREATE TABLE roles(
id_rol INT PRIMARY KEY AUTO_INCREMENT,
nombre_rol VARCHAR(50) NOT NULL
)


-- PASO 3
-- Tu código aquí
UPDATE usuarios SET id_rol = 1 WHERE id_usuario = 1;
UPDATE usuarios SET id_rol = 2 WHERE id_usuario = 2;
UPDATE usuarios SET id_rol = 1 WHERE id_usuario = 3;
UPDATE usuarios SET id_rol = 3 WHERE id_usuario = 4;
UPDATE usuarios SET id_rol = 4 WHERE id_usuario = 5;
UPDATE usuarios SET id_rol = 2 WHERE id_usuario = 6;
UPDATE usuarios SET id_rol = 1 WHERE id_usuario = 7;
UPDATE usuarios SET id_rol = 1 WHERE id_usuario = 8;
UPDATE usuarios SET id_rol = 2 WHERE id_usuario = 9;
UPDATE usuarios SET id_rol = 3 WHERE id_usuario = 10;
UPDATE usuarios SET id_rol = 1 WHERE id_usuario = 11;
UPDATE usuarios SET id_rol = 4 WHERE id_usuario = 12;
UPDATE usuarios SET id_rol = 1 WHERE id_usuario = 13;
UPDATE usuarios SET id_rol = 2 WHERE id_usuario = 14;
UPDATE usuarios SET id_rol = 3 WHERE id_usuario = 15;
UPDATE usuarios SET id_rol = 1 WHERE id_usuario = 16;
UPDATE usuarios SET id_rol = 4 WHERE id_usuario = 17;
UPDATE usuarios SET id_rol = 1 WHERE id_usuario = 18;
UPDATE usuarios SET id_rol = 3 WHERE id_usuario = 19;
UPDATE usuarios SET id_rol = 2 WHERE id_usuario = 20;

ALTER TABLE usuarios ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);

-- PASO 4
-- Tu código aquí
SELECT usuarios.id_usuario,usuarios.nombre,usuarios.apellido,usuarios.email,roles.nombre_rol
FROM usuarios
JOIN roles ON usuarios.id_rol=roles.id_rol

/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí

CREATE TABLE categorias(
id_categoria INT AUTO_INCREMENT PRIMARY KEY,
nombre_categoria VARCHAR(100) NOT NULL
);


INSERT INTO categorias (nombre_categoria) VALUES
('Electrónicos'),
('Ropa y Accesorios'),
('Libros'),
('Hogar y Cocina'),
('Deportes y aire libre'),
('Salud y cuidado personal'),
('Herramientas y mejoras para el hogar'),
('Juguetes y juegos'),
('Automotriz'),
('Música y Películas');
-- PASO 2
-- Tu código aquí

ALTER TABLE usuarios ADD COLUMN id_categoria INT;
-- PASO 3
-- Tu código aquí

UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (2, 7, 15, 18, 20);
-- PASO 4
-- Tu código aquí
SELECT usuarios.id_usuario,usuarios.nombre,usuarios.apellido,usuarios.email,usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
JOIN roles ON usuarios.id_rol=roles.id_rol
JOIN categorias ON usuarios.id_categoria= categorias.id_categoria
/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios_categorias(
id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
id_usuario INT,
id_categoria INT,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- PASO 2
-- Tu código aquí
INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10)


-- PASO 3
-- Tu código aquí
SELECT usuarios.id_usuario,usuarios.nombre,usuarios.apellido,usuarios.email,usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
JOIN roles ON usuarios.id_rol=roles.id_rol
JOIN categorias ON usuarios.id_categoria= categorias.id_categoria
