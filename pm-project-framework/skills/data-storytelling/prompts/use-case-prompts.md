# Data Storytelling — Use Case Prompts

> Ready-to-use prompts to activate the skill in different contexts of the MetodologIA Discovery Framework.

---

## Prompt 1: Scoring Matrix Narrative

```
Tengo la siguiente matriz de scoring de evaluación arquitectónica 6D:
[PEGAR TABLA DE SCORING]

Aplica data-storytelling scoring para:
1. Identificar el patrón dominante entre dimensiones (no scores individuales)
2. Destacar anomalías positivas o negativas
3. Encontrar causas raíz compartidas entre dimensiones en rojo
4. Conectar cada hallazgo a una acción concreta del roadmap
5. Usar evidence tags en cada afirmación

Audiencia: {executive | technical | mixed}
```

## Prompt 2: DORA Metrics Interpretation

```
Estos son los datos DORA del equipo:
- Deployment Frequency: [valor]
- Lead Time for Changes: [valor]
- Change Failure Rate: [valor]
- MTTR: [valor]

Aplica data-storytelling metrics para:
1. Comparar contra benchmark DORA (elite/high/medium/low)
2. Descomponer cada métrica en sus componentes (ej: lead time = desarrollo + cola + QA + deploy)
3. Identificar cuál brecha tiene mayor impacto en negocio
4. Proyectar estado after con escenario de mejora
5. Tangibilizar el impacto en términos de calendario y capacidad del equipo

Contexto: [describir equipo, stack, proceso actual]
```

## Prompt 3: Magnitude Communication (FTE-months)

```
La estimación de esfuerzo para [proyecto/iniciativa] es de [N] FTE-meses.

Aplica data-storytelling financial para:
1. Traducir FTE-meses a equipo-equivalente (N personas × M meses)
2. Expresar como fracción del equipo actual ([tamaño equipo] personas)
3. Calcular impacto en velocity si se ejecuta en paralelo con BAU
4. Comparar costo de acción vs. costo de inacción
5. NUNCA usar valores monetarios — solo magnitudes en FTE-meses

Audiencia: {executive | technical | mixed}
```

## Prompt 4: Before/After with Projection

```
Estado actual de [sistema/proceso]:
[DATOS ACTUALES]

Estado proyectado post-[intervención]:
[DATOS PROYECTADOS O ESTIMADOS]

Aplica data-storytelling performance para:
1. Presentar cada métrica con formato Before → After → Delta → Impacto
2. Tangibilizar el delta en términos de negocio (tiempo, capacidad, riesgo)
3. Documentar la base de las proyecciones con evidence tags
4. Incluir disclaimer sobre nivel de confianza de proyecciones
5. Identificar qué métrica tiene el mayor retorno por unidad de esfuerzo

Contexto: [describir intervención propuesta]
```

## Prompt 5: Dashboard Narrative Sequence

```
Necesito una secuencia narrativa de 4 charts para presentación ejecutiva sobre [tema]:

Datos disponibles:
- Estado actual: [métricas headline]
- Histórico: [tendencia últimos N periodos]
- Benchmark: [referencia de comparación]
- Proyección: [escenario de mejora]

Aplica data-storytelling metrics audience=executive para:
1. Chart 1 (Headline): Resumen de estado actual en 1 métrica
2. Chart 2 (Context): Tendencia que explica cómo llegamos aquí
3. Chart 3 (Comparison): Gap vs. benchmark con interpretación
4. Chart 4 (Path): Proyección de cierre de brecha con hitos
5. Cada chart con párrafo narrativo que construye sobre el anterior

Formato: narrativa + descripción de visualización recomendada
```

## Prompt 6: Contradictory Finding

```
He encontrado métricas que parecen contradecirse:
- Métrica A: [valor] — sugiere [interpretación]
- Métrica B: [valor] — sugiere [interpretación contraria]

Aplica data-storytelling metrics para:
1. Presentar la contradicción como hallazgo (no como error)
2. Proponer hipótesis que reconcilien ambas métricas
3. Identificar qué dato adicional resolvería la contradicción
4. Etiquetar con [INFERENCIA] las hipótesis propuestas
5. Recomendar acción incluso con datos incompletos

Contexto: [fase del discovery, fuentes de datos disponibles]
```

## Prompt 7: Quantified Risk Narrative

```
Riesgos identificados en discovery:
[LISTA DE RIESGOS CON PROBABILIDAD E IMPACTO]

Aplica data-storytelling metrics para:
1. Convertir probabilidad × impacto en escenarios tangibles
2. Expresar impacto en FTE-meses de remediación (NUNCA valores monetarios)
3. Comparar costo de mitigación vs. costo de materialización
4. Ordenar por urgencia considerando ventanas de oportunidad
5. Conectar cada riesgo a acción preventiva del roadmap

Audiencia: {executive | technical | mixed}
```

## Prompt 8: Multi-Domain Metrics Executive Summary

```
Tengo métricas de múltiples dominios de un discovery:
- Arquitectura: [datos]
- DevOps/DORA: [datos]
- Seguridad: [datos]
- Calidad: [datos]
- Operaciones: [datos]

Aplica data-storytelling metrics audience=executive para:
1. Crear tabla resumen con: Área | Estado | Insight Principal | Acción
2. Identificar patrones cross-dominio (causas raíz compartidas)
3. Priorizar por impacto en negocio (no por severidad técnica)
4. Narrativa de 3-5 párrafos que cuente la historia completa
5. Evidence tags en cada afirmación, magnitudes en FTE-meses

Formato: TL;DR (5 bullets) + tabla + narrativa + cross-references
```
