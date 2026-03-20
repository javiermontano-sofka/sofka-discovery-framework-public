---
name: metodologia-storytelling
author: Javier Montaño · Comunidad MetodologIA
argument-hint: "<story-type: transformation|scenario|risk|success|cross-deliverable> <audience: executive|technical|mixed>"
description: >
  Narrative arc design and transformation metodologia-storytelling for discovery deliverables.
  Use when structuring the overall narrative across deliverables, building scenario
  narratives, crafting transformation stories (current pain → decision → future state),
  or designing risk narratives and success reference stories.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
---

# Storytelling — Narrative Arc & Transformation Stories

Designs the narrative architecture that transforms raw analysis into compelling transformation stories. Owns story arcs across deliverables, scenario narratives, risk stories, and evidence-based transformation narratives.

## Guiding Principle

**Data informs. Stories transform.** A technical finding is a data point. A finding wrapped in context, consequence, and a path to action is a story that moves people to act. Storytelling does not decorate data — it gives data the narrative structure so the reader remembers, understands, and acts.

### Narrative Philosophy

1. **Every story has tension.** Without conflict there is no narrative. The conflict in discovery is: current state vs. desired state. The gap is the story.
2. **Characters are real.** The end user, the operator, the decision-maker — each one experiences the gap differently. Their perspectives enrich the narrative.
3. **Evidence is the anchor.** A story without data is fiction. Data without a story is noise. Storytelling unites them.
4. **The arc spans all deliverables.** From Plan (00) to Handover (09), there is ONE narrative arc: discovery → revelation → decision → transformation.

## Inputs

- `$1` — Story type: `transformation`, `scenario`, `risk`, `success`, `cross-deliverable` (default: `transformation`)
- `$2` — Audience: `executive`, `technical`, `mixed` (default: `mixed`)

Parse from `$ARGUMENTS`.

## Narrative Architectures

### Master Arc (Cross-Deliverable)

```
00 Plan        → "Nos comprometemos a descubrir la verdad del sistema"
01 Stakeholders → "Estas son las personas que viven con el sistema"
02 Brief       → "El panorama en 3 minutos"
03 AS-IS       → "La realidad técnica, sin adornos"      ← TENSIÓN MÁXIMA
04 Flows       → "Así fluye (o no fluye) el valor"
05 Scenarios   → "Tres futuros posibles"                  ← PUNTO DE DECISIÓN
06 Roadmap     → "El camino elegido, paso a paso"
07 Spec        → "Lo que vamos a construir, exactamente"
08 Pitch       → "Por qué actuar ahora"                   ← CALL TO ACTION
09 Handover    → "Cómo empezar el lunes"                  ← RESOLUCIÓN
10 Hallazgos   → "Lo que descubrimos, para quien decide"
11 Recomendac. → "Lo que recomendamos, y por qué"
12 IA Opport.  → "Cómo la IA acelera la transformación"
```

### Transformation Narrative (Per-Deliverable)

```
Act 1: Current State (Pain)
  ├── Contextualize: "El equipo de [N] personas dedica [X]% de su tiempo a..."
  ├── Quantify: "[Y] incidentes/mes, [Z] horas de workaround"
  └── Personalize: "El operador de turno debe..."

Act 2: Decision Point (Tension)
  ├── Fork: "Si no se actúa: [COI projection]"
  ├── Options: "Tres caminos posibles..."
  └── Evidence: "Basado en [tags], recomendamos..."

Act 3: Future State (Resolution)
  ├── Vision: "En 12 meses, el equipo podrá..."
  ├── Metrics: "Time-to-market de [X] a [Y], disponibilidad de [A]% a [B]%"
  └── First step: "Sprint 0 comienza con..."
```

### Scenario Narrative (Deliverable 05)

Each scenario is a **plausible future**, not just a technical option:

```
Scenario [Name]:
  "Imagine que en 18 meses..."
  ├── Vivid future: What daily work looks like
  ├── How we got here: Key decisions and investments
  ├── What we gained: Quantified benefits
  ├── What it cost: FTE-months, trade-offs
  └── What we risked: Identified risks and mitigations
```

### Risk Narrative (Not Fear-Mongering)

```
Pattern: Consequential Thinking
  "Si [riesgo] se materializa → [impacto cuantificado] →
   [cascada de consecuencias] → [punto de no retorno en N meses]"

Tone: Factual, not alarmist
  ❌ "El sistema colapsará"
  ✅ "Con la tendencia actual de [X] incidentes/mes creciendo [Y]%,
      el equipo alcanzará capacidad de respuesta máxima en Q3,
      requiriendo [Z] FTE adicionales para mantener SLAs"
```

### Success Reference Stories

```
Pattern: Industry Analogy
  "[Empresa comparable en sector] enfrentó [dolor similar].
   Con [enfoque seleccionado], logró [resultado cuantificado] en [plazo].
   Nuestro escenario B sigue un patrón similar, adaptado a [contexto cliente]."

Source: metodologia-sector-intelligence skill provides benchmarks
```

## Narrative Techniques

| Technique | When to Use | Example |
|-----------|-------------|---------|
| **Contrast** | Before/after, AS-IS vs TO-BE | "Hoy: 12 semanas. Mañana: 4 semanas." |
| **Escalation** | Building urgency | Finding → implication → cascade → crisis |
| **Analogy** | Making technical tangible | "Es como renovar una casa habitada" |
| **Perspective** | Multi-stakeholder | "Para el desarrollador... Para el PM... Para el CTO..." |
| **Progression** | Building the case | Evidence 1 + Evidence 2 + Evidence 3 = Conclusion |
| **Callback** | Cross-deliverable coherence | "Como vimos en 03_AS-IS § Acoplamiento..." |

## Thread Management

Narrative threads that must be consistent across ALL deliverables:

| Thread | Introduced In | Resolved In |
|--------|--------------|-------------|
| Technical debt cost | 03 AS-IS | 06 Roadmap, 08 Pitch |
| User pain | 01 Stakeholders, 04 Flows | 07 Spec, 09 Handover |
| Risk exposure | 03 AS-IS | 05 Scenarios, 08 Pitch |
| Value proposition | 05 Scenarios | 06 Roadmap, 08 Pitch |
| Transformation path | 05 Scenarios | 06 Roadmap, 09 Handover |

## Output Configuration

- **Language**: Spanish (Latin American, business register — simple, clear, concise, direct)
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*

## Validation Gate

| Criterion | Check |
|-----------|-------|
| Narrative arc present | Tension → Decision → Resolution visible |
| Evidence-grounded | No story without data; no data without story |
| Cross-references active | Callbacks to prior deliverables where relevant |
| Personalization present | At least one stakeholder perspective per major finding |
| Tone calibrated | Executive ≠ technical ≠ mixed |
| No orphan stories | Every narrative thread resolved by Pitch/Handover |

## Supuestos y Limites

- Los hallazgos tecnicos ya existen como input; esta skill estructura la narrativa, no genera datos.
- Las historias deben estar ancladas en evidencia. Especulacion debe llevar tag [SUPUESTO] explicito.
- Esta skill posee **estructura narrativa y arcos de historia**. NO posee calidad de prosa (eso es copywriting) ni narrativas de visualizacion de datos (eso es data-storytelling).
- El arco maestro cubre entregables 00-12. Si el discovery es parcial, adaptar el arco a los entregables disponibles.

## Casos Borde

| Caso Borde | Estrategia de Manejo |
|---|---|
| Cliente sin analisis previo (discovery desde cero) | Construir narrativa exclusivamente desde analisis de codigo. Enmarcar como "el discovery revela lo que el codigo nos dice". Usar la ausencia de documentacion como tension narrativa. |
| AS-IS positivo (sistema en buen estado, caso raro) | Buscar tension en escalabilidad, costo de oportunidad, o presion competitiva. "El sistema funciona hoy, pero el crecimiento proyectado de X% lo llevara al limite en Y meses." |
| Multiples streams de transformacion en paralelo | Tejer narrativas paralelas con punto de resolucion compartido. Usar tecnica de "callback" entre streams. Crear timeline visual que muestre convergencia. |
| Audiencia hostil o esceptica al cambio | Liderar con datos incuestionables [CODIGO]. Evitar recomendaciones tempranas. Construir caso acumulativamente: evidencia 1 + 2 + 3 = conclusion inevitable. Incluir "devil's advocate" section. |

## Decisiones y Trade-offs

| Decision | Justificacion | Alternativa Descartada |
|---|---|---|
| Arco narrativo unico cross-deliverable (00-12) | Coherencia total: cada entregable avanza la historia. El stakeholder percibe un argumento acumulativo, no documentos aislados. | Entregables narrativamente independientes: pierden fuerza acumulativa; el lector no conecta hallazgos. |
| Tension como motor narrativo obligatorio | Sin conflicto no hay narrativa. La brecha entre estado actual y estado deseado es el motor que mueve al lector hacia la decision. | Narrativa descriptiva sin tension: informativa pero no accionable; no motiva decision. |
| Evidencia como ancla de toda historia | Diferencia storytelling de ficcion. El lector ejecutivo detecta narrativas sin sustento y pierde confianza. | Historias sin datos: percibidas como opinion; pierden credibilidad con audiencias tecnicas. |
| Perspectiva multi-stakeholder | Enriquece la narrativa mostrando como el mismo problema afecta a diferentes roles. Genera empatia cross-funcional. | Perspectiva unica: pierde a parte de la audiencia; no refleja complejidad organizacional. |

## Knowledge Graph

```mermaid
graph TD
    subgraph Core["Core: Storytelling"]
        ARC[Master Arc 00-12]
        TRANS[Transformation Narrative]
        SCENARIO[Scenario Narrative]
        RISK[Risk Narrative]
    end

    subgraph Inputs["Inputs"]
        TYPE[Story Type]
        AUD[Audiencia]
        FINDINGS[Hallazgos Tecnicos]
        STAKEHOLDERS[Perspectivas Stakeholders]
    end

    subgraph Outputs["Outputs"]
        MASTER[Cross-Deliverable Arc]
        SCENE[Scenario Stories]
        RISKN[Risk Narratives]
        SUCCESS[Success Reference Stories]
    end

    subgraph Related["Related Skills"]
        COPY[copywriting]
        DATASTORY[data-storytelling]
        EDITORIAL[editorial-director]
        SECTOR[sector-intelligence]
    end

    TYPE --> ARC
    AUD --> TRANS
    FINDINGS --> SCENARIO
    STAKEHOLDERS --> RISK
    ARC --> MASTER
    TRANS --> SCENE
    SCENARIO --> SCENE
    RISK --> RISKN
    SECTOR --> SUCCESS
    COPY --> Core
    DATASTORY --> Core
    EDITORIAL --> ARC
```

## Output Templates

### Template 1: Transformation Narrative (Markdown)

**Filename:** `Narrative_{project}_{deliverable}_{WIP|Aprobado}.md`

```markdown
# Narrativa de Transformacion: {project}

## Acto 1: Estado Actual (Dolor)
### Contexto
{Equipo de [N] personas dedica [X]% de su tiempo a...}

### Cuantificacion
{[Y] incidentes/mes, [Z] horas de workaround}

### Perspectiva Humana
{El operador de turno debe... El desarrollador enfrenta...}

## Acto 2: Punto de Decision (Tension)
### Sin Accion
{Proyeccion COI: costo acumulado en N trimestres}

### Opciones
{3 caminos posibles con trade-offs}

### Evidencia
{Tags y datos que soportan la recomendacion}

## Acto 3: Estado Futuro (Resolucion)
### Vision
{En 12 meses, el equipo podra...}

### Metricas Objetivo
{Time-to-market de [X] a [Y], disponibilidad de [A]% a [B]%}

### Primer Paso
{Sprint 0 comienza con...}
```

### Template 2: Scenario Narrative (Markdown)

**Filename:** `Scenario_Narrative_{project}_{scenario}_{WIP|Aprobado}.md`

```markdown
# Escenario {Name}: {project}

## "Imagine que en 18 meses..."
{Descripcion vivida del futuro: como se ve el trabajo diario}

## Como Llegamos Aqui
{Decisiones clave e inversiones realizadas}

## Que Ganamos
| Beneficio | Metrica Actual | Metrica Proyectada | Evidencia |
|---|---|---|---|

## Que Costo
{FTE-meses, trade-offs explicitos, que se sacrifico}

## Que Arriesgamos
| Riesgo | Probabilidad | Impacto | Mitigacion |
|---|---|---|---|
```

### Template 3: HTML (bajo demanda)

- Filename: `{fase}_Narrative_{project}_{WIP|Aprobado}.html`
- Estructura: HTML self-contained branded (Design System MetodologIA v5). Dark-First Executive. Incluye timeline visual del arco maestro (00-12), cards de escenario con tensión/resolución, y sección de callbacks cross-entregable. WCAG AA, responsive, print-ready.

### Template 4: DOCX (bajo demanda)

- Filename: `{fase}_storytelling_{cliente}_{WIP}.docx`
- Generado con python-docx y MetodologIA Design System v5. Portada con tipo de historia y audiencia, TOC automático, encabezados Poppins navy, cuerpo Montserrat, acentos dorados, tablas zebra. Secciones: Arco Maestro (cross-deliverable), Narrativa de Transformación (3 actos), Narrativas de Escenario, Narrativas de Riesgo, Success Reference Stories.

### Template 5: PPTX (bajo demanda)

- Filename: `{fase}_storytelling_{cliente}_{WIP}.pptx`
- Generado con python-pptx y MetodologIA Design System v5. Slide master con gradiente navy, títulos Poppins, cuerpo Montserrat, acentos dorados. Máximo 20 slides (ejecutiva). Speaker notes con referencias de evidencia. Slides: Portada, Arco Maestro (00-12 timeline visual), Acto 1: Estado Actual (dolor cuantificado), Acto 2: Punto de Decisión (opciones y evidencia), Acto 3: Estado Futuro (visión y métricas objetivo), Narrativas de escenario (una por escenario relevante), Risk Narrative (consecuencias cuantificadas), Success Reference Story, próximos pasos.

### Template 6: XLSX (bajo demanda)

- Filename: `{fase}_storytelling_{cliente}_{WIP}.xlsx`
- Generado via openpyxl con MetodologIA Design System v5. Encabezados con fondo navy y texto Poppins blanco, cuerpo en Montserrat, zebra striping en filas. Hojas: Narrative Arc (entregable 00-12, tensión introducida, resolución, estado del thread), Thread Tracker (thread narrativo, entregable de introducción, entregable de resolución, estado activo/resuelto/pendiente), Scenario Narratives (escenario, visión futura, beneficio cuantificado, costo FTE-meses, riesgo principal), Risk Narratives (riesgo, consecuencia cuantificada, cascada de impacto, punto de no retorno). Conditional formatting por estado de threads (activo/resuelto/pendiente) y audiencia. Auto-filters en todas las hojas. Valores directos sin fórmulas.

## Evaluacion

| Dimension | Peso | Criterio |
|---|---|---|
| Trigger Accuracy | 10% | Se activa ante solicitudes de narrativa, arco de historia, transformation story, o scenario narrative |
| Completeness | 25% | Arco narrativo completo (tension -> decision -> resolucion), threads consistentes cross-deliverable, perspectiva multi-stakeholder |
| Clarity | 20% | Narrativa fluida; transiciones logicas entre actos; el lector entiende la progresion sin saltos |
| Robustness | 20% | Produce narrativas efectivas sin analisis previo, con AS-IS positivo, con audiencia esceptica |
| Efficiency | 10% | Genera estructura narrativa completa con parametros minimos (tipo + audiencia) |
| Value Density | 15% | Cada elemento narrativo aporta tension o resolucion; cero prosa decorativa sin funcion narrativa |

**Umbral minimo: 7/10**

## Cross-References

- `metodologia-copywriting` — Calidad de prosa y persuasion dentro de cada seccion narrativa
- `metodologia-data-storytelling` — Interpretacion de metricas que alimenta la narrativa
- `metodologia-editorial-director` — Coordinacion del arco maestro cross-entregable
- `metodologia-sector-intelligence` — Benchmarks y analogias sectoriales para success reference stories

## Edge Cases

- **Client with no prior analysis**: Build narrative from code analysis alone. Frame as "discovery reveals what code tells us".
- **Positive AS-IS (rare)**: Still find tension — usually in scalability, opportunity cost, or competitive pressure.
- **Multiple transformation streams**: Weave parallel narratives with shared resolution point.

## Limits

- This skill owns **narrative structure and story arcs**. It does NOT own prose quality (that's metodologia-copywriting) or data visualization narratives (that's metodologia-data-viz-storytelling).
- Stories must always be anchored in evidence. Speculation must be explicitly tagged [SUPUESTO].
