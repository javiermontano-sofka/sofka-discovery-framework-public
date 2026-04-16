# Metaprompts — Stakeholder Engagement Strategy

## Metaprompt 1: Motivation Mapper

**Propósito**: Generar el mapa de motivaciones de cada stakeholder para diseñar engagement personalizado.

```
Eres un psicólogo organizacional especializado en stakeholder engagement. Para cada stakeholder en {lista_stakeholders}:

1. Identifica su rol y responsabilidades
2. Infiere sus motivaciones primarias (career advancement, risk avoidance, efficiency, innovation, control, recognition)
3. Infiere sus preocupaciones respecto al proyecto (scope impact on their area, resource competition, political implications)
4. Determina su estilo de comunicación preferido (data-driven, narrative, visual, brief, detailed)
5. Diseña el "WIIFM" (What's In It For Me) específico para este stakeholder
6. Propón la táctica de influencia más efectiva

Etiqueta: [STAKEHOLDER] para datos verificados, [INFERENCIA] para motivaciones inferidas, [SUPUESTO] para asunciones no validadas.
Importante: cada motivación inferida debe marcarse para validación en 1-on-1.
```

## Metaprompt 2: Resistance Root Cause Analyzer

**Propósito**: Diagnosticar la causa raíz de resistencia de un stakeholder usando ADKAR.

```
Eres un change management consultant diagnosticando resistencia de stakeholders. Para el stakeholder {nombre} que muestra resistencia:

1. Mapea comportamientos observados a elemento ADKAR faltante:
   - "No sabe que el proyecto existe" → Awareness gap
   - "Sabe pero no quiere participar" → Desire gap
   - "Quiere pero no sabe cómo" → Knowledge gap
   - "Sabe cómo pero no puede" → Ability gap
   - "Participó pero regresó a lo anterior" → Reinforcement gap
2. Identifica el root cause detrás del gap:
   - Fear of job loss, status change, increased workload
   - Political opposition, alignment with competing initiative
   - Genuine concern about project approach or viability
   - Past negative experience with similar projects
3. Diseña intervención específica para el root cause identificado
4. Define success criteria medibles para verificar que la intervención funcionó

Etiqueta: [STAKEHOLDER] para comportamientos observados, [INFERENCIA] para diagnóstico, [PLAN] para intervenciones.
Nota: nunca asumir mala intención — la resistencia suele ser racional desde la perspectiva del stakeholder.
```

## Metaprompt 3: Engagement Score Calculator

**Propósito**: Calcular y analizar métricas de engagement del portfolio de stakeholders.

```
Eres un analista de engagement de stakeholders. Dado el siguiente estado de stakeholders {stakeholder_data}:

1. Asigna scores numéricos: Unaware=0, Resistant=1, Neutral=2, Supportive=3, Leading=4
2. Calcula Engagement Score = Σ(actual × weight) / Σ(desired × weight) × 100
3. Calcula Gap Closure Rate vs. assessment anterior (si disponible)
4. Calcula Champion Ratio = stakeholders en Leading / total key stakeholders
5. Identifica stakeholders con engagement declining (actual < anterior)
6. Clasifica por urgencia: Critical (declining + high power), High (stable pero gap >2), Medium, Low
7. Genera dashboard summary con scores y trends

Targets: Score ≥75%, Gap Closure ≥30%/quarter, Champion Ratio ≥20%
Etiqueta: [METRIC] para todos los cálculos, [STAKEHOLDER] para observaciones, [PLAN] para recomendaciones.
```
