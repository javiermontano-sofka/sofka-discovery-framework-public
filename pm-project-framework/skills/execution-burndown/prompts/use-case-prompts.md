# Use Case Prompts — Execution Burndown

> 6 prompts listos para usar con la skill `execution-burndown`. Copiar y adaptar segun contexto del proyecto.

---

## Prompt 1: Initial Burndown Setup

```
Configura el burndown inicial para {PROYECTO}.

Contexto:
- Equipo: {N} developers
- Backlog: {N} features (post-descomposicion, todas ≤3 SP)
- Timeline target: {N} dias habiles
- Sprint model: 1 dia = 1 sprint
- Modelo de productividad: 1 FTE = 1 feature/dia (desde Sprint 2)
- Ramp-up Sprint 1: 0.5x

Generar:
1. Parametros del burndown (features totales, capacidad diaria, dias estimados)
2. Burndown chart ideal (linea de plan con ramp-up en Sprint 1)
3. Umbrales de riesgo: dia 3 (early warning), dia 5 (mid-sprint), dia 10 (critical)
4. Checklist de prerequisitos (backlog refinado, entorno listo, equipo asignado)
5. Template de tracking diario (features plan vs. actual, impedimentos)

Formato: markdown con burndown chart en Mermaid xychart-beta
```

**Cuando usar:** Al inicio de un proyecto, despues de Sprint 0 (refinamiento y descomposicion). Antes de que el equipo empiece a ejecutar.

---

## Prompt 2: Mid-Project Velocity Check

```
Realiza el velocity check de mitad de proyecto para {PROYECTO}.

Estado actual:
- Dia: {N} de {TOTAL}
- Features completadas: {N} de {TOTAL}
- Features restantes: {N}
- Velocidad promedio observada: {N} features/dia/equipo
- Impedimentos acumulados: {LISTA}

Analizar:
1. Velocidad actual vs. modelo MetodologIA (1 FTE/feature/dia desde Sprint 2)
2. Burndown actualizado: plan vs. actual con linea de tendencia
3. Causas de desviacion (si aplica): ramp-up, impedimentos, descomposicion, DX
4. Flow metrics: cycle time P50/P85, WIP promedio, flow efficiency
5. Monte Carlo forecast: P50, P85, P95 basado en throughput historico
6. Semaforo general: 🟢 on-track / 🟡 alerta / 🔴 intervencion

Formato: markdown con burndown chart actualizado (Mermaid xychart-beta)
```

**Cuando usar:** En el punto medio del proyecto (dia 10 de 20, o cuando se tienen suficientes datos para Monte Carlo — minimo 5 dias de throughput).

---

## Prompt 3: Completion Projection Update

```
Actualiza la proyeccion de completitud para {PROYECTO}.

Datos de entrada:
- Throughput historico (features/dia): {LISTA de ultimos N dias}
- Features restantes: {N}
- Dias habiles restantes (plan original): {N}
- Impedimentos activos: {LISTA}

Generar:
1. Monte Carlo simulation (10,000 iteraciones) con percentiles P50, P85, P95
2. Comparacion con plan original: adelanto, on-track, o delay
3. Probabilidad de cumplir la fecha original
4. Rango de fechas con intervalos de confianza
5. Sensibilidad: que pasa si throughput mejora/empeora 10%, 20%
6. Recomendacion de fecha de compromiso para comunicar al cliente

Si la probabilidad de cumplir la fecha original es <70%:
- Proponer escenarios de ajuste (scope, timeline, equipo)
- Cuantificar cada escenario con nueva proyeccion Monte Carlo

Formato: markdown con tabla de percentiles y recomendacion clara
```

**Cuando usar:** Cuando se necesita actualizar la fecha de entrega comprometida. Especialmente util despues de impedimentos significativos o cambios de scope.

---

## Prompt 4: Scope Adjustment Analysis

```
Analiza el impacto de ajustar scope en {PROYECTO}.

Contexto actual:
- Features totales: {N}
- Features completadas: {N}
- Velocidad promedio (Sprint 2+): {N} features/dia
- Dias habiles restantes: {N}
- Fecha limite inamovible: {SI/NO}

Escenarios a evaluar:
A) Mantener scope completo — calcular nueva fecha de entrega (Monte Carlo P85)
B) Reducir {N} features de baja prioridad — validar que se cumple fecha original
C) Agregar {N} features (nuevo requerimiento) — calcular impacto en fecha
D) Re-priorizar: mover {N} features de alta prioridad adelante, diferir {N} de baja

Para cada escenario:
- Proyeccion Monte Carlo (P50, P85, P95)
- Features entregadas en fecha original vs. total
- Riesgo de ejecucion (bajo/medio/alto)
- Impacto en calidad (si aplica: mas presion = mas defectos potenciales)
- Recomendacion con justificacion

Formato: markdown con tabla comparativa de escenarios
```

**Cuando usar:** Cuando hay presion de scope (nuevos requerimientos, scope creep) o cuando la fecha es inamovible y se necesita negociar alcance.

---

## Prompt 5: Team Scaling Impact

```
Analiza el impacto de escalar el equipo en {PROYECTO}.

Estado actual:
- Developers actuales: {N}
- Velocidad actual: {N} features/dia/equipo
- Features restantes: {N}
- Dias habiles restantes: {N}
- Gap vs. plan: {N} dias

Escenarios de scaling:
A) Agregar 1 developer senior (ramp-up: Sprint 1 = 0.5x, Sprint 2+ = 1.0x)
B) Agregar 1 developer mid (ramp-up: Sprint 1 = 0.25x, Sprint 2 = 0.5x, Sprint 3+ = 1.0x)
C) Agregar 2 developers (considerar overhead de comunicacion: n(n-1)/2)
D) No agregar — usar otros levers (scope, re-descomposicion)

Para cada escenario, modelar:
- Curva de ramp-up del nuevo developer (MetodologIA ramp-up model)
- Impacto en velocidad del equipo existente (mentoring overhead: -0.5 features/dia dia 1-3)
- Burndown proyectado con nuevo equipo
- Monte Carlo P85 con nueva capacidad
- Brooks' Law assessment: ¿el scaling beneficia o perjudica?
- Break-even point: ¿en que dia el nuevo developer aporta mas de lo que consume?

Incluir:
- Grafico comparativo de burndowns (actual vs. +1 dev vs. +2 devs)
- Recomendacion fundamentada en Brooks' Law y datos del proyecto

Formato: markdown con burndown comparativo (Mermaid) y tabla de escenarios
```

**Cuando usar:** Cuando hay presion para agregar personas al equipo (tipicamente cuando el burndown muestra delay). Este prompt fuerza un analisis riguroso antes de tomar la decision — no siempre agregar es la respuesta.

---

## Prompt 6: Post-Mortem Velocity Review

```
Realiza el post-mortem de velocidad para {PROYECTO} (completado).

Datos del proyecto:
- Features planificadas: {N}
- Features entregadas: {N}
- Dias planificados: {N}
- Dias reales: {N}
- Equipo: {N} developers
- Velocidad promedio (Sprint 2+): {N} features/dia/equipo

Analizar:
1. Velocidad real vs. modelo MetodologIA (1 FTE/feature/dia): % de cumplimiento
2. Burndown retrospectivo: donde se desviaron plan y actual, y por que
3. Impediment analysis: clasificar impedimentos por tipo (DX, scope, dependencia, descomposicion)
4. Feature decomposition quality: % de features completadas en ≤1 dia vs. >1 dia
5. Ramp-up accuracy: Sprint 1 real vs. modelo 0.5x
6. Monte Carlo accuracy: como se comparo la proyeccion vs. la realidad
7. Flow metrics finales: cycle time distribution, throughput stability, WIP compliance

Generar:
- Lecciones aprendidas (5 max, accionables)
- Calibracion del modelo: ¿el equipo opera al X% del modelo MetodologIA?
- Recomendaciones para el siguiente proyecto
- Datos para actualizar el benchmark de productividad del equipo

Formato: markdown con graficos retrospectivos y tabla de lecciones aprendidas
```

**Cuando usar:** Al finalizar un proyecto, como insumo para mejora continua. Los datos generados calibran el modelo de productividad para futuros proyectos con el mismo equipo.

---

## Notas de Uso

- Todos los prompts asumen modelo MetodologIA: 1 FTE = 1 feature/dia (Sprint 2+), ramp-up Sprint 1 = 0.5x
- Reemplazar `{PLACEHOLDERS}` con datos especificos del proyecto
- El Prompt 1 (Setup) es prerequisito para los demas
- Secuencia tipica: Setup (1) → Velocity Checks periodicos (2) → Projection Updates (3) → Adjustments si necesario (4, 5) → Post-Mortem (6)
- Monte Carlo requiere minimo 5 dias de throughput para ser confiable

---

**Autor:** Javier Montaño | **Ultima actualizacion:** 13 de marzo de 2026
