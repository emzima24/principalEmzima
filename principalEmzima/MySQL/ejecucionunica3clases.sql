-- sin ninguno de los delete de las clases juan como empleado y laura 
-- debes borrar la bbdd para que sea de 0

CREATE DATABASE if not exists mi_bd;

use mi_bd; 

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

ALTER TABLE empleados ADD fecha_contratacion date default (current_date);

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

ALTER TABLE ventas MODIFY monto_total DECIMAL(10, 2) GENERATED ALWAYS AS ( cantidad * precio_unitario) STORED;

INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario,
empleado_id) VALUES (1,1,2,1350.00,1);

INSERT INTO productos (nombre,precio) VALUES 
('Teléfono móvil',450.00);

INSERT INTO clientes (nombre,direccion) VALUES 
('María García','Constitución 456, Luján');

ALTER TABLE empleados MODIFY correo_electronico varchar(100) GENERATED ALWAYS AS (concat(nombre,apellido,'@mail.com')) STORED;

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
