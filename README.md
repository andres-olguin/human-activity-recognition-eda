# Human Activity Recognition — Exploración de datos en R

**Laboratorio académico de análisis exploratorio de actividad humana** a partir del conocido conjunto de datos *Human Activity Recognition Using Smartphones* (UCI HAR). El repositorio contiene material del dataset y un script de análisis con comprobación de valores faltantes, distribución de clases, rangos de características y PCA.

> **Estado:** exploración parcial, no proyecto de machine learning terminado. `02_modelado.R` figura vacío en la versión revisada; no hay resultados de entrenamiento ni exactitud de clasificación reproducidos.

## Estructura

| Ruta | Propósito |
|---|---|
| [`01_eda_limpieza.R`](01_eda_limpieza.R) | Cálculo de NA, balance de actividades, rangos de variables y PCA |
| [`02_modelado.R`](02_modelado.R) | Archivo reservado para modelado; sin implementación confirmada |
| [`UCI HAR Dataset/`](UCI%20HAR%20Dataset/) | Archivos fuente del dataset educativo |
| [`UCI HAR Dataset.names`](UCI%20HAR%20Dataset.names) | Material descriptivo asociado |
| [`docs/`](docs/) | Investigación técnica y planificación |

## Requisitos

R y un entorno capaz de cargar los datos del corpus. El archivo `01_eda_limpieza.R` **no es autónomo**: presupone que existe un objeto `x_train` con 561 columnas de características y una columna `Actividad`, preparado previamente. Ejecutar `source("01_eda_limpieza.R")` sin cargar y transformar el dataset provocará errores.

Un flujo reproducible futuro deberá cargar archivos de train, mapear etiquetas de actividad, crear un data.frame con los nombres correctos y **solo entonces** ejecutar la EDA.

## Análisis que aparece en el código

- Recuento de `NA` en la tabla de entrenamiento.
- Distribución de las seis clases de actividad.
- Rango de características y evaluación de normalización.
- PCA y proporción acumulada de varianza explicada.
- Gráficos de componentes principales para estudiar separación por actividad.

Estos análisis **no demuestran capacidad predictiva** ni validación fuera del dataset de entrenamiento.

## Próximas entregas

1. Crear un script `00_cargar_datos.R` reproducible y fijar versiones de R y paquetes.
2. Documentar fuente, licencia y partición train/test del corpus.
3. Evitar fuga de datos separando evaluación por sujeto, según corresponda al protocolo.
4. Desarrollar baseline de clasificación con métricas honestas y matriz de confusión.
5. Eliminar residuos de sistema `__MACOSX` solo tras comprobar que no contienen material valioso.

[Hoja de ruta](docs/ENGINEERING_ROADMAP_2026-11-04.md) · [Estudio de ingeniería](docs/ARCHITECTURE_SCALABILITY_2026-11-04.md).

**Procedencia:** dataset UCI; documentar sus condiciones de redistribución antes de usarlo fuera del aula. No es software médico ni herramienta diagnóstica.
