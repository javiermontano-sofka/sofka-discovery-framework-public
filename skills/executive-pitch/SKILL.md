---
name: executive-pitch
description: >
  C-level executive pitch with financial modeling and persuasion architecture.
  Use when the user asks to "create a pitch", "build a business case", "justify the investment",
  "present to executives", "ROI analysis", "executive summary", or mentions "C-level presentation",
  "budget approval", "NPV", "IRR", "payback period", "business case", "Phase 5b".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Executive Pitch & Business Case

Generates C-level presentations with quantified problem statements, 4-pillar value propositions, 3-option comparison analysis, investment summaries with financial models (NPV, IRR, payback), and decision frameworks. Uses Problem-Agitate-Solve (PAS) persuasion architecture.

## Principio Rector

**Un pitch sin números es una opinión. Un pitch sin urgencia es un informe.** El executive pitch transforma meses de análisis técnico en una narrativa de decisión que un C-level puede aprobar en 30 minutos. Cada slide, cada dato, cada visual tiene un solo propósito: que el decisor diga "sí" con confianza.

### Filosofía de Persuasión Ejecutiva

1. **Datos > opiniones.** Cada afirmación lleva un número. Cada número lleva una fuente o supuesto explícito. Sin números no hay credibilidad.
2. **Costo de inacción > costo de acción.** El anchor no es el precio — es lo que pasa si NO se actúa. La urgencia no se declara, se demuestra con el burn rate de inacción.
3. **Opciones, no mandatos.** 3 opciones con trade-offs claros. El decisor elige — el consultor recomienda con evidencia, no con presión.

## Inputs

- `$1` — Decision-maker type: `cfo`, `cto`, `ceo`, `board` (default: `ceo`)
- `$2` — Budget range indicator: `under1m`, `1m-5m`, `over5m` (default: `1m-5m`)

Parse from `$ARGUMENTS`. Adapts emphasis based on audience.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para construcción de narrativa y modelado financiero, HITL para validación de claims y call to action.
  - **desatendido**: Cero interrupciones. Pitch completo auto-generado. Supuestos documentados.
  - **supervisado**: Autónomo con checkpoint en financial model y call to action.
  - **paso-a-paso**: Confirma problem statement, cada value pillar, financial model, y call to action.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 hero + S5 investment + S6 call to action) | `técnica` (full 7 sections, default)

## Conditional Logic by Audience

```
IF decision-maker is CFO:
  -> Lead with financial case: NPV, IRR, payback, cost avoidance
  -> Minimize technical detail; focus on financial metrics

IF decision-maker is CTO:
  -> Lead with technical modernization and risk reduction
  -> Include architecture summary; tech debt elimination path

IF decision-maker is CEO:
  -> Lead with strategic alignment and competitive advantage
  -> Market positioning, capability expansion, board-ready narrative

IF decision-maker is Board:
  -> Lead with governance, fiduciary responsibility, risk-adjusted ROI
  -> Include sensitivity analysis and worst-case scenarios

IF budget > $1M:
  -> Add sensitivity analysis: +/-20% cost, +/-10% timeline variance
  -> Include phased funding gates

IF budget > $5M:
  -> Add board-level governance section
  -> Quarterly re-calibration gates mandatory
  -> Kill criteria explicit per phase
```

## Financial Modeling

- **NPV:** Sum[(Year N benefit - Year N cost) / (1 + discount_rate)^N]. Discount rate: 10-15% for enterprise tech.
- **IRR:** Internal rate of return where NPV = 0. Target >25% for 3-year payback.
- **Payback Period:** Months until cumulative benefits = cumulative costs. Target <12 months.
- **Sensitivity Analysis:** +/-20% cost variance and +/-10% benefit variance on payback/NPV.
- **Break-Even:** What adoption rate or efficiency gain needed to break even.

Every financial input must cite its source or state its assumption explicitly.

## Persuasion Architecture (PAS)

1. **Problem:** Quantified pain metrics (current state numbers)
2. **Agitate:** Emotional impact + cost of inaction (monthly burn rate of inaction)
3. **Solve:** Proposed solution with clear benefits and ROI

**Anchoring:** Show worst-case first (inaction cost), then recommended option.
**Social proof:** Industry benchmarks, peer company results.
**Urgency:** Cost of delay quantified per month.

## 7-Section Delivery Structure

### Section 1: Executive Summary (Hero)
3-4 hero KPIs: Cost Savings, Timeline, ROI Payback, Risk Reduction. 150-word narrative: opportunity, urgency, recommendation.

### Section 2: Problem Statement & Current Pain
Business impact metrics table (current vs target vs gap vs annual impact). Pain points severity-rated (CRITICAL/HIGH/MEDIUM). Root cause analysis (technical, process, resource). Cost of inaction table (3-year projection).

### Section 3: Strategic Value — 4-Pillar Proposition
Four value cards: Cost Reduction, Revenue Acceleration, Risk Mitigation, Technical Modernization. Each with metric, mechanism, ROI timeline, Year 1 impact. Cumulative 3-year financial metrics (TCO, NPV, IRR, payback).

### Section 4: Approach Comparison (3+ Options)
Comparison matrix: Do Nothing vs Alternative vs Recommended. Dimensions: upfront cost, annual cost, 3-year TCO, payback, risk reduction, tech debt, scalability, compliance, velocity, implementation risk. Each option with pros/cons/outcome/financial impact.

### Section 5: Investment Summary
Timeline and team table. Budget breakdown card (services, infrastructure, contingency, monthly burn). Phased investment table with gates.

### Section 6: Call to Action & Decision Framework
What we ask for (approach, budget range, timeline, decision deadline). Approval checklist (CFO, CTO, business sponsor, steering). Next steps timeline (week-by-week post-approval). Cost of delay (monthly consequences).

### Section 7: Risk Assessment & Mitigation
Risk table: probability, impact, mitigation, owner. Linked to findings from prior analysis phases.

## Edge Cases

- **No CFO exists:** Lead with operational metrics (time savings, reduced risk) not NPV.
- **Budget pre-approved:** Skip financial justification; focus on execution confidence.
- **Competitor actively pitching:** Add competitive urgency section.
- **Multiple conflicting decision-makers:** Generate value cards per stakeholder concern.
- **Non-technical executive audience:** Zero jargon; business outcomes only; no architecture diagrams.
- **No prior phases completed:** Use industry benchmarks for all metrics; flag everything as estimated.
- **Tiny budget (<$200K):** Simplify to 3-section pitch (problem, solution, ask). Skip sensitivity analysis.

## Trade-off Matrix

| Decision | Option A | Option B | When to Choose A | When to Choose B |
|----------|----------|----------|------------------|------------------|
| **Length** | 3-page executive summary | 15-page full business case | Time-constrained C-level; board pre-read | CFO deep-dive; formal procurement process |
| **Projections** | Aggressive (best-case) | Conservative (worst-case) | Competitive pitch; need to win mindshare | Risk-averse board; regulated industry |
| **Tone** | Push (prescriptive "do this") | Pull (consultative options) | Single decision-maker; clear mandate | Multiple stakeholders; consensus culture |
| **Financial depth** | Summary metrics (NPV, payback) | Full model (sensitivity, Monte Carlo) | CEO/CTO audience; budget < $1M | CFO/Board audience; budget > $5M |

## Assumptions & Limits

- Financial inputs (current costs, savings projections) sourced from prior phases or stated as assumptions
- NPV/IRR calculations use stated discount rate; sensitivity analysis covers variance
- Cannot replace financial auditor review for actual investment decisions
- Persuasion architecture is ethical: no misleading data, no false urgency, no suppressed risks
- Audience-specific framing adjusts emphasis, not facts

## Output Artifact

- `06_Pitch_Ejecutivo_Deep.{md|html}` — Executive pitch narrative (7-section or variante ejecutiva)
- `06b_Business_Case_Deep.{md|html}` — Detailed financial analysis with full sensitivity model
- Format determined by `{FORMATO}` parameter; default is Markdown

## Validation Gate

- [ ] Problem statement quantified with 3+ metrics (current to target with gap %)
- [ ] Financial impact calculated (annual cost of inaction, 3-year TCO, payback period)
- [ ] Value proposition across 4 pillars with specific metrics per pillar
- [ ] 3+ options compared with financial comparison
- [ ] Recommendation clear and strongly positioned with rationale
- [ ] Investment summary shows timeline, team, budget breakdown, phased funding gates
- [ ] Financial assumptions documented and justified; sources cited
- [ ] Sensitivity analysis for budgets >$1M
- [ ] Call to action names decision maker, deadline, and consequences of delay
- [ ] PAS framework applied (problem to agitate to solve)
- [ ] Every claim has a number; every number has a source or stated assumption

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | ✅ | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

### Diagrams (Mermaid)
- Mindmap: 4 value pillars with key metrics
- Gantt chart: investment timeline by phase

---
**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026
