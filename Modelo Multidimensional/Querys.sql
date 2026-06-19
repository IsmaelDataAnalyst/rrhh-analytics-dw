# Vistas
Use rrhh_dw;

SELECT *FROM dim_empleado;
# Salario de empleados activos por puesto y departamento
CREATE VIEW empleado_sueldos AS SELECT F.empleado_id AS id_empleado ,D.departamento AS depto ,P.puesto AS puestos, T.fecha_reporte, F.activos, F.salario
	FROM fact_movimientos_empleados AS F INNER JOIN dim_departamentos AS D ON F.depto_id = D.depto_id INNER JOIN dim_puestos AS P ON F.puesto_id = P.puesto_id
		INNER JOIN dim_tiempo AS T ON F.tiempo_id = T.tiempo_id
			WHERE F.activos = 1 AND F.salario >0;
			

# Promedio empleados por mes
CREATE VIEW vw_promedio_empleado_mes AS SELECT AVG(total_empleados) AS promedio_empleados_mes
	FROM ( SELECT T.fecha_reporte, COUNT(DISTINCT F.empleado_id) AS total_empleados
		FROM fact_movimientos_empleados F INNER JOIN dim_tiempo T ON F.tiempo_id = T.tiempo_id
			WHERE F.activos = 1
				GROUP BY T.fecha_reporte) AS empleados_mes;


# Análisis de la brecha generacional
CREATE VIEW vw_rrhh_analisis_generacional AS SELECT CONCAT(LEFT(F.empleado_id, 4),"#") AS 'idEmpleado',CONCAT(LEFT(D.departamento, 5),"#") AS 'departamento',P.puesto, 
O.organizacion_nom AS 'Unidad de negocio', T.fecha_reporte, timestampdiff(YEAR, E.fecha_ingreso, T.fecha_reporte) AS 'Antigüedad',
E.sexo AS 'Género', timestampdiff(YEAR,E.fecha_nacimiento, T.fecha_reporte) AS 'Edad', 
CASE
	WHEN YEAR(E.fecha_nacimiento) BETWEEN 1946 AND 1964 THEN '4.-Baby Boomer'
    WHEN YEAR(E.fecha_nacimiento) BETWEEN 1965 AND 1980 THEN '3.-Generación X'
    WHEN YEAR(E.fecha_nacimiento) BETWEEN 1981 AND 1996 THEN '2.-Millennial'
    WHEN YEAR(E.fecha_nacimiento) BETWEEN 1997 AND 2012 THEN '1.-Generación Z'
	ELSE 'Sin clasificar'
		END AS Brecha_generacional,
CASE
	WHEN timestampdiff(YEAR,E.fecha_nacimiento, T.fecha_reporte) >= 60 THEN 'Alto'
    WHEN timestampdiff(YEAR,E.fecha_nacimiento, T.fecha_reporte) >= 55 THEN 'Medio'
    ELSE 'Bajo'
    END AS RiesgoJubilacion
		FROM fact_movimientos_empleados AS F INNER JOIN dim_empleado AS E ON F.empleado_id = E.empleado_id INNER JOIN dim_tiempo AS T ON F.tiempo_id = T.tiempo_id
			INNER JOIN dim_departamentos AS D ON F.depto_id = D.depto_id INNER JOIN dim_puestos AS P ON F.puesto_id = P.puesto_id INNER JOIN dim_organizacion AS O ON
				F.organizacion_id = O.organizacion_id;





