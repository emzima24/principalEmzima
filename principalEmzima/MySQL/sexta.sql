-- Ejercicios JOIN Parte 1
-- Encuentra el nombre y apellido de los empleados junto con la cantidad total de ventas que han realizado.

SELECT l.nombre, l.apellido, SUM(r.cantidad) AS Cantidad_total 
FROM empleados l
INNER JOIN ventas r
ON l.id = r.empleado_id
GROUP BY l.nombre, l.apellido
ORDER BY cantidad_total DESC;

SELECT e.nombre, e.apellido, SUM(v.cantidad) AS Cantidad_total 
FROM ventas v
INNER JOIN empleados e
ON e.id = v.empleado_id
GROUP BY e.nombre, e.apellido
ORDER BY cantidad_total DESC;

-- Calcula el monto total vendido a cada cliente y muestra el nombre del cliente, su dirección y el monto total.

SELECT c.nombre , c.direccion , SUM(v.monto_total) AS Monto_total
FROM clientes c
INNER JOIN ventas v 
ON c.id = v.cliente_id 
GROUP BY c.nombre, c.direccion
ORDER BY Monto_total DESC ;

-- Encuentra los productos vendidos por cada empleado en el departamento de "Ventas" y muestra el nombre del empleado junto con el nombre de los productos que han vendido.

SELECT e.nombre, e.apellido, p.nombre 
FROM empleados e
INNER JOIN ventas v 
ON e.id = v.empleado_id
INNER JOIN productos p 
ON p.id = v.producto_id 
INNER JOIN departamentos d 
ON d.id = e.departamento_id
WHERE d.nombre LIKE 'V%'
GROUP BY e.nombre, e.apellido, p.nombre
ORDER BY e.nombre DESC;

-- Encuentra el nombre del cliente, el nombre del producto y la cantidad comprada de productos con un precio superior a $500.

SELECT c.nombre, p.nombre, sum(v.cantidad) AS Cantidad_total
FROM clientes c
INNER JOIN ventas v 
ON c.id = v.empleado_id
INNER JOIN productos p 
ON p.id = v.producto_id 
WHERE p.precio > 500
GROUP BY c.nombre, p.nombre
ORDER BY c.nombre DESC;

-- ✏️Ejercicios JOIN Parte 2
-- Calcula la cantidad de ventas por departamento, incluso si el departamento no tiene ventas.

SELECT d.nombre, COUNT(v.id) AS Cantidad_ventas
FROM departamentos d
LEFT JOIN empleados e 
ON d.id = e.departamento_id
LEFT JOIN ventas v 
ON e.id = v.empleado_id
GROUP BY d.nombre 
ORDER BY d.nombre DESC;

SELECT d.nombre, COUNT(v.cantidad) AS Cantidad_ventas
FROM ventas v
RIGHT JOIN empleados e
ON v.empleado_id = e.id
RIGHT JOIN departamentos d 
ON e.departamento_id = d.id
GROUP BY d.nombre
ORDER BY Cantidad_ventas DESC;

-- Encuentra el nombre y la dirección de los clientes que han comprado más de 3 productos y muestra la cantidad de productos comprados.

SELECT c.nombre, c.direccion, COUNT(DISTINCT v.producto_id) AS Cantidad
FROM clientes c
INNER JOIN ventas v 
ON v.cliente_id = c.id
GROUP BY c.nombre, c.direccion
HAVING Cantidad > 3
ORDER BY Cantidad DESC;

/* innecesaria manera de hacerlo
SELECT c.nombre, c.direccion, COUNT(DISTINCT v.producto_id) AS Cantidad
FROM clientes c
LEFT JOIN ventas v 
ON v.cliente_id = c.id
GROUP BY c.nombre, c.direccion
HAVING Cantidad > 3
ORDER BY Cantidad DESC;

SELECT c.nombre, c.direccion, COUNT(DISTINCT v.producto_id) AS Cantidad
FROM ventas v
RIGHT JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nombre, c.direccion
HAVING Cantidad > 3
ORDER BY Cantidad DESC;*/

-- Calcula el monto total de ventas realizadas por cada departamento y muestra el nombre del departamento junto con el monto total de ventas.

SELECT d.nombre, SUM(v.monto_total) AS Total_ventas
FROM ventas v
INNER JOIN empleados e
ON v.empleado_id = e.id
INNER JOIN departamentos d 
ON e.departamento_id = d.id
GROUP BY d.nombre
ORDER BY Total_ventas DESC;

/*innecesaria manera de hacerlo
SELECT d.nombre, SUM(v.monto_total) AS Total_ventas
FROM ventas v
LEFT JOIN empleados e
ON v.empleado_id = e.id
LEFT JOIN departamentos d 
ON e.departamento_id = d.id
GROUP BY d.nombre
ORDER BY Total_ventas DESC;

SELECT d.nombre, SUM(v.monto_total) AS Total_ventas
FROM departamentos d
RIGHT JOIN empleados e ON e.departamento_id = d.id
RIGHT JOIN ventas v ON v.empleado_id = e.id
GROUP BY d.nombre
ORDER BY Total_ventas DESC;*/

-- ✏️  Actividad: Ejercicios Complementarios
-- ✨ Estos ejercicios son de tipo complementario. Esto quiere decir que te ayudará a avanzar en profundidad en el tema visto, pero no son obligatorios. Te recomendamos intentar con tu equipo trabajar algunos de ellos. 
-- Muestra el nombre y apellido de los empleados que pertenecen al departamento de "Recursos Humanos" y han realizado más de 5 ventas.

SELECT e.nombre, e.apellido, d.nombre , COUNT(v.id) AS Cantidad_ventas
FROM empleados e
INNER JOIN ventas v 
ON e.id = v.empleado_id
INNER JOIN departamentos d 
ON d.id = e.departamento_id
WHERE d.nombre LIKE 'R%' 
GROUP BY e.nombre, e.apellido, d.nombre 
HAVING COUNT(v.id) > 5
ORDER BY e.nombre DESC;

-- Muestra el nombre y apellido de todos los empleados junto con la cantidad total de ventas que han realizado, incluso si no han realizado ventas.

SELECT e.nombre, e.apellido, COUNT(v.cantidad) AS Cantidad_ventas, COALESCE(SUM(V.monto_total),0) AS Total_ventas
FROM empleados e
LEFT JOIN ventas v 
ON e.id = v.empleado_id
GROUP BY e.nombre, e.apellido
ORDER BY e.nombre DESC;

-- Encuentra el empleado más joven de cada departamento y muestra el nombre del departamento junto con el nombre y la edad del empleado más joven.

SELECT d.nombre AS Departamento, e.nombre AS Nombre, e.apellido AS Apellido, e.edad AS Edad
FROM empleados e
INNER JOIN departamentos d ON e.departamento_id = d.id
WHERE e.edad = (
    SELECT MIN(e1.edad)
    FROM empleados e1
    WHERE e1.departamento_id = e.departamento_id
)
ORDER BY d.nombre, e.nombre, e.apellido;

-- Calcula el volumen de productos vendidos por cada producto (por ejemplo, menos de 5 como "bajo", entre 5 y 10 como "medio", y más de 10 como "alto") y muestra la categoría de volumen junto con la cantidad y el nombre del producto.

select SUM(v.cantidad) as Cantidad_total,  
CASE
WHEN SUM(v.cantidad) < 5 THEN 'Bajo'
WHEN SUM(v.cantidad) >= 5 AND SUM(v.cantidad) < 8 THEN 'Medio'
ELSE 'Alto'
END AS Categoria, 
p.nombre
FROM ventas v 
INNER JOIN productos p 
ON p.id = v.producto_id 
GROUP BY p.nombre 
ORDER BY Cantidad_total desc;
