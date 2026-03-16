---
name: metodologia-product-strategy
description: >
  Product roadmap prioritization, backlog strategy, value stream mapping, product-market fit validation.
  Use when the user asks to "define product roadmap", "prioritize backlog", "map value streams",
  "validate product-market fit", or mentions product vision, RICE scoring, opportunity trees, dual-track agile.
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Product Strategy: Roadmap, Prioritization & Value Stream Design

Product strategy translates business objectives into actionable product plans. The skill produces product vision documents, prioritization matrices, and value hypothesis canvases that align development effort with measurable customer and business outcomes.

## TL;DR

- Define producto vision y estrategia de roadmap alineada con objetivos de negocio
- Prioriza backlog con frameworks cuantitativos (RICE, WSJF, Opportunity Scoring)
- Mapea value streams para identificar desperdicio y oportunidades de optimizacion
- Valida product-market fit con hypothesis canvas y metricas de traccion
- Estructura dual-track agile: discovery continuo + delivery disciplinado

## Inputs

The user provides a product or initiative name as `$ARGUMENTS`. Parse `$1` as the **product/initiative name**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{ETAPA}`: `inception` | `growth` | `maturity` | `auto` (default — detected from context)

## Entregables

1. **Documento de vision de producto** — North star, target personas, value proposition, success metrics
2. **Matriz de priorizacion** — RICE/WSJF scored backlog with effort-impact quadrants
3. **Value hypothesis canvas** — Assumptions, experiments, validation criteria per feature area
4. **Mapa de value stream** — End-to-end flow from idea to customer value with waste identification
5. **Roadmap estrategico** — Now/Next/Later roadmap with outcome-based milestones

## Proceso

1. **Establecer vision y north star** — Define product vision statement, north star metric, and strategic guardrails
2. **Identificar personas y jobs-to-be-done** — Map target user segments and their core jobs, pains, and gains
3. **Construir opportunity tree** — Decompose desired outcomes into opportunities, then into solution ideas
4. **Priorizar con framework cuantitativo** — Score each opportunity using RICE (Reach, Impact, Confidence, Effort) or WSJF
5. **Mapear value stream actual** — Document current flow from idea to production, measure lead times and wait times
6. **Identificar desperdicio** — Flag handoffs, wait states, rework loops, and gold plating in the value stream
7. **Disenar roadmap por outcomes** — Structure roadmap around outcomes (not features) with Now/Next/Later horizons
8. **Definir hipotesis de valor** — For each major bet, document assumption, experiment, success criteria, and pivot trigger
9. **Establecer metricas de traccion** — Define leading and lagging indicators for product-market fit validation

## Criterios de Calidad

- [ ] Vision statement is specific, measurable, and time-bound
- [ ] Prioritization uses quantitative framework with documented scores
- [ ] Value stream map includes cycle time and wait time measurements
- [ ] Roadmap is outcome-based, not feature-based
- [ ] Each major initiative has explicit value hypothesis with validation plan
- [ ] Personas are based on research or documented assumptions [SUPUESTO]
- [ ] Roadmap distinguishes committed vs. speculative items
- [ ] Product metrics include both leading and lagging indicators

## Supuestos y Limites

- Assumes product team exists or will be formed with clear ownership
- Does not replace user research — flags where primary research is needed
- Financial projections are directional estimates, not forecasts
- Market analysis relies on available data and documented assumptions

## Cross-References

- **metodologia-business-analysis:** Business requirements that feed product backlog
- **metodologia-software-architecture:** Technical feasibility constraints on product decisions
- **metodologia-change-management:** Organizational readiness for product changes

---
**Autor:** Javier Montaño · Comunidad MetodologIA | **Version:** 1.0.0
