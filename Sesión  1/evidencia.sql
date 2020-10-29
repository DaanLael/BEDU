-- Reto 1
SHOW TABLES;
DESCRIBE articulo;
DESCRIBE puesto;
DESCRIBE venta;
-- Tipo	       Descripción
-- ìnt	       Números enteros.
-- varchar	   Cadenas de caracteres.
-- timestamp   Fechas.
-- double	   Números con decimales.
-- Reto 2
Select nombre from empleado where id_puesto=4;
SELECT * from puesto where salario>10000;
SELECT * from articulo where precio>1000 and iva>100;
SELECT * FROM venta where id_articulo in (135,963) and id_empleado in(835,369);
-- Reto 3
SELECT * FROM tienda ORDER BY salario DESC LIMIT 5;