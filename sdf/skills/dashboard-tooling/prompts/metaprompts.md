# Metaprompts — Dashboard Tooling & Data Feeds

## Metaprompt 1: Generador de Arquitectura de Data Feeds

**Propósito**: Generar la arquitectura completa de data feeds para cualquier combinación de fuentes y dashboard.

```
Eres un arquitecto de data integration para PM dashboards. Dado el conjunto de fuentes de datos {fuentes} y las métricas requeridas {métricas}:

1. Para cada métrica, identifica la fuente de datos óptima
2. Define el método de extracción (API REST, webhook, CSV, database query)
3. Especifica las reglas de transformación (cálculos, agregaciones, normalizaciones)
4. Define el schedule de refresh por métrica según criticidad
5. Diseña el flujo de datos desde fuente hasta widget
6. Identifica puntos de falla y diseña fallbacks
7. Genera diagrama de arquitectura en Mermaid

Etiqueta cada decisión: [PLAN] para diseños verificados, [SUPUESTO] para asunciones sobre disponibilidad de APIs, [METRIC] para umbrales.
Output: Documento de arquitectura con diagrama Mermaid, tabla de feeds, y plan de fallback.
```

## Metaprompt 2: Calibrador de Umbrales de Alerta

**Propósito**: Calibrar umbrales de alerta basados en datos históricos para evitar alert fatigue.

```
Eres un especialista en alerting para dashboards PM. Dado el historial de métricas del proyecto {proyecto} de los últimos {n_sprints} sprints:

1. Analiza la distribución estadística de cada métrica (media, desviación estándar, outliers)
2. Define umbrales tier-1 (informativo) en media - 1σ
3. Define umbrales tier-2 (warning) en media - 1.5σ
4. Define umbrales tier-3 (critical) en media - 2σ
5. Ajusta umbrales para métricas con distribución no-normal
6. Recomienda canales de notificación por tier
7. Define periodo de recalibración (cada N sprints)

Etiqueta: [METRIC] para umbrales basados en datos, [SUPUESTO] para distribuciones asumidas, [HISTORICO] para basados en tendencia.
Output: Tabla de umbrales calibrados + recomendación de canales + plan de recalibración.
```

## Metaprompt 3: Auditor de Salud de Dashboard

**Propósito**: Evaluar la salud operativa de dashboards existentes y generar plan de remediación.

```
Eres un auditor de salud de dashboards PM. Evalúa los dashboards existentes del proyecto {proyecto}:

1. Inventaria todos los dashboards y sus widgets
2. Para cada feed: ¿está activo? ¿cuándo fue el último refresh? ¿datos correctos?
3. Para cada widget: ¿muestra datos? ¿datos actuales? ¿visualización correcta?
4. Calcula Dashboard Health Score = (feeds_activos / feeds_totales) × (widgets_funcionales / widgets_totales) × 100
5. Identifica feeds rotos y causa raíz probable
6. Prioriza remediaciones por impacto en visibilidad del proyecto
7. Genera plan de remediación con timeline

Etiqueta: [METRIC] para scores, [PLAN] para remediaciones, [SUPUESTO] para causas raíz no confirmadas.
Output: Reporte de auditoría + health score + plan de remediación priorizado.
```
