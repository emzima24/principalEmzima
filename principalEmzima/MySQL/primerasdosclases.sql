SHOW DATABASES;

use mi_bd; 

CREATE DATABASE if not exists mi_bd;

-- CREATE DATABASE if not exists mi_bd_2;
-- DROP DATABASE mi_bd_2;

CREATE TABLE IF NOT EXISTS empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);


-- Modifica la columna "edad" para que no pueda tener valores nulos.

ALTER TABLE empleados MODIFY edad INT NOT NULL;

-- Modifica la columna "salario" para que tenga un valor predeterminado de 0 en lugar de nulo.

ALTER TABLE empleados MODIFY salario DECIMAL(10, 2) default 0;

-- Agrega una columna llamada "departamento" de tipo VARCHAR(50) para almacenar el departamento al que pertenece cada empleado.

ALTER TABLE empleados ADD departamento varchar(50);

-- Agrega una columna llamada "correo_electronico" de tipo VARCHAR(100) para almacenar las direcciones de correo electrónico de los empleados.

ALTER TABLE empleados ADD correo_electronico varchar(100);

-- Elimina la columna "fecha_contratacion" de la tabla "empleados".

ALTER TABLE empleados DROP fecha_contratacion;

-- Vuelve a crear la columna "fecha_contratacion" de la tabla "empleados" pero con un valor por default que sea la fecha actual. Para eso puedes usar las funciones “CURRENT_DATE” o “NOW()”.

ALTER TABLE empleados ADD fecha_contratacion date default (current_date);
ALTER TABLE empleados ADD fecha_contratacion date default (NOW());
ALTER TABLE empleados ADD fecha_contratacion timestamp default current_timestamp;

-- Crea una nueva tabla llamada "departamentos" con las siguientes columnas:
-- id (clave primaria, tipo INT AUTO_INCREMENT)
-- nombre (tipo VARCHAR(50))

CREATE TABLE IF NOT EXISTS departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- Agrega una nueva columna llamada "departamento_id" en la tabla "empleados" que servirá como clave foránea para hacer referencia al departamento al que pertenece cada empleado.

ALTER TABLE empleados ADD departamento_id INT;

-- Modifica la tabla “empleados” y establece una restricción de clave foránea en la columna "departamento_id" para que haga referencia a la columna "id" en la tabla "departamentos".

ALTER table empleados add foreign key (departamento_id) references departamentos(id);

-- Elimina el campo “departamentos” de la tabla empleados, ahora usaremos la clave foránea para poder relacionar ambas tablas

ALTER TABLE empleados DROP departamento;

INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Juan', 'Pérez', 30, 2500.50);

UPDATE empleados SET salario = 2700.00 WHERE nombre = 'Juan';

DELETE FROM empleados WHERE nombre = 'Juan';

SELECT nombre, salario FROM empleados WHERE edad > 25;

-- Inserta un departamento llamado "Ventas" en la tabla "departamentos".

-- Inserta un departamento llamado "Recursos Humanos" en la tabla "departamentos".

INSERT INTO departamentos (nombre) VALUES 
('Ventas'),
('Recursos Humanos');

-- Inserta un empleado en la tabla "empleados" con los siguientes valores:
-- Nombre: Ana
-- Apellido: Rodríguez.
-- Edad: 28.
-- Salario: 3000.00.
-- Correo electrónico: anarodriguez@mail.com
-- departamento_id: 1

-- Nombre: Carlos.
-- Apellido: López.
-- Edad: 32.
-- Salario: 3200.50.
-- Correo electrónico: carloslopez@mail.com
-- departamento_id: 2

-- Nombre: Laura
-- Apellido: Pérez
-- Edad: 26
-- Salario: 2800.75
-- Correo electrónico: lauraperez@mail.com
-- departamento_id:  1

-- Nombre: Martín
-- Apellido: González
-- Edad: 30
-- Salario: 3100.25
-- Correo electrónico: martingonzalez@mail.com
-- departamento_id: 2

INSERT INTO empleados (nombre,apellido,edad,salario,correo_electronico,departamento_id) VALUES 
('Ana','Rodríguez',28,3000.00,'anarodriguez@mail.com',1),
('Carlos','López',32,3200.50,'carloslopez@mail.com',2),
('Laura','Pérez',26,2800.75,'lauraperez@mail.com',1),
('Martín','González',30,3100.25,'martingonzalez@mail.com',2);

-- Actualiza el salario del empleado con nombre "Ana" para aumentarlo en un 10%.

UPDATE empleados SET salario = salario*1.10 WHERE nombre = 'Ana';

-- Crea un departamento llamado “Contabilidad”. 

INSERT INTO departamentos (nombre) VALUES ('Contabilidad');

-- Cambia el departamento del empleado con nombre "Carlos" de "Recursos Humanos" a "Contabilidad":

UPDATE empleados SET departamento_id = 3 WHERE nombre = 'Carlos';

-- Elimina al empleado con nombre "Laura"

DELETE FROM empleados WHERE nombre = 'Laura';

-- Crea una tabla llamada "clientes" con columnas para el "id" (entero autoincremental), "nombre" (cadena de hasta 50 caracteres), y "direccion" (cadena de hasta 100 caracteres).

CREATE TABLE clientes (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
direccion VARCHAR(100));

-- Crea una tabla llamada "productos" con columnas para el "id" (entero autoincremental), "nombre" (cadena de hasta 50 caracteres), y "precio" (decimal con 10 dígitos, 2 decimales).

CREATE TABLE productos (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
precio DECIMAL(10, 2)
);

-- Crea una tabla llamada "ventas" con columnas para "id" (entero autoincremental), "producto_id" (entero), "cliente_id" (entero), "cantidad" (entero), “precio_unitario” (decimal con 10 dígitos, 2 decimales), "monto_total" (decimal con 10 dígitos, 2 decimales), y "empleado_id" (entero).

CREATE TABLE ventas (
id INT AUTO_INCREMENT PRIMARY KEY,
producto_id INT,
cliente_id INT,
cantidad INT,
precio_unitario DECIMAL(10, 2),
monto_total DECIMAL(10, 2),
empleado_id INT
);

-- En la tabla creada Ventas, establece restricciones de clave foránea en las columnas "producto_id," "cliente_id," y "empleado_id" para hacer referencia a las tablas correspondientes. 

ALTER TABLE ventas ADD FOREIGN KEY (producto_id) REFERENCES productos(id),
ADD FOREIGN KEY (cliente_id ) REFERENCES clientes(id);

-- Inserta un nuevo cliente en la tabla "clientes" con el nombre "Juan Pérez" y la dirección "Libertad 3215, Mar del Plata"

INSERT INTO clientes (nombre,direccion) VALUES 
('Juan Pérez','Libertad 3215, Mar del Plata');

-- Inserta un nuevo producto en la tabla "productos" con el nombre "Laptop" y un precio de 1200.00 .

INSERT INTO productos (nombre,precio) VALUES 
('Laptop',1200.00);

-- Modifica la columna monto_total de la tabla ventas para que por defecto sea el resultado de multiplicar la cantidad por el precio del producto_id

ALTER TABLE ventas MODIFY monto_total DECIMAL(10, 2) GENERATED ALWAYS AS ( cantidad * precio_unitario) STORED;

-- Crea una venta en la tabla "ventas" donde el cliente "Juan Pérez" compra "Laptop" por una cantidad de 2 unidades y el vendedor tenga el nombre “Ana" y apellido "Rodriguez”. 
-- Ten en cuenta que debes “tener” los ID y valores correspondientes previamente, luego aprenderemos a recuperarlos con subconsultas.

INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario,
empleado_id) VALUES (1,1,2,1350.00,1);

-- Muestra los nombres de los empleados que trabajan en el Departamento 1 y tienen un salario superior a $3000.

select * from empleados where departamento_id =1 and empleados.salario > 3000 ;

-- Lista los empleados que tienen 32 años de edad o trabajan en el Departamento 3.

select * from empleados where edad =32 and departamento_id = 3;

-- Lista las ventas donde el producto sea el ID 1 y la cantidad sea mayor o igual a 2.

select * from ventas where producto_id =1 AND  cantidad >=2;

-- Muestra las ventas donde el cliente sea el ID 1 o el empleado sea el ID 2.

select * from ventas where cliente_id =1 or empleado_id = 2;

-- Obtén una lista de ventas donde el cliente sea el ID 2 y la cantidad sea mayor que 2.

select * from ventas where cliente_id =2 AND cantidad >2;

-- Encuentra las ventas realizadas por el empleado con el ID 1 y donde el monto total sea mayor que $2000.00.

select * from ventas where empleado_id =1 and ventas.monto_total > 2000;

-- Encuentra a los empleados cuyas edades están entre 29 y 33 años. Muestra el nombre y la edad de los registros que cumplan esa condición. 

select nombre,edad from empleados where edad between 29 and 33;

-- Encuentra las ventas donde la cantidad de productos vendidos esté entre 2 y 3.

select * from ventas where cantidad between 2 and 3;

-- Muestra las ventas donde el precio unitario esté entre $300.00 y $500.00.

select * from ventas where precio_unitario between 300 and 500