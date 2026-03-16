---
name: sofka-storytelling
author: Equipo PreSales Sofka
description: >
  Narrative arc design and transformation sofka-storytelling for discovery deliverables.
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

Source: sofka-sector-intelligence skill provides benchmarks
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
- **Attribution**: Expert committee of the Sofka Discovery Framework
- **Tagline**: *"Construido por profesionales, potenciado por la red agéntica de Sofka."*

## Validation Gate

| Criterion | Check |
|-----------|-------|
| Narrative arc present | Tension → Decision → Resolution visible |
| Evidence-grounded | No story without data; no data without story |
| Cross-references active | Callbacks to prior deliverables where relevant |
| Personalization present | At least one stakeholder perspective per major finding |
| Tone calibrated | Executive ≠ technical ≠ mixed |
| No orphan stories | Every narrative thread resolved by Pitch/Handover |

## Edge Cases

- **Client with no prior analysis**: Build narrative from code analysis alone. Frame as "discovery reveals what code tells us".
- **Positive AS-IS (rare)**: Still find tension — usually in scalability, opportunity cost, or competitive pressure.
- **Multiple transformation streams**: Weave parallel narratives with shared resolution point.

## Limits

- This skill owns **narrative structure and story arcs**. It does NOT own prose quality (that's sofka-copywriting) or data visualization narratives (that's sofka-data-viz-storytelling).
- Stories must always be anchored in evidence. Speculation must be explicitly tagged [SUPUESTO].
