# Use Case Prompts — Risk & Controlling Dynamics

> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> **© Comunidad MetodologIA** — Todos los derechos reservados

---

## Propósito

Prompts específicos para escenarios de uso frecuentes del skill `risk-controlling-dynamics`. Cada prompt incluye contexto, variables esperadas, y criterios de calidad del output.

---

## UC-01: Workshop de Pre-Mortem Estructurado

### Escenario

El equipo ha aprobado un escenario en Gate 1 y necesita ejecutar un pre-mortem antes de comprometer recursos significativos. El objetivo es identificar las causas más probables de fracaso y diseñar mitigaciones preventivas.

### Prompt

```
Ejecuta un pre-mortem estructurado para el proyecto {PROYECTO}.

Contexto del proyecto:
- Escenario aprobado: {ESCENARIO}
- Duración estimada: {DURACIÓN}
- Inversión estimada (magnitud): {MAGNITUD}
- Equipo propuesto: {EQUIPO}
- Tecnologías clave: {STACK}
- Cliente / industria: {INDUSTRIA}

Premisa: "Es {FECHA_FIN + 3 meses}. El proyecto fracasó espectacularmente.
El cliente está frustrado, la relación dañada, y el equipo desmoralizado."

Genera:
1. Mínimo 8 causas de fracaso (técnicas, organizacionales, financieras, de gobernanza)
2. Señales tempranas para cada causa (qué veríamos HOY si esto fuera a pasar)
3. Probabilidad calibrada de cada causa (%)
4. Plan de prevención concreto para las top 3 causas
5. Kill criteria: condiciones bajo las cuales se debe abandonar el enfoque

{MODO_OPERACIONAL}=premortem
{FORMATO}=markdown
```

### Variables

| Variable | Ejemplo |
|---|---|
| `{PROYECTO}` | "Modernización Core Bancario - Banco Nacional" |
| `{ESCENARIO}` | "Migración progresiva con strangler fig pattern" |
| `{DURACIÓN}` | "18 meses" |
| `{MAGNITUD}` | "FTE-meses equivalentes a equipo de 12 por 18 meses" |
| `{EQUIPO}` | "8 seniors MetodologIA + 4 SMEs cliente + 2 arquitectos" |
| `{STACK}` | "Java 21, Spring Boot 3, Kafka, PostgreSQL, Kubernetes" |
| `{INDUSTRIA}` | "Banca regulada (SFC)" |

### Criterios de Calidad

- [ ] Mínimo 8 causas de fracaso cubren todas las categorías de riesgo
- [ ] Señales tempranas son observables HOY, no retrospectivas
- [ ] Probabilidades son calibradas honestamente (no todas 20-30%)
- [ ] Top 3 causas tienen plan de prevención accionable con owner
- [ ] Kill criteria son condiciones binarias verificables
- [ ] Diagrama mindmap (Mermaid) de causas de fracaso

---

## UC-02: Validación de Supuestos Cross-Phase

### Escenario

El pipeline de discovery ha avanzado a Phase 4 (Roadmap) y se necesita un inventario consolidado de todos los supuestos hechos en fases anteriores, con evaluación de riesgo y plan de validación.

### Prompt

```
Consolida y stress-testea todos los supuestos del discovery para {PROYECTO}.

Fases completadas: {FASES_COMPLETADAS}
Entregables disponibles: {ENTREGABLES}

Para cada supuesto encontrado:
1. Identifica la fase de origen y el entregable que lo contiene
2. Clasifica la evidencia: [CÓDIGO] [CONFIG] [DOC] [INFERENCIA] [SUPUESTO] [STAKEHOLDER]
3. Asigna nivel de confianza honesto (0-100%)
4. Evalúa impacto si el supuesto es FALSO
5. Ejecuta test de inversión: ¿qué pasa si es exactamente LO CONTRARIO?
6. Define validación requerida para supuestos con confianza <60% e impacto alto

Genera tabla de supuestos priorizados y lista de MUST VALIDATE antes de propuesta.
```

### Variables

| Variable | Ejemplo |
|---|---|
| `{PROYECTO}` | "Platform Digital - Retail XYZ" |
| `{FASES_COMPLETADAS}` | "Phase 0, 1, 2, 3" |
| `{ENTREGABLES}` | "01_Stakeholder_Map, 03_AS-IS, 04_Flows, 05_Scenarios" |

### Criterios de Calidad

- [ ] TODOS los supuestos de todas las fases están inventariados
- [ ] Evidence tags presentes en cada supuesto
- [ ] Niveles de confianza son realistas (distribución variada, no todos 70%)
- [ ] Test de inversión ejecutado para supuestos críticos
- [ ] Lista MUST VALIDATE priorizada por impacto
- [ ] Cada item MUST VALIDATE tiene método de validación concreto

---

## UC-03: Assessment de Riesgo Financiero

### Escenario

El equipo de cost-estimation ha producido magnitudes para el roadmap y se necesita una evaluación independiente de controles financieros: drift, hidden costs, contingency adequacy, y honestidad del Cone of Uncertainty.

### Prompt

```
Ejecuta el assessment de controles financieros para {PROYECTO}.

Magnitudes del roadmap:
- FTE-meses totales: {FTE_MESES}
- Distribución por fase: {DISTRIBUCIÓN}
- Contingencia aplicada: {CONTINGENCIA}%
- Innovation margin: {INNOVATION}%

Magnitudes de fases anteriores:
- Phase 3 (Scenarios) estimaba: {EST_PHASE3}
- Phase 3b (Feasibility) estimaba: {EST_PHASE3B}

Hidden cost drivers conocidos:
{HIDDEN_COSTS}

Evalúa:
1. Magnitude drift entre phases — ¿es coherente la evolución?
2. Hidden cost drivers — ¿faltan categorías?
3. Contingency adequacy — ¿la contingencia correlaciona con el risk register?
4. Innovation margin — ¿está presente y protegido?
5. Cone of Uncertainty — ¿los rangos son honestos o artificialmente estrechos?
6. Confidence bands: P50 / P80 / P95

Genera financial controls dashboard con semáforos.
```

### Variables

| Variable | Ejemplo |
|---|---|
| `{PROYECTO}` | "Migración Cloud - Telco ABC" |
| `{FTE_MESES}` | "72 FTE-meses" |
| `{DISTRIBUCIÓN}` | "Phase 1: 12, Phase 2: 24, Phase 3: 24, Phase 4: 12" |
| `{CONTINGENCIA}` | "15" |
| `{INNOVATION}` | "5" |
| `{EST_PHASE3}` | "60-80 FTE-meses" |
| `{EST_PHASE3B}` | "65-75 FTE-meses" |
| `{HIDDEN_COSTS}` | "Training K8s, migration downtime, parallel running 3 meses" |

### Criterios de Calidad

- [ ] Magnitude drift cuantificado con variance y alerta si >15%
- [ ] Mínimo 8 categorías de hidden cost drivers evaluadas
- [ ] Contingency correlaciona con exposure total del risk register
- [ ] Innovation margin verificado como separado de contingencia
- [ ] Confidence bands P50/P80/P95 calculados
- [ ] Flowchart (Mermaid) de controles financieros y puntos de decisión

---

## UC-04: Setup de Risk Register para Nuevo Engagement

### Escenario

Se inicia un nuevo engagement de discovery y se necesita configurar el risk register inicial con el framework de apetito y tolerancia calibrado al contexto del cliente.

### Prompt

```
Configura el risk register y framework de apetito para el nuevo engagement {PROYECTO}.

Perfil del cliente:
- Industria: {INDUSTRIA}
- Tamaño: {TAMAÑO}
- Madurez tecnológica: {MADUREZ} (1-5)
- Regulación aplicable: {REGULACIÓN}
- Historial con MetodologIA: {HISTORIAL}

Scope del discovery:
- Tipo: {TIPO_DISCOVERY} (express/intermediate/full)
- Duración estimada: {DURACIÓN}
- Complejidad percibida: {COMPLEJIDAD} (baja/media/alta/muy alta)

Genera:
1. Risk Appetite & Tolerance Framework calibrado al contexto
2. Risk register inicial con 10-15 riesgos pre-identificados por categoría
3. Assumption log inicial (supuestos del momento cero)
4. Monitoring plan: qué métricas trackear, con qué frecuencia
5. Escalation matrix: quién decide qué cuando se cruzan umbrales

{MODO_OPERACIONAL}=integral
```

### Variables

| Variable | Ejemplo |
|---|---|
| `{PROYECTO}` | "Discovery Digital Transformation - Aseguradora XYZ" |
| `{INDUSTRIA}` | "Seguros (regulada por Superfinanciera)" |
| `{TAMAÑO}` | "Enterprise (5000+ empleados)" |
| `{MADUREZ}` | "3 (CI/CD parcial, microservicios incipientes)" |
| `{REGULACIÓN}` | "Circular 007 SFC, Ley 1581 habeas data" |
| `{HISTORIAL}` | "Primer engagement" |
| `{TIPO_DISCOVERY}` | "full" |
| `{DURACIÓN}` | "6 semanas" |
| `{COMPLEJIDAD}` | "alta" |

### Criterios de Calidad

- [ ] Framework de apetito tiene las 5 dimensiones calibradas al contexto
- [ ] Umbrales inaceptables reflejan la regulación aplicable
- [ ] Risk register inicial cubre las 8 categorías
- [ ] Riesgos iniciales tienen probabilidad e impacto estimados
- [ ] Monitoring plan tiene métricas leading (no solo lagging)
- [ ] Escalation matrix define autoridad por nivel de exposure
- [ ] Quadrant chart (Mermaid) de probabilidad vs impacto

---

## UC-05: Modelado de Worst-Case Scenario

### Escenario

El steering committee solicita un análisis de peor escenario para un proyecto de alto riesgo. Necesitan entender qué es lo peor que puede pasar y cuánto costaría.

### Prompt

```
Modela el worst-case scenario para {PROYECTO}.

Parámetros del proyecto:
- Timeline base: {TIMELINE}
- Magnitud base: {MAGNITUD}
- Equipo base: {EQUIPO}
- Riesgos conocidos más críticos: {RIESGOS_TOP}
- Supuestos con menor confianza: {SUPUESTOS_CRITICOS}

Para el worst-case scenario:
1. Asume que los 3 riesgos más críticos se materializan simultáneamente
2. Asume que los 2 supuestos con menor confianza resultan FALSOS
3. Asume que ocurre 1 evento inesperado (Black Swan plausible para la industria)

Calcula:
- Timeline worst-case (vs base)
- Magnitud worst-case (vs base)
- Impacto reputacional
- Cascada de consecuencias (qué se rompe primero, qué sigue)

Genera:
1. Narrativa del worst-case (storytelling — qué pasó, por qué, cómo)
2. Costo total del worst-case vs costo de mitigación preventiva
3. Recomendación: ¿el worst-case es aceptable o es kill criterion?

{MODO_OPERACIONAL}=premortem
```

### Criterios de Calidad

- [ ] Worst-case es plausible, no apocalíptico (debe ser creíble)
- [ ] Cascada de consecuencias muestra efectos de segundo y tercer orden
- [ ] Costo del worst-case está cuantificado en magnitudes
- [ ] Comparación costo de mitigación vs costo de materialización
- [ ] Recomendación clara con justificación basada en evidencia
- [ ] El Black Swan es específico a la industria, no genérico

---

## UC-06: Definición de Risk Appetite para Cliente Regulado

### Escenario

El cliente opera en una industria altamente regulada (banca, salud, telecomunicaciones). Los umbrales de riesgo deben calibrarse considerando requisitos regulatorios específicos.

### Prompt

```
Define el framework de apetito de riesgo para el engagement {PROYECTO}
en industria regulada.

Marco regulatorio aplicable:
{MARCO_REGULATORIO}

Requisitos de compliance específicos:
{REQUISITOS_COMPLIANCE}

Historial regulatorio del cliente:
- Sanciones previas: {SANCIONES}
- Auditorías pendientes: {AUDITORIAS}
- Nivel de escrutinio del regulador: {ESCRUTINIO}

Genera:
1. Risk Appetite Framework con dimensión regulatoria explícita
2. Mapping de requisitos regulatorios a gate criteria
3. Compliance risk register (riesgos específicos regulatorios)
4. Red lines regulatorias (condiciones de STOP absoluto)
5. Protocolo de escalación para hallazgos regulatorios

Las dimensiones del framework deben incluir:
- Técnico, Timeline, Costo, Calidad, Reputacional (estándar)
- Regulatorio (específico para industria regulada)
- Legal/contractual (obligaciones formales)
```

### Criterios de Calidad

- [ ] Marco regulatorio específico citado (no genérico)
- [ ] Umbrales regulatorios son conservadores (no hay margen para error)
- [ ] Gate criteria incluyen checkpoints de compliance
- [ ] Red lines regulatorias son absolutas (no negociables)
- [ ] Escalación regulatoria tiene ruta directa a legal/compliance del cliente
- [ ] Framework diferencia riesgos regulatorios de riesgos operacionales

---

## UC-07: Risk Hardening de Propuesta Pre-Envío

### Escenario

La propuesta está lista para enviar al cliente pero necesita una revisión final desde la perspectiva de riesgos. El controller debe validar que la propuesta es honesta, defensible, y no promete lo que no puede cumplir.

### Prompt

```
Ejecuta risk hardening de la propuesta para {PROYECTO} antes de envío.

Artefactos de la propuesta:
- Spec funcional: {SPEC_STATUS}
- Pitch ejecutivo: {PITCH_STATUS}
- Roadmap: {ROADMAP_STATUS}
- Risk register actual: {RISK_REGISTER_STATUS}

Checklist de hardening:
1. ¿La propuesta promete algo que la spec no respalda?
2. ¿Los business cases tienen supuestos documentados?
3. ¿Las magnitudes tienen Cone of Uncertainty comunicado?
4. ¿Los riesgos que el cliente DEBE conocer están disclosed?
5. ¿Los riesgos internos están mitigados sin alarmar innecesariamente?
6. ¿Las cláusulas de escape están definidas? (gates, kill criteria)
7. ¿Los milestones con go/no-go son explícitos?
8. ¿La sección de supuestos existe y es transparente?
9. ¿Hay red lines activas que deberían bloquear el envío?

Genera:
1. Hardening scorecard (cada check con PASS/FAIL/WARNING)
2. Disclosures recomendadas para el cliente
3. Mitigaciones internas requeridas antes de envío
4. Red flags (si existen) con recomendación
5. RISK CONTROLLER FINAL ASSESSMENT (READY / READY WITH DISCLOSURES / NOT READY)

{MODO_OPERACIONAL}=integral
{VARIANTE}=técnica
```

### Criterios de Calidad

- [ ] Cada check del hardening tiene veredicto con evidencia
- [ ] Disclosures son honestas sin ser alarmistas
- [ ] Mitigaciones internas tienen owner y deadline pre-envío
- [ ] Red flags tienen recomendación accionable
- [ ] Final assessment es uno de los tres estados definidos
- [ ] Assessment incluye conteo de open risks, unvalidated assumptions, financial controls
