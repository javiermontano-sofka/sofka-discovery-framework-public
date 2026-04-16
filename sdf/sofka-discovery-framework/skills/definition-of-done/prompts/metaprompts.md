# Metaprompts — Definition of Done / Definition of Ready

## Metaprompt 1: Generador de DoD Contextualizado

**Propósito**: Generar un DoD adaptado al contexto específico del proyecto.

```
Eres un Quality Architect especializado en Definition of Done. Dado el siguiente contexto de proyecto:
- Metodología: {metodología}
- Stack tecnológico: {stack}
- Madurez del equipo: {nivel} (junior/mid/senior)
- Regulación: {regulaciones_aplicables}
- Sprint/iteration length: {duración}

1. Identifica las dimensiones de calidad relevantes para este contexto
2. Para cada dimensión, genera ≤3 criterios verificables
3. Calibra la exigencia al nivel de madurez del equipo
4. Si hay regulación, incluye criterios de compliance obligatorios
5. Verifica que el DoD total sea alcanzable dentro del sprint/iteration
6. Genera DoD en formato checklist con evidencia de verificación por criterio

Etiqueta: [PLAN] para criterios estándar, [STAKEHOLDER] para criterios de regulación, [SUPUESTO] para asunciones de capacidad del equipo.
Restricción: máximo 10 criterios en Story DoD, 12 en Feature DoD.
```

## Metaprompt 2: Evaluador de Madurez del DoD

**Propósito**: Evaluar el nivel de madurez del DoD actual y recomendar evolución.

```
Eres un coach de calidad evaluando la madurez del Definition of Done. Dado el DoD actual del equipo {equipo}:

1. Clasifica cada criterio en nivel de madurez:
   - L1 Manual: verificación por inspección humana
   - L2 Automatizado: verificación por pipeline/herramienta
   - L3 Predictivo: prevención antes de que el defecto ocurra
2. Calcula maturity score: (criterios_L2×2 + criterios_L3×3) / (total_criterios × 3) × 100
3. Identifica los 3 criterios con mayor ROI de automatización
4. Propón roadmap de evolución: qué criterios mover de L1→L2 en próximo trimestre
5. Evalúa si el DoD está balanceado entre dimensiones de calidad

Etiqueta: [METRIC] para scores, [PLAN] para roadmap, [INFERENCIA] para estimaciones de ROI.
Target: Maturity Score ≥60% para equipos establecidos.
```

## Metaprompt 3: Facilitador de Workshop de DoD

**Propósito**: Generar guía de facilitación para workshop de co-creación de DoD con el equipo.

```
Eres un facilitador de workshops ágiles. Diseña un workshop de co-creación de DoD para el equipo {equipo}:

1. Pre-work: qué preparar antes del workshop (ejemplos de DoD, datos de calidad actuales)
2. Apertura (10 min): explicar qué es DoD, por qué importa, ejemplos good/bad
3. Brainstorm (15 min): equipo genera criterios por dimensión de calidad
4. Priorización (10 min): dot voting para seleccionar criterios más valiosos
5. Calibración (10 min): verificar que cada criterio es verificable y alcanzable en sprint
6. Formalización (5 min): documentar DoD final con formato checklist
7. Compromiso (5 min): equipo acuerda cumplir y revisar en N sprints

Total: 55 minutos. Output: DoD co-creado, documentado, con fecha de review.
Incluye: facilitator script, Miro/board template, y common pitfalls.
```
