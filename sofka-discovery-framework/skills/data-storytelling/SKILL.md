---
name: sofka-data-storytelling
author: Equipo PreSales Sofka
description: >
  Transforms metrics and findings into meaningful narratives — insight extraction,
  metrics-to-meaning conversion, comparison framing, and magnitude communication.
  Use when presenting scoring matrices, coverage metrics, performance data, cost
  estimates, or any quantitative finding that needs interpretation and context.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
---

# Data Storytelling — Metrics to Meaning

Transforms raw metrics, scores, and quantitative findings into meaningful narratives that drive understanding and action. Owns insight extraction, comparison framing, magnitude communication, and the bridge between numbers and decisions.

## Guiding Principle

**A number without context is noise. A number with context, comparison, and consequence is an insight.** 92% test coverage means nothing until we know that the uncovered 8% concentrates the payment modules — exactly where risk is highest. Data sofka-storytelling turns metrics into comprehension.

### Narrative Data Philosophy

1. **Context before number.** Not "coverage is 92%". Yes: "the team invested in quality (92% coverage), but the uncovered 8% concentrates the critical payment modules".
2. **Always compare.** Every metric needs a reference: vs. baseline, vs. industry, vs. target, vs. prior quarter.
3. **Explicit consequence.** So what? → "This means that..." → "Which implies that..." → "Therefore, we recommend..."
4. **Tangible magnitude.** FTE-months → "equivalent to a team of 5 people for 8 months". Abstract → concrete.

## Inputs

- `$1` — Data context: `metrics`, `scoring`, `financial`, `performance`, `coverage` (default: `metrics`)
- `$2` — Audience: `executive`, `technical`, `mixed` (default: `mixed`)

Parse from `$ARGUMENTS`.

## Core Patterns

### Pattern 1: Metrics-to-Meaning

```
Raw metric → Context → Comparison → Insight → Implication → Action

Example:
  Raw: "Deployment frequency: 1/month"
  Context: "El equipo despliega una vez al mes"
  Comparison: "vs. benchmark DORA de equipos elite: múltiples por día"
  Insight: "La brecha de 30x indica proceso manual o miedo al cambio"
  Implication: "Cada feature espera en promedio 15 días de cola antes de llegar a producción"
  Action: "Pipeline CI/CD automatizado puede cerrar la brecha a 1/semana en 3 sprints"
```

### Pattern 2: Insight Extraction

```
Data point → Pattern → Anomaly → Significance → Recommendation

Steps:
1. Observe the data point: "8 de 12 módulos tienen cobertura >90%"
2. Detect the pattern: "Los módulos con alta cobertura comparten equipo senior"
3. Identify the anomaly: "Los 4 módulos sin cobertura son todos del equipo junior"
4. Interpret the significance: "No es un problema de herramientas, es de capacitación"
5. Recommend: "Pair programming cross-team + coverage gates en CI"
```

### Pattern 3: Comparison Framing

| Frame Type | When | Example |
|-----------|------|---------|
| **Before/After** | Projected improvement | "De 12 semanas a 4 semanas de time-to-market" |
| **Peer Benchmark** | Industry comparison | "vs. mediana del sector: 3 deploys/semana" |
| **Industry Standard** | Reference frameworks | "DORA elite: <1 hora lead time" |
| **Internal Baseline** | Historical comparison | "vs. Q1: incidentes reducidos 40%" |
| **Target Gap** | Distance to objective | "A 15 puntos del objetivo de disponibilidad 99.9%" |
| **Cost Equivalence** | Making FTE tangible | "Equivalente a 3 desarrolladores senior durante 6 meses" |

### Pattern 4: Magnitude Communication

```
Abstract → Concrete → Impactful

"40 FTE-meses"
  → "Equivalente a un equipo de 8 personas durante 5 meses"
  → "Es decir, todo el equipo backend dedicado exclusivamente
     desde enero hasta mayo, sin poder hacer nada más"

"99.5% disponibilidad"
  → "43 horas de downtime al año"
  → "Equivalente a casi 2 días completos sin servicio,
     probablemente concentrados en momentos de alta demanda"

"$2M de deuda técnica" → NEVER. Use FTE-month equivalents.
```

## Scoring Matrix Narratives

When presenting scoring tables:

```
1. Lead with the pattern, not individual scores:
   "De las 6 dimensiones evaluadas, 2 están en rojo y comparten causa raíz:
    acoplamiento entre el módulo de autenticación y el core de negocio."

2. Highlight the anomalies:
   "La dimensión de seguridad sorprende en verde dado que el equipo
    no tiene un rol dedicado — evidencia de buenas prácticas orgánicas."

3. Connect to action:
   "Los 2 rojos se resuelven con el escenario B en Fase 1 (Q2);
    los 3 amarillos mejoran orgánicamente con la nueva arquitectura."
```

## Dashboard Narrative Sequences

For multi-chart sofka-storytelling (presentations, executive summaries):

```
Chart 1: The headline
  "Aquí estamos" — current state summary metric

Chart 2: The context
  "Así llegamos aquí" — trend or historical view

Chart 3: The comparison
  "Así estamos vs. donde deberíamos estar" — benchmark gap

Chart 4: The path
  "Así cerramos la brecha" — roadmap or scenario projection

Each chart builds on the previous. No standalone charts.
```

## Semantic Density Rules

| Type | Guideline |
|------|-----------|
| Table footnotes | Explain methodology, not data (data goes in cells) |
| Semaphore criteria | Define thresholds: >80%, 50-80%, <50% |
| Cross-references | "→ See 03_AS-IS § Cobertura for methodology" |
| Source attribution | Evidence tag inline: "92% cobertura [CÓDIGO]" |

## Output Configuration

- **Language**: Spanish (Latin American, business register — simple, clear, concise, direct)
- **Attribution**: Expert committee of the Sofka Discovery Framework
- **Tagline**: *"Construido por profesionales, potenciado por la red agéntica de Sofka."*

## Validation Gate

| Criterion | Check |
|-----------|-------|
| Every metric has context | Not just the number — the story around it |
| Every metric has comparison | vs. baseline, benchmark, target, or prior period |
| Insights are actionable | "So what?" answered for every data point |
| Magnitudes are tangible | FTE-months translated to team-equivalents |
| Scoring patterns highlighted | Not just individual scores — the story across dimensions |
| No naked numbers | Zero metrics without interpretation |

## Edge Cases

- **No benchmarks available**: Use internal baseline or state explicitly: "Sin benchmark sectorial disponible; se usa línea base interna Q1 como referencia [SUPUESTO]".
- **Conflicting metrics**: Present the contradiction as a finding: "La cobertura alta (92%) contradice la tasa de incidentes (8/mes), sugiriendo tests que no cubren escenarios reales [INFERENCIA]".
- **Sparse data**: Acknowledge gaps: "Con [N] datos, la tendencia es indicativa, no concluyente".

## Limits

- This skill owns **metric interpretation and narrative framing**. It does NOT own visualization design (that's sofka-data-viz-storytelling) or overall narrative arc (that's sofka-storytelling).
- NEVER present metrics without context and comparison.
- NEVER use currency values for costs. FTE-months only.
