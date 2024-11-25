Drop database if exists mi_bd_2;

CREATE DATABASE if not exists mi_bd_2;

use mi_bd_2; 

CREATE TABLE IF NOT EXISTS empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);


ALTER TABLE empleados MODIFY edad INT NOT NULL;

ALTER TABLE empleados MODIFY salario DECIMAL(10, 2) default 0;

ALTER TABLE empleados ADD departamento varchar(50);

ALTER TABLE empleados ADD correo_electronico varchar(100);

ALTER TABLE empleados DROP fecha_contratacion;

ALTER TABLE empleados ADD fecha_contratacion datetime default current_timestamp; -- mariadb

CREATE TABLE IF NOT EXISTS departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

ALTER TABLE empleados ADD departamento_id INT;

ALTER table empleados add foreign key (departamento_id) references departamentos(id);

ALTER TABLE empleados DROP departamento;

INSERT INTO departamentos (nombre) VALUES 
('Ventas'),
('Recursos Humanos');

INSERT INTO empleados (nombre,apellido,edad,salario,correo_electronico,departamento_id) VALUES 
('Ana','Rodríguez',28,3000.00,'anarodriguez@mail.com',1),
('Carlos','López',32,3200.50,'carloslopez@mail.com',2),
('Laura','Pérez',26,2800.75,'lauraperez@mail.com',1),
('Martín','González',30,3100.25,'martingonzalez@mail.com',2);

UPDATE empleados SET salario = salario*1.10 WHERE nombre = 'Ana';

INSERT INTO departamentos (nombre) VALUES ('Contabilidad');

UPDATE empleados SET departamento_id = 3 WHERE nombre = 'Carlos';

CREATE TABLE clientes (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
direccion VARCHAR(100));

CREATE TABLE productos (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
precio DECIMAL(10, 2)
);

CREATE TABLE ventas (
id INT AUTO_INCREMENT PRIMARY KEY,
producto_id INT,
cliente_id INT,
cantidad INT,
precio_unitario DECIMAL(10, 2),
monto_total DECIMAL(10, 2),
empleado_id INT
);


ALTER TABLE ventas ADD FOREIGN KEY (producto_id) REFERENCES productos(id),
ADD FOREIGN KEY (cliente_id ) REFERENCES clientes(id);

INSERT INTO clientes (nombre,direccion) VALUES 
('Juan Pérez','Libertad 3215, Mar del Plata');

INSERT INTO productos (nombre,precio) VALUES 
('Laptop',1200.00);

-- ALTER TABLE ventas MODIFY monto_total DECIMAL(10, 2) GENERATED ALWAYS AS ( cantidad * precio_unitario) STORED;
ALTER TABLE ventas DROP column if exists monto_total; 
ALTER TABLE ventas ADD column monto_total DECIMAL(10, 2) GENERATED ALWAYS AS ( cantidad * precio_unitario) PERSISTENT;
ALTER TABLE ventas DROP column if exists empleado_id; 
ALTER TABLE ventas ADD column empleado_id INT;

INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario,
empleado_id) VALUES (1,1,2,1350.00,1);

INSERT INTO productos (nombre,precio) VALUES 
('Teléfono móvil',450.00);

INSERT INTO clientes (nombre,direccion) VALUES 
('María García','Constitución 456, Luján');

ALTER TABLE empleados DROP column if exists correo_electronico;
ALTER TABLE empleados ADD correo_electronico varchar(100) GENERATED ALWAYS AS (concat(nombre,apellido,'@mail.com')) PERSISTENT;

INSERT INTO empleados (nombre,apellido,edad,salario,departamento_id) VALUES 
('Luis','Fernández',28,2800.00,1);

UPDATE productos SET precio = 1350.00 WHERE nombre = 'Laptop';

UPDATE clientes SET direccion = 'Alberti 1789, Mar del Plata' WHERE nombre LIKE 'Juan%';

UPDATE empleados SET salario = salario*1.05;

INSERT INTO productos (nombre,precio) VALUES 
('Tablet',350.00);

INSERT INTO clientes (nombre,direccion) VALUES 
('Ana Lopez','Beltrán 1452, Godoy Cruz');

INSERT INTO empleados (nombre,apellido,edad,salario,departamento_id) VALUES 
('Marta','Ramírez',32,3100.00,1);

UPDATE productos SET precio = 480.00 WHERE nombre = 'Teléfono móvil';

UPDATE clientes SET direccion = "Avenida 789, Ciudad del Este" WHERE nombre = 'María García';

UPDATE empleados SET salario = salario*1.07 WHERE departamento_id = 1;

INSERT INTO productos (nombre,precio) VALUES 
('Impresora',280.00);

INSERT INTO clientes (nombre,direccion) VALUES 
('Carlos Sánchez','Saavedra 206, Las Heras');

INSERT INTO empleados (nombre,apellido,edad,salario,departamento_id) VALUES 
('Lorena','Guzmán',26,2600.00,1);


INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) VALUES (
(SELECT id FROM productos WHERE nombre = 'Laptop'),    
(SELECT id FROM clientes WHERE nombre = 'Juan Pérez'), 
2,
(SELECT precio FROM productos WHERE nombre = 'Laptop'),                      
(SELECT id FROM empleados WHERE nombre = 'Ana' AND apellido = 'Rodriguez')
);

INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) VALUES (
(SELECT id FROM productos WHERE nombre = 'Teléfono móvil'),    
(SELECT id FROM clientes WHERE nombre = 'María García'), 
3,
(SELECT precio FROM productos WHERE nombre = 'Teléfono móvil'),                      
(SELECT id FROM empleados WHERE nombre = 'Carlos' AND apellido = 'López')
);

INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) VALUES (
(SELECT id FROM productos WHERE nombre = 'Impresora'),    
(SELECT id FROM clientes WHERE nombre = 'Carlos Sánchez'), 
1,
(SELECT precio FROM productos WHERE nombre = 'Impresora'),                      
(SELECT id FROM empleados WHERE nombre = 'Marta' AND apellido = 'Ramírez')
);

INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) VALUES (
(SELECT id FROM productos WHERE nombre = 'Laptop'),    
(SELECT id FROM clientes WHERE nombre = 'Ana López'), 
1,
(SELECT precio FROM productos WHERE nombre = 'Laptop'),                      
(SELECT id FROM empleados WHERE nombre = 'Carlos' AND apellido = 'López')
);

INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) VALUES (
(SELECT id FROM productos WHERE nombre = 'Tablet'),    
(SELECT id FROM clientes WHERE nombre = 'Juan Pérez'), 
2,
(SELECT precio FROM productos WHERE nombre = 'Tablet'),                      
(SELECT id FROM empleados WHERE nombre = 'Luis' AND apellido = 'Fernández')
);

INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) VALUES (
(SELECT id FROM productos WHERE nombre = 'Teléfono móvil'),    
(SELECT id FROM clientes WHERE nombre = 'María García'), 
1,
(SELECT precio FROM productos WHERE nombre = 'Teléfono móvil'),                      
(SELECT id FROM empleados WHERE nombre = 'Marta' AND apellido = 'Ramírez')
);

INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) VALUES (
(SELECT id FROM productos WHERE nombre = 'Impresora'),    
(SELECT id FROM clientes WHERE nombre = 'Carlos Sánchez'), 
2,
(SELECT precio FROM productos WHERE nombre = 'Impresora'),                      
(SELECT id FROM empleados WHERE nombre = 'Lorena' AND apellido = 'Guzmán')
);

INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id)
VALUES
  ('Laura', 'Sánchez', 27, 3300.00, 1),
  ('Javier', 'Pérez', 29, 3100.00, 1),
  ('Camila', 'Gómez', 26, 3000.00, 1),
  ('Lucas', 'Fernández', 28, 3200.00, 1),
  ('Valentina', 'Rodríguez', 30, 3500.00, 1);
 
INSERT INTO productos (nombre, precio)
VALUES
  ('Cámara Digital', 420.00),
  ('Smart TV 55 Pulgadas', 1200.00),
  ('Auriculares Bluetooth', 80.00),
  ('Reproductor de Blu-ray', 120.00),
  ('Lavadora de Ropa', 550.00),
  ('Refrigeradora Doble Puerta', 800.00),
  ('Horno de Microondas', 120.00),
  ('Licuadora de Alta Potencia', 70.00),
  ('Silla de Oficina Ergonómica', 150.00),
  ('Escritorio de Madera', 200.00),
  ('Mesa de Comedor', 250.00),
  ('Sofá de Tres Plazas', 350.00),
  ('Mochila para Portátil', 30.00),
  ('Reloj de Pulsera Inteligente', 100.00),
  ('Juego de Utensilios de Cocina', 40.00),
  ('Set de Toallas de Baño', 20.00),
  ('Cama King Size', 500.00),
  ('Lámpara de Pie Moderna', 70.00),
  ('Cafetera de Goteo', 40.00),
  ('Robot Aspirador', 180.00);
 
INSERT INTO clientes (nombre, direccion)
VALUES
  ('Alejandro López', 'Calle Rivadavia 123, Buenos Aires'),
  ('Sofía Rodríguez', 'Avenida San Martín 456, Rosario'),
  ('Joaquín Pérez', 'Calle Belgrano 789, Córdoba'),
  ('Valeria Gómez', 'Calle Mitre 101, Mendoza'),
  ('Diego Martínez', 'Avenida 9 de Julio 654, Buenos Aires');
 
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES
  (1, 6, 3, 1350.00, 1),
  (5, 8, 5, 420.00, 9),
  (10, 2, 2, 800.00, 6),
  (14, 7, 1, 200.00, 5),
  (20, 4, 4, 20.00, 6),
  (4, 5, 5, 280.00, 1),
  (9, 5, 3, 550.00, 1),
  (13, 3, 4, 150.00, 5),
  (19, 6, 2, 40.00, 1),
  (2, 9, 5, 480.00, 1);
 
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES
  (3, 9, 1, 350.00, 1),
  (6, 7, 4, 1200.00, 1),
  (7, 6, 3, 80.00, 1),
  (12, 9, 5, 70.00, 1),
  (16, 8, 2, 350.00, 6),
  (23, 9, 4, 180.00, 1),
  (18, 4, 3, 100.00, 7),
  (11, 3, 2, 120.00, 5),
  (15, 5, 4, 250.00, 6),
  (8, 8, 1, 120.00, 7);
 
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES
  (17, 3, 2, 30.00, 5),
  (21, 9, 5, 500.00, 6),
  (22, 2, 3, 70.00, 6),
  (24, 9, 2, 180.00, 1),
  (5, 1, 2, 1350.00, 1),
  (9, 6, 4, 550.00, 9),
  (13, 8, 3, 150.00, 7),
  (3, 1, 5, 350.00, 1),
  (18, 9, 1, 100.00, 6),
  (10, 5, 2, 800.00, 1);
 
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES
  (7, 4, 3, 80.00, 6),
  (2, 5, 1, 480.00, 6),
  (8, 7, 4, 120.00, 7),
  (1, 3, 5, 1350.00, 5),
  (4, 6, 2, 280.00, 5),
  (12, 1, 1, 70.00, 1),
  (19, 4, 3, 40.00, 6),
  (15, 3, 4, 250.00, 5),
  (6, 8, 2, 1200.00, 7),
  (11, 2, 3, 120.00, 5);





