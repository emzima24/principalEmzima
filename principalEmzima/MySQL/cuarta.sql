-- Ejercicios cláusula IN
-- Encuentra los empleados cuyos IDs son 1, 3 o 5.

select * from empleados where id in(1,3,5);

-- Busca los productos con IDs 2, 4 o 6 en la tabla de productos.

select * from productos where id in(2,4,6); 

-- Encuentra las ventas que tienen los clientes con IDs 1, 3 o 5.

select * from ventas where id in(1,3,5);

-- Ejercicios cláusula LIKE
-- Encuentra los empleados cuyos nombres comienzan con "L".

select * from empleados where nombre like 'L%';

-- Busca los productos cuyos nombres contengan la palabra "Teléfono".

select * from productos where nombre like ('%Tele%');

-- Encuentra los clientes cuyas direcciones contienen la palabra "Calle".

select * from clientes where direccion like ('%cal%');

-- Ejercicios cláusula ORDER BY:
-- Ordena los empleados por salario de manera ascendente. (default)

select * from empleados t order by salario ;

-- Ordena los productos por nombre de manera descendente.

select * from productos t order by nombre DESC ;

-- Ordena las ventas por cantidad de manera ascendente y luego por precio_unitario de manera descendente.

select * from ventas v order by cantidad ASC , precio_unitario DESC ;

-- Ejercicios LIMIT
-- Muestra los 5 productos más caros de la tabla "productos".

select * from productos t order by precio DESC limit 5;

-- Muestra los 10 primeros empleados en orden alfabético por apellido.

select * from empleados t order by apellido LIMIT 10;

-- Muestra las 3 ventas con el monto total más alto.

select * from ventas t order by monto_total DESC limit 3;

-- Ejercicios AS
-- Crea una consulta que muestre el salario de los empleados junto con el salario aumentado en un 10% nombrando a la columna como “Aumento del 10%”.

select nombre, salario, salario*1.1 AS 'Aumento del 10%' from empleados;

-- Crea una consulta que calcule el monto total de las compras realizadas por cliente y que la columna se llame “Monto total gastado”.

select cliente_id, sum(monto_total) as 'Monto total gastado' from ventas v group by cliente_id;

-- Muestra los nombres completos de los empleados concatenando los campos "nombre" y "apellido" y que la columna se llame “Nombre y apellido”.

select concat(nombre,' ',apellido) as 'Nombre y apellido' from empleados;

-- Ejercicios CASE
-- Crea una consulta que muestre el nombre de los productos y los categorice como "Caro" si el precio es mayor o igual a $500, "Medio" si es mayor o igual a $200 y menor que $500, y "Barato" en otros casos.

SELECT nombre,
CASE
WHEN precio >= 500 THEN 'Caro'
WHEN precio >= 200 AND precio < 500 THEN 'Medio'
ELSE 'Barato'
END AS Categoria
FROM productos;

-- Crea una consulta que muestre el nombre de los empleados y los categorice como "Joven" si tienen menos de 30 años, "Adulto" si tienen entre 30 y 40 años, y "Mayor" si tienen más de 40 años.

SELECT nombre, edad, 
CASE
WHEN edad < 30 THEN 'Joven'
WHEN edad between 30 and 40 THEN 'Adulto'
ELSE 'Mayor'
END AS Categoria
FROM empleados e ;

-- Crea una consulta que muestre el ID de la venta y los categorice como "Poca cantidad" si la cantidad es menor que 3, "Cantidad moderada" si es igual o mayor que 3 y menor que 6, y "Mucha cantidad" en otros casos.

SELECT id, cantidad, 
CASE
WHEN cantidad < 3 THEN 'Poca cantidad'
WHEN cantidad between 3 and 5 THEN 'Cantidad moderada'
ELSE 'Mucha cantidad'
END AS Cagtegoria
FROM ventas v ;

-- Crea una consulta que muestre el nombre de los clientes y los categorice como "Comienza con A" si su nombre comienza con la letra 'A', "Comienza con M" si comienza con 'M' y "Otros" en otros casos.

SELECT nombre, 
CASE
WHEN nombre like 'A%' THEN 'Comienza con A'
WHEN nombre like 'M%'  THEN 'Comienza con M'
ELSE 'Otros'
END AS Categoria
FROM clientes;

-- Crea una consulta que muestre el nombre de los empleados y los categorice como "Salario alto" si el salario es mayor o igual a $3500, "Salario medio" si es mayor o igual a $3000 y menor que $3500, y "Salario bajo" en otros casos.

SELECT nombre,salario, 
CASE
WHEN salario >= 3500 THEN 'Salario alto'
WHEN salario >= 3000 and salario < 3500   THEN 'Salario medio'
ELSE 'Salario bajo'
END AS Catergoria
FROM empleados e ;

-- Ejercicios Función MAX() 
-- Encuentra el salario máximo de todos los empleados.

select max(salario) from empleados;

-- Encuentra la cantidad máxima de productos vendidos en una sola venta.

select max(cantidad) from ventas v ;

-- Encuentra la edad máxima de los empleados.

select max(edad) from empleados e ;

-- Ejercicios Función MIN()
-- Encuentra el salario mínimo de todos los empleados.

select min(salario) from empleados e ;

-- Encuentra la cantidad mínima de productos vendidos en una sola venta.

select min(cantidad) from ventas v ;

-- Encuentra la edad mínima de los empleados.

select min(edad) from empleados;

-- Ejercicios de la Función COUNT()
-- Cuenta cuántos empleados hay en total.

select count(*) AS 'cuantos empleados total' from empleados e;

-- Cuenta cuántas ventas se han realizado.

select count(*) AS 'cuantas ventas total' from ventas;

-- Cuenta cuántos productos tienen un precio superior a $500.

select count(*) AS 'productos precio > $500' from productos WHERE  precio > 500;

-- Ejercicios de la Función SUM()
-- Calcula la suma total de salarios de todos los empleados.

select sum(salario) AS 'suma salario total empleados' from empleados e;

-- Calcula la suma total de montos vendidos en todas las ventas.

select sum(monto_total) AS 'suma total de montos vendidos' from ventas;

-- Calcula la suma de precios de productos con ID par.

select sum(precio) from productos p where id % 2=0;

-- Ejercicios Función AVG()
-- Calcula el salario promedio de todos los empleados.

select avg(salario) from empleados e;

-- Calcula el precio unitario promedio de todos los productos.

select avg(precio) from productos p ;

-- Calcula la edad promedio de los empleados.

select avg(edad) from empleados e;

-- Ejercicios GROUP BY()
-- Agrupa las ventas por empleado y muestra la cantidad total de ventas realizadas por cada empleado.

select empleado_id,sum(cantidad)
from ventas group by empleado_id;

select empleado_id,count(*)
from ventas group by empleado_id;
   
-- Agrupa los productos por precio y muestra la cantidad de productos con el mismo precio.

select precio, count(*)
from productos p group by precio ORDER by precio ;

-- Agrupa los empleados por departamento y muestra la cantidad de empleados en cada departamento.

select departamento_id ,count(*)
from empleados e group by departamento_id ;

-- Ejercicios HAVING 
-- Encuentra los departamentos con un salario promedio de sus empleados superior a $3,000.

select departamento_id ,avg(salario) AS `Salario promedio`
from empleados group by departamento_id HAVING `Salario promedio` > 3000;

select departamento_id ,avg(salario) AS Salario_promedio
from empleados group by departamento_id HAVING Salario_promedio > 3000;

-- no funciona
select departamento_id ,avg(salario) AS "Salario promedio"
from empleados group by departamento_id HAVING "Salario promedio" > 3000;
select departamento_id ,avg(salario) AS 'Salario promedio'
from empleados group by departamento_id HAVING 'Salario promedio' > 3000;

-- Encuentra los productos que se han vendido al menos 5 veces.

select producto_id ,count(*)
from ventas v group by producto_id ;

-- Selecciona los empleados que tengan una “o” en su nombre o apellido y agrúpalos por departamento y muestra los que tengan el salario máximo.
-- 

SELECT * FROM empleados e ;





-- Actividad: Ejercicios Complementarios
-- 
-- EJERCICIOS CON CLÁUSULA IN
-- 
-- Busca los empleados que trabajan en los departamentos 2 o 3.
-- 
-- Trae a los clientes que no tengan los IDs 2, 4 o 6.
-- 
-- Busca los productos cuyos precios son 350.00, 480.00 o 800.00.
-- 
-- EJERCICIOS CON CLÁUSULA LIKE
-- 
-- Busca los empleados cuyos correos electrónicos terminan en "mail.com".
-- 
-- Encuentra los productos cuyos nombres tengan exactamente 6 caracteres.
-- 
-- Busca los clientes cuyos nombres tengan una "a" en la tercera posición 
-- 
-- EJERCICIOS CON CLÁUSULA ORDER BY
-- 
-- Ordena los clientes por nombre de manera ascendente y luego por dirección de manera descendente.
-- 
-- Ordena los empleados por fecha_contratación de manera descendente.
-- 
-- Ordena los productos por precio de manera ascendente.
-- 
-- EJERCICIOS CON FUNCIÓN MAX()
-- 
-- Encuentra el precio máximo de un producto.
-- 
-- Encuentra el monto total máximo de una venta.
-- 
-- Encuentra el ID de cliente con el valor máximo.
-- 
-- EJERCICIOS CON FUNCIÓN MIN()
-- 
-- Encuentra el precio mínimo de un producto.
-- 
-- Encuentra el monto total mínimo de una venta.
-- 
-- Encuentra el ID de cliente con el valor mínimo.
-- 
-- EJERCICIOS CON FUNCIÓN  COUNT()
-- 
-- Cuenta cuántos clientes tienen la palabra "López" en su nombre.
-- 
-- Cuenta cuántas ventas fueron realizadas por el empleado con el id 9 .
-- 
-- Cuenta cuántos productos tienen un nombre que contiene la palabra "Digital".
-- 
-- EJERCICIOS CON FUNCIÓN  SUM()
-- 
-- Calcula la suma de cantidades de productos vendidos por empleado.
-- 
-- Calcula la suma de salarios de empleados en el Departamento 1.
-- 
-- Calcula la suma de precios de productos vendidos al cliente con id 2.
-- 
-- EJERCICIOS CON FUNCIÓN  AVG()
-- 
-- Calcula el precio promedio de productos con un precio superior a $200.
-- 
-- Calcula el salario promedio de los empleados en el Departamento 1.
-- 
-- Calcula la cantidad promedio de productos vendidos por empleado.
-- 
-- EJERCICIOS CON FUNCIÓN  GROUP BY()
-- 
-- Agrupa las ventas por cliente y muestra el monto total gastado por cada cliente.
-- 
-- Encuentra el salario máximo por departamento.
-- 
-- Encuentra el salario mínimo por departamento.
-- 
-- Obtén la suma total de salarios por departamento.
-- 
-- Encuentra la cantidad total de productos vendidos por empleado.
-- 
-- EJERCICIOS CON FUNCIÓN  HAVING()
-- 
-- Encuentra los departamentos con al menos 2 empleados con una edad menor de 30 años.
-- 
-- Muestra los clientes que han gastado más de $2,000 en total en compras.
-- 
-- EJERCICIOS CON FUNCIÓN  AS()
-- 
-- Crea una consulta que muestre la edad de los empleados junto con la edad aumentada en 5 años y que esta nueva columna se llame “Edad en 5 años”.
-- 
-- Muestra el monto total de ventas junto con el monto total aumentado en un 21%  y que esta nueva columna se llame “Precio + IVA”.
-- 
--  Crea una consulta que muestre el nombre del producto y su precio unitario precedido con el signo “$ ” y que esta nueva columna se llame “precio con formato”.
-- 
-- EJERCICIOS CON FUNCIÓN  LIMIT()
-- 
-- Muestra los 5 clientes con los IDs más bajos.
-- 
-- Muestra los 3 productos más vendidos.
-- 
-- Muestra los 5 empleados más jóvenes.
-- 
-- EJERCICIOS CON FUNCIÓN  CASE()
-- 
-- Crea una consulta que muestre el nombre de los productos y los categorice como "Laptop" si el nombre contiene la palabra "Laptop", "Teléfono" si contiene la palabra "Teléfono", y "Otros" en otros casos.
-- 
-- Crea una consulta que muestre el ID del producto y los clasifique en categorías según la cantidad total de ventas de cada producto en la tabla 'ventas'. Utilizando una instrucción 'CASE', establece las siguientes categorías: 
-- 
-- Si la suma de la cantidad de ventas (SUM(cantidad)) es mayor o igual a 9, la categoría es 'Alto Volumen'. 
-- 
-- Si la suma de la cantidad de ventas está entre 4 y 8 (inclusive), la categoría es 'Medio Volumen'.
-- 
-- En otros casos, la categoría es 'Bajo Volumen'.
-- 
-- Recuerda agrupar por producto_id y mostrar el resultado en orden descendente por la suma de la cantidad de ventas.
-- 
-- Crea una consulta que muestre el ID de la venta y los categorice como "Venta pequeña" si el monto total es menor que $500, "Venta mediana" si es mayor o igual a $500 y menor que $1500, y "Venta grande" en otros casos.
-- 
-- Crea una consulta que muestre el nombre de los clientes y los categorice como "Dirección larga" si la longitud de su dirección es mayor o igual a 30 caracteres, "Dirección mediana" si es mayor o igual a 20 y menor que 30 caracteres, y "Dirección corta" en otros casos.
-- 
--  Crea una consulta que muestre el nombre de los empleados y los categorice como "Ventas" si pertenecen al departamento 1, "Recursos Humanos" si pertenecen al departamento 2, y "Contabilidad"  si pertenecen al departamento 3.
-- 
-- Crea una consulta que muestre el nombre de los productos y los categorice de la siguiente manera:
-- 
-- Si el nombre del producto está en la lista ('Laptop', 'Reloj de Pulsera Inteligente', 'Reproductor de Blu-ray', 'Auriculares Bluetooth', 'Smart TV 55 Pulgadas', 'Cámara Digital', 'Impresora', 'Tablet', 'Teléfono móvil') y el precio es mayor o igual a 1000, la categoría es 'Tecnología cara'.
-- 
-- Si el nombre del producto está en la lista anterior y el precio está entre 500 y 999 (inclusive), la categoría es 'Tecnología gama media'.
-- 
-- Si el nombre del producto está en la lista anterior y el precio es menor a 500, la categoría es 'Tecnología barata'.
-- 
-- Si el precio es mayor o igual a 1000 y el nombre del producto no está en la lista, la categoría es 'Caro'.
-- 
-- Si el precio está entre 500 y 999 (inclusive) y el nombre del producto no está en la lista, la categoría es 'Medio'.
-- 
-- Si el precio es menor a 500 y el nombre del producto no está en la lista, la categoría es 'Barato'.

