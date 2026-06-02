# HR Analytics Data Warehouse Project

## 📌 Overview

Proyecto de analítica de Recursos Humanos orientado al análisis organizacional mediante arquitectura de Data Warehouse, procesos ETL y visualización de datos en Power BI.

El proyecto fue desarrollado utilizando archivos Excel como fuente de datos, procesos ETL para transformación y limpieza de información, y un Data Warehouse implementado en MySQL para análisis organizacional.

El objetivo principal del proyecto es generar insights relacionados con:

* Rotación de personal
* Headcount organizacional
* Brecha salarial
* Demografía laboral
* Tendencias organizacionales
* People Analytics

---

# 🏗️ Project Architecture

```text
Excel Files (Data Source)
        │
        ▼
Talend Open Studio (ETL)
        │
        ▼
MySQL Data Warehouse
        │
        ▼
Power BI Dashboard
        │
        ▼
Future Machine Learning Integration
```

---

# 🧰 Technologies Used

| Tool               | Purpose                   |
| ------------------ | ------------------------- |
| MySQL              | Data Warehouse            |
| Talend Open Studio | ETL Processes             |
| Power BI           | Data Visualization        |
| SQL                | Data Modeling & Analytics |

---

# 📊 Dashboard Features

## HR Analytics KPIs

* Headcount
* Turnover Rate
* Attrition Analysis
* Salary Gap Analysis
* Workforce Demographics
* Employee Trends

---

# 🧱 Data Warehouse Model

El proyecto fue diseñado utilizando modelado dimensional (Star Schema) para optimizar consultas analíticas y escalabilidad.

## Main Components

### Fact Table

* `fact_movimientos_empleados`

### Dimensions

* `dim_empleado`
* `dim_departamento`
* `dim_division`
* `dim_empresa`
* `dim_puestos`
* `dim_tiempo`

---

# ⚙️ ETL Process

Los procesos ETL fueron desarrollados en Talend Open Studio para:

* Extracción de datos desde archivos Excel
* Limpieza y transformación de datos
* Integración de información organizacional
* Carga de datos hacia MySQL
* Estandarización de atributos analíticos

---

# 📈 Power BI Dashboard

El dashboard fue desarrollado en Power BI para analizar métricas organizacionales y KPIs de Recursos Humanos mediante visualizaciones interactivas.

## Main KPIs

* Índice de rotación
* Total de bajas
* Headcount promedio
* Salario promedio
* Edad promedio
* Brecha generacional
* Motivos de baja

## Dashboard Preview

### Employee Turnover Dashboard

![HR Analytics Dashboard](docs/dashboard_rotacion.png)


## Dashboard Features

* Filtros dinámicos por:

  * Año
  * Mes
  * Departamento
  * Tipo de contrato
  * Centro de costos

* Visualización de:

  * Rotación organizacional
  * Distribución generacional
  * Motivos de baja
  * Métricas demográficas

---

# 🚀 Project Roadmap

## Current Scope

* Data Warehouse Development
* ETL Pipelines
* HR Analytics Dashboard
* SQL Analytical Queries

## Future Improvements

* Machine Learning Integration
* Employee Attrition Prediction
* Predictive HR Analytics
* Advanced Workforce Segmentation
* Incremental ETL Loads

---

# 📂 Repository Structure

```text
hr-analytics-datawarehouse/
│
├── README.md
├── Model Multidimensional/
├── Proceso ETL/
├── Dashboard - rrhh/
│   └── dashboard_rotacion.png
```

---

# 🔒 Data Privacy

Este proyecto utiliza estructuras de datos anonimizadas y/o sintéticas con fines educativos y de portafolio profesional.

No se comparte información sensible ni datos personales reales.

---

# 📬 Contact

## Author

**Ismael Martínez**

LinkedIn: https://www.linkedin.com/in/ismaelmart%C3%ADnezluna/
GitHub: https://github.com/IsmaelDataAnalyst
