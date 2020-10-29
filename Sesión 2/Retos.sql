#                                                RETO 1

#Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
USE tienda;
SHOW TABLES;
# ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT * FROM articulo WHERE nombre like "%Pasta%";
# ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT * FROM articulo WHERE nombre like "%Cannelloni%";
# ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT * FROM articulo WHERE nombre like "% - %";
# ¿Qué puestos incluyen la palabra Designer?
SELECT * FROM puesto WHERE nombre like "%Designer%";
# ¿Qué puestos incluyen la palabra Developer?
SELECT * FROM puesto WHERE nombre like "%Developer%";

#                                                RETO 2
#Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
# ¿Cuál es el promedio de salario de los puestos?
SELECT AVG(salario) AS Promedio_salarios FROM puesto;
# ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT COUNT(*) AS Artículos_pasta FROM articulo where nombre like "%Pasta%";
# ¿Cuál es el salario mínimo y máximo?
SELECT MIN(salario) AS Salario_mínimo, MAX(salario) AS Salario_máximo FROM puesto; 
# ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT SUM(salario) AS Suma_últimos_5_agregados
	FROM puesto WHERE id_puesto > (SELECT MAX(id_puesto) - 5 FROM puesto);

#                                                RETO 3
# Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
# ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre,COUNT(*) AS Registros FROM puesto GROUP BY nombre;
# ¿Cuánto dinero se paga en total por puesto?
SELECT nombre,SUM(salario) AS Suma_salarios FROM puesto GROUP BY nombre;
# ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado,count(clave) AS Ventas FROM venta GROUP BY id_empleado;
# ¿Cuál es el número total de ventas por artículo?;
SELECT id_articulo,count(*) AS Ventas FROM venta GROUP BY id_articulo;


