# Use Case Prompts — Hypothesis-Driven Development

> Ready-to-use prompts for the most frequent use cases of this skill.
> Each prompt includes context on when to use it, the exact prompt, and the expected output.

---

## 1. Scenario-to-Hypothesis Conversion

**When:** The scenario-analysis (05_Escenarios_ToT) produced a recommended scenario. Now testable hypotheses are needed to validate the critical assumptions of the scenario before committing to the full roadmap.

**Expected output:** Portfolio of 3-7 hypotheses with complete structure (belief + metric + experiment + threshold + decision criteria), prioritized by riskiest assumption.

```
Del escenario recomendado en {PATH_ESCENARIOS}, extraer los supuestos criticos y
convertirlos en hipotesis testeables.

Escenario recomendado: {NOMBRE_ESCENARIO} (score: {SCORE})
Inversion total del roadmap: {INVERSION_TOTAL}

Para cada supuesto critico del escenario:
1. Formular hipotesis con estructura completa:
   - Belief: "Creemos que [outcome] se lograra si [condicion]"
   - Metric: metrica accionable (NO vanity metric) con unidad y fuente
   - Experiment: tipo (spike/PoC/MVP/A/B/shadow), duracion, equipo, costo
   - Threshold: 3 niveles (persevere / pivot / kill) con valores numericos
   - Decision criteria: que significa cada decision para el roadmap

2. Clasificar cada hipotesis por tipo:
   - Value hypothesis (valida si entrega valor al usuario)
   - Growth hypothesis (valida si puede escalar)
   - Architecture hypothesis (valida si la arquitectura cumple quality attributes)

3. Priorizar por riskiest assumption:
   - ¿Cual supuesto, si resulta falso, invalida todo el escenario?
   - Ese se valida primero.

4. Calcular ratio de inversion:
   - Costo total de experimentacion vs inversion total del roadmap
   - Target: 3-8% del total

{MODO}: piloto-auto
{FORMATO}: markdown
```

---

## 2. Experiment Design

**When:** The hypotheses are already formulated. Concrete experiments need to be designed with sufficient detail for an engineering team to execute them.

**Expected output:** Experiment Design Document with detailed instructions per hypothesis: setup, execution, measurement, and completion criteria.

```
Disenar los experimentos para las hipotesis del portfolio {PATH_HIPOTESIS}.

Para cada hipotesis, producir:

1. SETUP del experimento:
   - Prerequisitos tecnicos (infra, datos, accesos)
   - Equipo necesario (roles, seniority, dedicacion)
   - Dependencias con otros experimentos
   - Criterios de inicio (definition of ready)

2. EJECUCION:
   - Pasos detallados del experimento (1, 2, 3...)
   - Duracion esperada con milestones intermedios
   - Checkpoints de sanity (dia 3, dia 7, etc.)
   - Criterios de aborto temprano (si algo va muy mal, parar antes)

3. MEDICION:
   - Instrumentacion necesaria (logs, dashboards, scripts)
   - Frecuencia de medicion (real-time, diario, al final)
   - Tamano de muestra minimo para significancia
   - Formato del reporte de resultados

4. FINALIZACION:
   - Criterios de "experimento completo" (vs "experimento incompleto")
   - Template para documentar resultado y decision
   - Siguiente paso por cada decision (persevere → que escalar, pivot → que cambiar, kill → que hacer con el aprendizaje)

Incluir Experiment Design Matrix resumen (tabla).

{FORMATO}: markdown
{VARIANTE}: tecnica
```

---

## 3. BML Cycle Tracking

**When:** Experiments are in execution. A dashboard/status report of the Build-Measure-Learn cycle is needed for each hypothesis.

**Expected output:** BML Status Report with current status of each hypothesis, partial results, and decision projection.

```
Generar BML Status Report para el portfolio de hipotesis {PATH_HIPOTESIS}.

Para cada hipotesis en el portfolio:

1. ESTADO ACTUAL:
   - Fase: Build / Measure / Learn / Complete
   - Progreso: dia {N} de {TOTAL}
   - Bloqueadores activos (si los hay)

2. RESULTADOS PARCIALES (si en fase Measure o Learn):
   - Metricas actuales vs threshold
   - Tendencia: mejorando / estable / degradandose
   - Proyeccion: si la tendencia continua, ¿cual sera la decision?

3. ALERTAS:
   - ¿Algun resultado parcial ya indica kill temprano?
   - ¿Algun experimento esta excediendo el presupuesto/timeline?
   - ¿Hay dependencias bloqueadas entre hipotesis?

4. PORTFOLIO VIEW:
   - Tabla resumen de todas las hipotesis con semaforo
   - Learning velocity: ciclos BML completados por semana
   - Burn rate de presupuesto de experimentacion

Incluir diagrama Mermaid del portfolio con estados actuales.

{FORMATO}: markdown
{VARIANTE}: tecnica
```

---

## 4. Kill/Pivot/Persevere Decision

**When:** An experiment has completed its Measure cycle. Results need to be analyzed against thresholds and the formal decision documented.

**Expected output:** Formal Decision Document with evidence, analysis, and documented decision for the steering committee.

```
Analizar resultados del experimento {HIPOTESIS_ID} y documentar decision formal.

Hipotesis: {DESCRIPCION_HIPOTESIS}
Threshold definido:
- Persevere: {CRITERIO_PERSEVERE}
- Pivot: {CRITERIO_PIVOT}
- Kill: {CRITERIO_KILL}

Resultados del experimento:
{RESULTADOS}

Producir Decision Document con:

1. EVIDENCIA:
   - Datos cuantitativos: metricas medidas vs thresholds
   - Datos cualitativos: feedback de usuarios, observaciones del equipo
   - Confianza en los datos: tamano de muestra, duracion, representatividad

2. ANALISIS:
   - ¿Los resultados caen claramente en una zona (kill/pivot/persevere)?
   - ¿O estan en el borde entre dos zonas? Si si, que evidencia adicional se necesita?
   - Sesgo check: ¿hay presion organizacional para una decision particular?
   - Sunk cost check: ¿la inversion ya realizada esta influyendo la decision?

3. DECISION:
   - Decision formal: KILL / PIVOT / PERSEVERE
   - Rationale en 3-5 oraciones
   - Implicaciones para el roadmap
   - Si PIVOT: nueva hipotesis propuesta (H{N}b)
   - Si KILL: aprendizaje clave y como se aplica
   - Si PERSEVERE: plan de escalamiento

4. FIRMAS:
   - Technical Architect: [firma]
   - Risk Controller: [firma]
   - Delivery Manager: [firma]

{FORMATO}: markdown
{VARIANTE}: tecnica
```

---

## 5. Hypothesis Portfolio Review

**When:** Periodic review (biweekly or monthly) of the complete hypothesis portfolio. Portfolio health, learning velocity need to be evaluated, and priorities adjusted.

**Expected output:** Portfolio Review Report with portfolio metrics, insights, and recommended adjustments.

```
Ejecutar revision de portfolio de hipotesis para {PROYECTO}.

Portfolio actual: {PATH_HIPOTESIS}

Producir Portfolio Review con:

1. PORTFOLIO HEALTH:
   - Total hipotesis: activas / completadas / backlog
   - Distribucion por tipo: value / growth / architecture
   - Distribucion por decision: persevere / pivot / kill / pending
   - ¿Es saludable la distribucion? (target: 30-40% kill/pivot indica buena calibracion)

2. LEARNING VELOCITY:
   - Ciclos BML completados este periodo
   - Tiempo promedio por ciclo BML
   - Tendencia: acelerando / estable / desacelerando
   - Costo por aprendizaje validado

3. INVESTMENT ANALYSIS:
   - Presupuesto de experimentacion consumido vs planificado
   - ROI de la experimentacion: riesgo evitado (kills) + valor desbloqueado (perseveres)
   - Forecast: presupuesto restante vs hipotesis pendientes

4. ADJUSTMENTS:
   - ¿Hipotesis que deben re-priorizarse?
   - ¿Nuevas hipotesis emergentes del aprendizaje?
   - ¿Hipotesis en backlog que ya no son relevantes (context changed)?
   - ¿Se necesita ajustar thresholds basado en aprendizaje acumulado?

5. RECOMMENDATIONS:
   - Top 3 acciones para el proximo periodo
   - Alertas para el steering committee

Incluir diagrama Mermaid del portfolio con estado actual.

{FORMATO}: markdown
```

---

## 6. Architecture Hypothesis (Fitness Functions)

**When:** Architecture-specific hypotheses are needed that will be implemented as automated fitness functions in the CI/CD pipeline.

**Expected output:** Architecture Hypothesis Document with hypotheses formulated as fitness functions, including technical implementation.

```
Generar hipotesis de arquitectura para {SISTEMA} basadas en los quality attributes
del escenario recomendado en {PATH_ESCENARIOS}.

Para cada quality attribute critico, formular una architecture hypothesis:

1. HIPOTESIS:
   - Belief: "Creemos que la arquitectura {APPROACH} mantendra {QUALITY_ATTRIBUTE}
     dentro de {THRESHOLD} bajo {CONDITIONS}"
   - Metric: metrica tecnica medible automaticamente
   - Fitness Function: test automatizado que valida continuamente

2. IMPLEMENTACION como FITNESS FUNCTION:
   - Tipo: atomic (1 metrica) o holistic (multiples metricas compuestas)
   - Trigger: on-commit / nightly / on-deploy / continuous
   - Implementacion: herramienta (k6, JMeter, ArchUnit, dependency-check, etc.)
   - Threshold: pass/fail con valores numericos
   - Alerta: ¿que pasa cuando la fitness function falla?

3. EXPERIMENT para validar la fitness function:
   - ¿Como validamos que el threshold es correcto?
   - Spike/PoC para establecer baseline
   - Duracion y costo del experimento de calibracion

Quality attributes tipicos a cubrir:
- Performance (latency, throughput)
- Scalability (elasticity, capacity)
- Security (vulnerability count, OWASP compliance)
- Maintainability (coupling, complexity, test coverage)
- Reliability (MTTR, error rate, availability)

{FORMATO}: markdown
{VARIANTE}: tecnica
```

---

## 7. Value Hypothesis for Commercial Model

**When:** Hypotheses are needed to validate whether the proposed solution generates measurable commercial value, feeding the discovery's commercial model.

**Expected output:** Value Hypothesis Document with commercial value hypotheses linked to revenue drivers, cost reduction, or risk mitigation.

```
Generar hipotesis de valor comercial para {PROYECTO} que alimenten el commercial-model.

Del escenario recomendado: {NOMBRE_ESCENARIO}
Modelo comercial propuesto: {TIPO_MODELO} (ej: licencia, SaaS, revenue share, cost savings)

Para cada driver de valor del modelo comercial:

1. VALUE HYPOTHESIS:
   - Belief: "Creemos que {SOLUCION} generara {VALOR_MEDIBLE} para {BENEFICIARIO}
     en {HORIZONTE_TEMPORAL}"
   - Valor medible: expresado en magnitudes (FTE-meses, % reduccion, time savings)
     NUNCA en precios
   - Metrica proxy: indicador temprano que predice el valor final

2. EXPERIMENT:
   - ¿Como validamos el valor ANTES de la implementacion completa?
   - Tipo de experimento: encuesta, PoC con medicion, pilot con metricas
   - Duracion y costo
   - Datos necesarios del cliente para medir

3. THRESHOLD:
   - Persevere: el valor proyectado justifica la inversion del roadmap
   - Pivot: hay valor pero menor al esperado — ajustar modelo o scope
   - Kill: el valor no se materializa — replantear la propuesta comercial

4. LINK al COMMERCIAL MODEL:
   - ¿Que seccion del modelo comercial alimenta esta hipotesis?
   - ¿Como cambia el modelo si la hipotesis se mata?

Categorias de valor a cubrir:
- Revenue enablement (nuevos ingresos habilitados por la solucion)
- Cost reduction (ahorro operativo medible)
- Risk mitigation (riesgo evitado, cuantificado en magnitudes)
- Time-to-market (aceleracion medible)

{FORMATO}: markdown
NOTA: Solo magnitudes y drivers, NUNCA precios.
```

---

**Author:** Javier Montano | **Last updated:** March 13, 2026
**© Comunidad MetodologIA — All rights reserved**
