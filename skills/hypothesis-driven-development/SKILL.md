---
name: sofka-hypothesis-driven-development
author: Equipo PreSales Sofka
description: >
  Hypothesis-Driven Development (HDD) framework for structuring modernization proposals as
  testable hypotheses with Lean Startup cycles (Build-Measure-Learn). Transforms features into
  hypotheses with metrics, experiments, and kill/pivot/persevere thresholds. Use when formulating
  scenarios as hypotheses, designing validation experiments, applying Lean Startup to discovery,
  or when "HDD", "hypothesis", "hipótesis", "lean startup", "build-measure-learn", "experiment",
  "kill/pivot/persevere", or "validación de hipótesis" is mentioned.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Hypothesis-Driven Development: Lean Startup for Technical Discovery

Transforms modernization proposals into testable hypotheses with Build-Measure-Learn cycles.
Instead of assuming a solution works and planning its full execution, HDD proposes:
first the hypothesis, then the minimum experiment, then the evidence, then the decision.

## Guiding Principle

**We do not assume it works. We propose that it should work, define how we would know, and test it.**

Classic discovery produces a roadmap based on the "best-case scenario." HDD produces a roadmap based on
**incrementally validated hypotheses**. Each roadmap phase is an experiment. Each gate is a decision
point: kill, pivot, or persevere.

### HDD Philosophy

1. **Every feature is a hypothesis, not a certainty.** "Migrating to microservices will improve time-to-market"
   is a hypothesis. It needs metrics, thresholds, and an experiment to validate it.
2. **Fast failure is a success.** Discovering in Sprint 2 that a hypothesis is false saves months of
   execution in the wrong direction.
3. **Kill is a valid decision.** If the experiment refutes the hypothesis, killing the work stream is
   the correct decision. Escalating sunk cost fallacy is the worst decision.
4. **Metrics before code.** Define what we will measure BEFORE building. If we do not know what to measure,
   we do not know what we are testing.
5. **Build-Measure-Learn, not Build-Build-Build.** Each cycle is short (1-5 days). Build the minimum
   to measure. Measure to learn. Learn to decide.

### References

- **Eric Ries** — The Lean Startup (2011): Build-Measure-Learn loop
- **Jeff Gothelf** — Lean UX (2013): Hypothesis-driven design
- **Paulo Caroli** — Lean Inception (2018): Discovery as lean inception
- **Martin Fowler** — Evolutionary Architecture: fitness functions as architecture hypotheses
- **Barry O'Reilly** — Hypothesis-Driven Development in enterprise

## Inputs

Parse `$1` as **project/scenario name**.
Requires: approved scenario (Phase 3), feature backlog, business objectives.
Recommended: metrics baseline (current performance), stakeholder priorities.

## HDD Hypothesis Structure

```
HIPÓTESIS #{N}
══════════════
Creemos que: [acción/cambio propuesto]
Para: [audiencia/sistema afectado]
Resultará en: [outcome esperado]
Lo sabremos cuando: [métrica observable]
Con umbral de éxito: [valor cuantitativo]

Experimento:
  Tipo: [spike/PoC/MVP/A-B test/shadow deployment]
  Duración: [N sprints de 1 día]
  Recursos: [N FTEs]
  Entregable mínimo: [qué se construye]
  Medición: [cómo se mide]

Decisión:
  Kill si: [métrica < umbral_kill]
  Pivot si: [umbral_kill ≤ métrica < umbral_success]
  Persevere si: [métrica ≥ umbral_success]
```

## Delivery Structure

### S1: Business Hypothesis Canvas

Transform scenario objectives into business hypotheses:

| # | Hipótesis | Métrica | Umbral Éxito | Umbral Kill | Prioridad |
|---|-----------|---------|-------------|-------------|-----------|
| H1 | Migrar checkout a microservicio reduce time-to-deploy | Deploy frequency | ≥1/día | <1/semana | MUST |
| H2 | Event-driven architecture mejora resiliencia | MTTR | <15min | >60min | MUST |
| H3 | Nuevo design system aumenta conversión | Conversion rate | +15% | <+5% | SHOULD |

### S2: Experiment Design Matrix

For each hypothesis, design the minimum experiment:

| Hipótesis | Tipo Experimento | Duración | FTEs | Entregable Mínimo | Métrica de Salida |
|-----------|-----------------|----------|------|-------------------|-------------------|
| H1 | PoC: 1 servicio extraído | 5 sprints (5 días) | 2 | Checkout service deployable | Deploy frequency medido |
| H2 | Spike: event bus prototype | 3 sprints | 1 | Kafka consumer funcional | Message processing time |
| H3 | A/B test: nuevo vs viejo | 10 sprints | 1 | Feature flag + nuevo UI | Conversion rate A vs B |

### S3: Build-Measure-Learn Cycles

Map each hypothesis to BML cycles:

```mermaid
flowchart TD
    H1[Hipótesis H1] --> B1[BUILD\n1 microservicio\n5 días, 2 FTEs]
    B1 --> M1[MEASURE\nDeploy frequency\nMTTR, error rate]
    M1 --> L1{LEARN\n¿Deploy ≥1/día?}
    L1 -->|Sí| P1[PERSEVERE\nExtraer siguiente servicio]
    L1 -->|Parcial| PV1[PIVOT\nAjustar granularidad]
    L1 -->|No| K1[KILL\nReevaluar estrategia\nde descomposición]
```

### S4: HDD-Enhanced Roadmap

The traditional roadmap is transformed:

**Before (classic roadmap):**
```
Fase 1 → Fase 2 → Fase 3 → Fase 4 → Entrega
```

**After (HDD roadmap):**
```
H1:Experiment → H1:Measure → H1:Decision → [Kill|Pivot|Persevere]
                                              ↓
H2:Experiment → H2:Measure → H2:Decision → [Kill|Pivot|Persevere]
                                              ↓
H3:Experiment → H3:Measure → H3:Decision → [Kill|Pivot|Persevere]
```

Each hypothesis has its own cycle. MUST hypotheses go first. If a MUST fails, re-evaluate the entire scenario.

### S5: Decision Log

| Sprint | Hipótesis | Métrica Obtenida | Umbral | Decisión | Rationale |
|--------|-----------|-----------------|--------|----------|-----------|
| D5 | H1 | Deploy freq: 2/día | ≥1/día | ✅ PERSEVERE | Supera umbral |
| D8 | H2 | MTTR: 45min | <15min | 🔄 PIVOT | Necesita retry logic |
| D18 | H3 | Conversion: +3% | +15% | ❌ KILL | ROI no justifica |

### S6: Validated Hypothesis Portfolio

At the end of the process, the portfolio shows:

| Hipótesis | Status | Evidencia | Impacto Validado | Siguiente Paso |
|-----------|--------|-----------|-----------------|---------------|
| H1 | ✅ Validada | Deploy 2x/día medido | Time-to-market -60% | Escalar a 5 servicios |
| H2 | 🔄 Pivotada | MTTR mejoró a 20min | Resiliencia +70% | Agregar retry + circuit breaker |
| H3 | ❌ Matada | Conversión +3% (insuficiente) | No justifica inversión | Reasignar FTEs |

## Integration with Discovery Pipeline

| Phase | Without HDD | With HDD |
|------|---------|---------|
| **Phase 3 (Scenarios)** | "Scenario B is better" | "Scenario B has 5 testable hypotheses" |
| **Phase 3b (Think Tank)** | "It is feasible" | "Hypotheses H1-H3 are experimentable in N days" |
| **Phase 4 (Roadmap)** | "Sprint 1: migrate X, Sprint 2: migrate Y" | "Sprint 1: Experiment H1, Gate: kill/pivot/persevere" |
| **Phase 4b (Costing)** | "We estimate 50 FTE-months" | "Validating H1-H3 costs 5 FTE-months. Executing validated hypotheses costs 45 FTE-months" |

## When to Use

- Formulating scenarios as testable propositions (Phase 3)
- Designing validation experiments for the Think Tank (Phase 3b)
- Building HDD-enhanced roadmaps (Phase 4)
- When the client asks "how do we know this will work?"
- When there is significant uncertainty in the proposed solution

## When NOT to Use

- Well-understood migrations with proven patterns (lift-and-shift)
- Regulatory compliance projects with fixed scope
- Emergency/crisis responses where speed overrides learning

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| Full HDD (all features as hypotheses) | Maximum learning, minimum waste | Higher ceremony, slower initial progress | High uncertainty, new technology, large investment |
| Partial HDD (only MUST features) | Focused validation on critical items | May miss risks in SHOULD/COULD | Medium uncertainty, time pressure |
| HDD for architecture only | Validates big decisions | Features not individually validated | Architecture-driven transformation |
| No HDD (classic roadmap) | Simplest, fastest to plan | Assumes solution works | Low uncertainty, proven patterns |

## Edge Cases

| Scenario | Response |
|---|---|
| All hypotheses validated | Rare but ideal — proceed with high confidence, reduce contingency margin |
| MUST hypothesis killed | Stop roadmap. Return to Phase 3 scenarios. May need different scenario |
| Pivot cascades (pivot triggers new hypothesis) | Allow max 2 pivot chains. If still failing, kill |
| Client refuses to kill | Document sunk cost fallacy risk. Proceed with explicit disclaimer |
| No baseline metrics available | First experiment = establish baseline. Add 1-2 sprints for measurement setup |

## Validation Gate

- [ ] Every MUST feature has an HDD hypothesis
- [ ] Each hypothesis has: metric, success threshold, kill threshold
- [ ] Experiments designed with minimum viable scope
- [ ] BML cycles mapped with decision points
- [ ] Kill/Pivot/Persevere criteria are quantitative, not qualitative
- [ ] Integration with roadmap phases documented

## Output Configuration

- **Language**: Spanish (Latin American, business register — simple, clear, concise, direct)
- **Attribution**: Expert committee of the Sofka Discovery Framework
- **Tagline**: *"Construido por profesionales, potenciado por la red agéntica de Sofka."*

## Output Artifact

**Primary:** `A-03_HDD_Hypotheses_{project}.md`

### Diagrams (Mermaid)
- Flowchart TD: Build-Measure-Learn cycles per hypothesis
- Gantt: experiment timeline with decision gates

---
**© Sofka Technologies — All rights reserved**