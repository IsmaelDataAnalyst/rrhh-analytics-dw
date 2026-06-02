CREATE DATABASE rrhh_dw;

USE rrhh_dw;

CREATE TABLE dim_empresa (
empresa_id INT NOT NULL PRIMARY KEY,
empresa CHAR(9) NOT NULL
);

CREATE TABLE dim_departamentos (
depto_id INT NOT NULL PRIMARY KEY,
departamento VARCHAR(60) NOT NULL
);

CREATE TABLE dim_division (
division_id INT NOT NULL PRIMARY KEY,
division VARCHAR(15) NOT NULL
);

CREATE TABLE dim_ceco (
ceco_id INT NOT NULL PRIMARY KEY,
descripcion VARCHAR(90) NOT NULL
);

CREATE TABLE dim_organizacion (
organizacion_id INT NOT NULL PRIMARY KEY,
organizacion_nom VARCHAR(15) NOT NULL
);

CREATE TABLE dim_empleado (
empleado_id INT NOT NULL PRIMARY KEY,
sexo CHAR(2) NULL,
fecha_nacimiento DATE NULL,
fecha_ingreso DATE NULL,
nacionalidad CHAR(3) NULL,
tipo_contrato VARCHAR(10) NULL,
sindicalizado CHAR(2) NULL
);

CREATE TABLE dim_tiempo (
tiempo_id INT NOT NULL PRIMARY KEY,
fecha_reporte DATE NOT NULL
);

CREATE TABLE dim_puestos (
puesto_id INT NOT NULL PRIMARY KEY,
puesto VARCHAR(90) NOT NULL,
categoria VARCHAR(90) NOT NULL
);


CREATE TABLE fact_movimientos_empleados (
fact_id INT PRIMARY KEY NOT NULL,
empleado_id INT,
depto_id INT,
puesto_id INT,
division_id INT,
organizacion_id INT,
ceco_id INT,
tiempo_id INT,
empresa_id INT,
activos tinyint NULL,
altas tinyint NULL,
bajas tinyint NULL,
motivo_baja VARCHAR(60) NULL,
tipo_rotacion VARCHAR(60) NULL,
salario NUMERIC(10,0) NULL,

FOREIGN KEY(empleado_id) REFERENCES dim_empleado(empleado_id)
	ON DELETE SET NULL
   	ON UPDATE SET NULL,
FOREIGN KEY(depto_id) REFERENCES dim_departamentos(depto_id)
	ON DELETE SET NULL
    ON UPDATE SET NULL,
FOREIGN KEY(puesto_id) REFERENCES dim_puestos(puesto_id)
	ON DELETE SET NULL
    ON UPDATE SET NULL,
FOREIGN KEY(division_id) REFERENCES dim_division(division_id)
	ON DELETE SET NULL
    ON UPDATE SET NULL,
FOREIGN KEY(organizacion_id) REFERENCES dim_organizacion(organizacion_id)
	ON DELETE SET NULL
    ON UPDATE SET NULL,
FOREIGN KEY(ceco_id) REFERENCES dim_ceco(ceco_id)
	ON DELETE SET NULL
    ON UPDATE SET NULL,
FOREIGN KEY(tiempo_id) REFERENCES dim_tiempo(tiempo_id)
	ON DELETE SET NULL
    ON UPDATE SET NULL,
FOREIGN KEY(empresa_id) REFERENCES dim_empresa(empresa_id)
	ON DELETE SET NULL
    ON UPDATE SET NULL
);
