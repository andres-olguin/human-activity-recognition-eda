# Evaluación y evolución propuesta — human-activity-recognition-eda

**Fecha:** 2026-11-04. Diagnóstico de archivos consultados, no auditoría de seguridad concluida.

## Evidencia

Scripts de exploración de datos 01_eda_limpieza.R y 02_modelado.R (vacío), junto con dataset UCI HAR y residuos __MACOSX; el estudio previo de 'infraestructura' no corresponde al contenido visible.

## Backlog priorizado

1. Corregir README y documentación para reflejar estudio de datos de actividad humana y metodología de R, sin confundirlo con proyecto IoT.
2. Separar datos descargados con atribución/licencia UCI, evitar archivos de sistema operativo y fijar versión de R y paquetes.
3. Definir plan de modelado sin afirmar resultados; llenar 02_modelado.R solo después de criterios, split train/test y control de fuga de datos.

## Criterio de cierre verificable

EDA ejecutable reproduciblemente, dataset citado, ninguna precisión inventada y archivos innecesarios excluidos mediante .gitignore.

## Controles

Conservar atribuciones y licencias. No exponer secretos, datos de terceros ni conectarse a producción en una prueba. Registrar resultados reales y revisar cambios en PR; el presente documento no equivale a despliegue ni aprobación técnica.
