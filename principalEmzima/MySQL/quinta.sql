-- Ejercicios consultas multitabla  - Parte 1
-- Une las tablas de empleados con departamentos y solo muestra las columnas nombre, apellido, edad, salario de empleados y la columna nombre de departamentos.

select e.nombre,e.apellido,e.edad,e.salario,d.nombre from empleados e,departamentos d where e.departamento_id = d.id ;

-- Une las tablas ventas con la tabla empleados donde se muestren todas las columnas de ventas exceptuando la columna empleado_id y en su lugar muestres el nombre y apellido de la tabla empleados.

select v.id,v.producto_id,v.cliente_id,v.cantidad,v.precio_unitario,v.monto_total, e.nombre,e.apellido from ventas v, empleados e where v.empleado_id = e.id;

-- Une las tablas ventas con la tabla productos donde se muestren todas las columnas de ventas exceptuando la columna producto_id y en su lugar muestres la columna nombre de la tabla productos.

select v.id,v.empleado_id,v.cliente_id,v.cantidad,v.precio_unitario,v.monto_total, p.nombre from ventas v, productos p where v.producto_id = p.id;

-- Une las tablas ventas con la tabla clientes donde se muestren todas las columnas de ventas exceptuando la columna cliente_id y en su lugar muestres la columna nombre de la tabla clientes.

select v.id,v.producto_id,v.empleado_id,v.cantidad,v.precio_unitario,v.monto_total, c.nombre from ventas v, clientes c where v.cliente_id = c.id ;

-- Une las tablas ventas con la tablas empleados y departamentos donde se muestren todas las columnas de ventas exceptuando la columna empleado_id y en su lugar muestres el nombre y apellido de la tabla empleados y además muestres la columna nombre de la tabla departamentos.

select v.id,v.producto_id,v.cliente_id,v.cantidad,v.precio_unitario,v.monto_total, e.nombre,e.apellido, d.nombre from ventas v, empleados e, departamentos d where v.empleado_id = e.id and e.departamento_id = d.id;

-- Une las tablas ventas, empleados, productos y clientes donde se muestren las columnas de la tabla ventas reemplazando sus columnas de FOREIGN KEYs con las respectivas columnas de “nombre” de las otras tablas.

select v.id,p.nombre ,c.nombre ,v.cantidad,v.precio_unitario,v.monto_total, e.nombre,e.apellido from ventas v, empleados e, productos p, clientes c where v.empleado_id = e.id and v.producto_id = p.id and v.cliente_id = c.id;

-- Calcular el salario máximo de los empleados en cada departamento y mostrar el nombre del departamento junto con el salario máximo.

select max(e.salario) as Salario_Máximo, d.nombre from empleados e,departamentos d where e.departamento_id = d.id GROUP BY d.nombre;

-- ✏️Ejercicios consultas multitabla - Parte 2 
-- Calcular el monto total de ventas por departamento y mostrar el nombre del departamento junto con el monto total de ventas.

select SUM(v.monto_total) as Monto_Total, d.nombre from ventas v, empleados e, departamentos d where v.empleado_id = e.id and e.departamento_id = d.id GROUP BY d.nombre;

-- Encontrar el empleado más joven de cada departamento y mostrar el nombre del departamento junto con la edad del empleado más joven.

select min(e.edad) as Edad_mas_joven, d.nombre from empleados e,departamentos d where e.departamento_id = d.id GROUP BY d.nombre;

-- Calcular el volumen de productos vendidos por cada producto (por ejemplo, menos de 5 “bajo”, menos 8 “medio” y mayor o igual a 8 “alto”) y mostrar la categoría de volumen junto con la cantidad y el nombre del producto.

select SUM(v.cantidad) as Cantidad_total,  
CASE
WHEN SUM(v.cantidad) < 5 THEN 'Bajo'
WHEN SUM(v.cantidad) >= 5 AND SUM(v.cantidad) < 8 THEN 'Medio'
ELSE 'Alto'
END AS Categoria, 
p.nombre
from ventas v, productos p where v.producto_id = p.id GROUP BY p.nombre ORDER BY Cantidad_total desc;

-- Encontrar el cliente que ha realizado el mayor monto total de compras y mostrar su nombre y el monto total.

select max(v.monto_total) as Cantidad_total, c.nombre from ventas v, clientes c where v.cliente_id = c.id GROUP BY c.nombre ORDER BY Cantidad_total desc limit 1;

-- Calcular el precio promedio de los productos vendidos por cada empleado y mostrar el nombre del empleado junto con el precio promedio de los productos que ha vendido.

select avg(p.precio), concat(e.nombre,' ',e.apellido) as Nombre_apellido from ventas v, empleados e, productos p where v.empleado_id = e.id and v.producto_id = p.id GROUP BY Nombre_apellido ORDER BY Nombre_apellido ;

-- Encontrar el departamento con el salario mínimo más bajo entre los empleados y mostrar el nombre del departamento junto con el salario mínimo más bajo.

select min(e.salario) as Salario_Minimo, d.nombre from empleados e,departamentos d where e.departamento_id = d.id GROUP BY d.nombre;

-- Encuentra el departamento con el salario promedio más alto entre los empleados mayores de 30 años y muestra el nombre del departamento junto con el salario promedio. Limita los resultados a mostrar solo los departamentos con el salario promedio mayor a 3320.

select avg(e.salario) as Salario_promedio, d.nombre from empleados e,departamentos d where e.departamento_id = d.id and e.edad > 30 GROUP BY d.nombre HAVING Salario_promedio > 3320;

-- ✏️  Actividad: Ejercicios Complementarios
-- ✨ Estos ejercicios son de tipo complementario. Esto quiere decir que te ayudará a avanzar en profundidad en el tema visto, pero no son obligatorios. Te recomendamos intentar con tu equipo trabajar algunos de ellos. 
-- Encontrar la cantidad de productos vendidos por cada empleado y mostrar el nombre del empleado junto con la cantidad de productos vendidos.

select SUM(v.cantidad) as Cantidad_total,  p.nombre, concat(e.nombre,' ',e.apellido) as Nombre_apellido
from ventas v, productos p, empleados e where v.producto_id = p.id and e.id = v.empleado_id GROUP BY Nombre_apellido, p.nombre ORDER BY Nombre_apellido, Cantidad_total desc;

select SUM(v.cantidad) as Cantidad_total,   concat(e.nombre,' ',e.apellido) as Nombre_apellido
from ventas v, productos p, empleados e where v.producto_id = p.id and e.id = v.empleado_id GROUP BY Nombre_apellido ORDER BY Nombre_apellido, Cantidad_total desc;

-- Calcular el monto total de ventas por cada cliente y mostrar el nombre del cliente junto con el monto total de sus compras.

select sum(v.monto_total) as Cantidad_total, c.nombre from ventas v, clientes c where v.cliente_id = c.id GROUP BY c.nombre ORDER BY Cantidad_total desc;

-- Encontrar el producto más caro vendido y mostrar su nombre y precio.

select max(v.precio_unitario) as Maximo_precio, p.nombre from ventas v, productos p where v.producto_id = p.id GROUP BY p.nombre ORDER BY Maximo_precio desc;

-- Calcular el salario promedio de los empleados en cada departamento y mostrar el nombre del departamento junto con el salario promedio.

select avg(e.salario) as Salario_promedio, d.nombre from empleados e,departamentos d where e.departamento_id = d.id GROUP BY d.nombre;

-- Encontrar la cantidad total de ventas realizadas por cada empleado y mostrar el nombre y apellido del empleado junto con la cantidad total de ventas.

select sum(v.cantidad) as Cantidad_total_ventas, concat(e.nombre,' ',e.apellido) as Nombre_apellido from ventas v, empleados e where v.empleado_id = e.id  GROUP BY Nombre_apellido ORDER BY Nombre_apellido ;

-- Encuentra la cantidad de ventas realizadas por cada empleado y muestra el nombre y apellido del empleado junto con la cantidad total de ventas. Limita los resultados a mostrar solo a los empleados que hayan realizado más de 5 ventas y ordenarlos de forma descendente con respecto a la cantidad de ventas.

select sum(v.cantidad) as Cantidad_total_ventas, concat(e.nombre,' ',e.apellido) as Nombre_apellido from ventas v, empleados e where v.empleado_id = e.id GROUP BY Nombre_apellido HAVING Cantidad_total_ventas > 5 ORDER BY Cantidad_total_ventas desc;

-- Calcula el monto total vendido por cada empleado y muestra el nombre del empleado junto con el monto total. Usa la cláusula HAVING para filtrar a aquellos empleados que hayan vendido más de 10 productos en total. Muestra el resultado en orden descendente según el monto total vendido.

select sum(v.cantidad) as Cantidad_total_ventas, concat(e.nombre,' ',e.apellido) as Nombre_apellido from ventas v, empleados e where v.empleado_id = e.id GROUP BY Nombre_apellido HAVING Cantidad_total_ventas > 10 ORDER BY Cantidad_total_ventas desc;

-- Encuentra el monto total vendido a cada cliente y muestra el nombre del cliente junto con el monto total. Usa la cláusula HAVING para filtrar a aquellos clientes cuyo monto total promedio en sus compras sea superior a $1500. Muestra el resultado en orden descendente según el monto total vendido.

select sum(v.monto_total) as Cantidad_total, c.nombre from ventas v, clientes c where v.cliente_id = c.id GROUP BY c.nombre HAVING Cantidad_total > 1500 ORDER BY Cantidad_total desc;

-- Calcula la cantidad total de ventas realizadas a cada cliente y muestra el nombre del cliente junto con la cantidad total de ventas. Limita los resultados a mostrar solo a los clientes que hayan realizado más de 3 ventas ordénalos de forma descendente según la cantidad de ventas.

select sum(v.cantidad) as Cantidad_total, c.nombre from ventas v, clientes c where v.cliente_id = c.id GROUP BY c.nombre HAVING Cantidad_total > 3 ORDER BY Cantidad_total desc;

-- Encuentra los productos más caros vendidos (precio mayor a 1000), muestra su nombre y precio y ordenarlos de forma descendente por precio.

select max(v.precio_unitario) as Maximo_precio, p.nombre from ventas v, productos p where v.producto_id = p.id GROUP BY p.nombre HAVING Maximo_precio > 1000 ORDER BY Maximo_precio desc;

