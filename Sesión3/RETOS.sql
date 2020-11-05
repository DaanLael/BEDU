#                                                RETO 1

# Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
USE tienda;
# ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
SELECT nombre, apellido_paterno FROM empleado WHERE id_puesto IN (SELECT id_puesto FROM puesto WHERE salario<10000);
# ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado AS ID, min(total_ventas) AS Mínimo, max(total_ventas) AS Máximo
FROM
 (SELECT clave, id_empleado, count(*) AS total_ventas
      FROM venta
      GROUP BY clave, id_empleado) AS sq
GROUP BY id_empleado;
# ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
SELECT clave,id_articulo FROM venta WHERE id_articulo IN (SELECT id_articulo FROM articulo WHERE precio>5000);

#                                                RETO 2
# Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
USE tienda;
# ¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT clave,nombre,apellido_paterno FROM venta AS v JOIN empleado as e ON v.id_empleado=e.id_empleado ORDER BY clave;
# ¿Cuál es el nombre de los artículos que se han vendido?
SELECT clave, nombre FROM venta AS v JOIN articulo AS a ON v.id_articulo = a.id_articulo ORDER BY clave;
# ¿Cuál es el total de cada venta?
SELECT clave, sum(precio) AS Total FROM venta AS v JOIN articulo AS a ON v.id_articulo = a.id_articulo GROUP BY clave ORDER BY clave;

#                                                RETO 3
# Usando la base de datos tienda, define las siguientes vistas que permitan obtener la siguiente información.
USE tienda;
# Obtener el puesto de un empleado.
CREATE VIEW puestos AS 
(SELECT concat(e.nombre,' ', e.apellido_paterno),p.nombre
FROM empleado AS e
JOIN puesto AS p
	ON e.id_puesto=p.id_puesto);
SELECT * FROM puestos;
# Saber qué artículos ha vendido cada empleado.
CREATE VIEW empleado_articulo AS
(SELECT v.clave, concat(e.nombre, ' ', e.apellido_paterno) AS nombre, a.nombre AS articulo
FROM venta AS v
JOIN empleado AS e
  ON v.id_empleado = e.id_empleado
JOIN articulo AS a
  ON v.id_articulo = a.id_articulo
ORDER BY v.clave);
SELECT * FROM  empleado_articulo;
# Saber qué puesto ha tenido más ventas.
CREATE VIEW puesto_ventas122 AS
(SELECT p.nombre, count(v.clave) AS total
FROM venta AS v
JOIN empleado AS e
  ON v.id_empleado = e.id_empleado
JOIN puesto AS p
  ON e.id_puesto = p.id_puesto
GROUP BY p.nombre);
SELECT * FROM puesto_ventas ORDER BY total DESC LIMIT 1;
