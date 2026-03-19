---
name: apex-pmo-health-check
description: >
  Use when the user asks to "check PMO health", "run PMO health check",
  "diagnose PMO performance", "audit PMO operations", "measure PMO KPIs",
  or mentions PMO health, PMO diagnostics, PMO pulse check, PMO operational review,
  PMO internal audit. Triggers on: conducts 8-dimension PMO health check, compiles
  RAG health dashboard, identifies corrective actions for underperforming dimensions,
  tracks quarter-over-quarter trends, produces PMO operational improvement plan.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# PMO Health Check (Internal)

**TL;DR**: Phase 7 internal deliverable that conducts a structured health check across 8 PMO operational dimensions: governance effectiveness, resource utilization, methodology compliance, reporting accuracy, stakeholder satisfaction, risk management, financial oversight, and continuous improvement. Designed as an INTERNAL diagnostic — not for client delivery but for PMO self-improvement and operational excellence.

## Principio Rector
Un PMO que no se mide a sí mismo no puede medir a nadie. El health check es un ejercicio de honestidad operativa: 8 dimensiones, métricas objetivas, sin auto-complacencia. Si la dimensión de "mejora continua" lleva 3 trimestres en amarillo, eso es un patrón — no un accidente.

## Assumptions & Limits
- Assumes PMO has been operational for at least 1 quarter — health checks on new PMOs produce meaningless baselines [SUPUESTO]
- Assumes operational metrics are available from PMO systems [SUPUESTO]
- Breaks if health check is performed by PMO without external validation — self-assessment bias inflates scores [METRIC]
- Scope limited to internal PMO operations; external PMO value assessment uses `pmo-assessment` [PLAN]
- Does not assess individual PM performance — focuses on PMO-level operational effectiveness [PLAN]

## Usage
```bash
/pm:pmo-health-check $PMO_NAME --period=Q1-2026
/pm:pmo-health-check $PMO_NAME --dimensions=all --compare=previous
/pm:pmo-health-check $PMO_NAME --dimensions=governance,reporting --depth=deep
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PMO_NAME` | Yes | Target PMO identifier |
| `--period` | No | Assessment period (default: current quarter) |
| `--dimensions` | No | `all` / comma-separated dimensions (default: `all`) |
| `--compare` | No | `previous` / `baseline` for trend analysis |
| `--depth` | No | `standard` / `deep` (default: `standard`) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Check Agile coaching capacity, sprint support quality, impediment resolution speed
- **Waterfall**: Check phase-gate enforcement, baseline management, formal reporting quality
- **SAFe**: Check ART support, PI planning facilitation, Lean portfolio governance
- **Kanban**: Check flow metric reporting, WIP governance, service delivery optimization
- **Hybrid**: Check multi-methodology governance consistency and integration quality
- **PMO**: Primary use — full 8-dimension internal health check
- **Portfolio**: Check portfolio-level governance, prioritization effectiveness, strategic reporting

## Before Running Health Check
1. Read previous health check results — establish trend baseline [METRIC]
2. Glob `*kpi*` and `*metric*` — identify available operational data [METRIC]
3. Read PMO team capacity records — resource utilization dimension [METRIC]
4. Collect stakeholder satisfaction survey data — prepare before assessment [STAKEHOLDER]

## Entrada (Input Requirements)
- PMO operational metrics for assessment period
- Project portfolio performance data
- PMO team capacity and utilization records
- Stakeholder satisfaction survey results (internal)
- Previous health check results (for trend analysis)

## Proceso (Protocol)
1. **Dimension setup** — Configure 8 health check dimensions with KPIs and thresholds
2. **Governance effectiveness** — Assess gate compliance, decision quality, escalation response time
3. **Resource utilization** — Measure PMO team utilization, skill coverage, and bottlenecks
4. **Methodology compliance** — Check adherence to declared methodologies across portfolio
5. **Reporting accuracy** — Validate report data against source systems, measure timeliness
6. **Stakeholder satisfaction** — Analyze internal satisfaction scores and trending
7. **Risk management** — Assess risk identification rate, response effectiveness, materialization rate
8. **Financial oversight** — Check budget tracking accuracy, forecast reliability, cost variance
9. **Continuous improvement** — Measure improvement actions completed, lessons learned applied
10. **Health dashboard** — Compile 8-dimension health dashboard with RAG status and trends

## Edge Cases
1. **3+ dimensions in red simultaneously** — Systemic PMO crisis; escalate to PMO director for structural intervention, not individual dimension fixes.
2. **Same dimension amber for 3+ consecutive periods** — Pattern indicates structural issue; dimension-specific deep dive required; standard corrective actions insufficient.
3. **Stakeholder satisfaction below 3.0/5.0** — Root cause analysis before corrective plan; satisfaction recovery requires relationship rebuilding, not just process improvement.
4. **No previous health check for comparison** — This check becomes the baseline; focus on establishing measurement infrastructure for future trending.

## Example: Good vs Bad

**Good PMO Health Check:**
| Attribute | Value |
|-----------|-------|
| Dimensions assessed | All 8 with specific KPIs per dimension [METRIC] |
| RAG dashboard | 5 blue, 2 amber, 1 red — with trend arrows vs. prior quarter [METRIC] |
| Corrective actions | 6 actions for amber/red dimensions with owners and deadlines [SCHEDULE] |
| Trend analysis | Q-o-Q comparison showing governance improved, reporting declined [METRIC] |
| Read time | Dashboard readable by PMO director in under 5 minutes [PLAN] |

**Bad PMO Health Check:**
"The PMO is performing well overall." — No dimension breakdown, no KPIs, no RAG scoring, no trend analysis. No basis for targeted improvement or early warning detection.

## Salida (Deliverables)
- `07_pmo_health_check_{periodo}_{WIP}.md` — Internal health check report
- 8-dimension health dashboard (RAG with trend indicators)
- Dimension deep-dive per area below threshold
- Corrective action plan for dimensions in amber/red
- Quarter-over-quarter trend analysis

## Validation Gate
- [ ] Health scores derived from operational data, not self-assessment alone
- [ ] KPI calculations validated against source systems — no manual overrides
- [ ] All 8 dimensions assessed — no dimension skipped regardless of perceived health
- [ ] Scoring thresholds unchanged from prior health checks for valid trending
- [ ] Corrective actions assigned with named owners and deadlines
- [ ] Dashboard readable by PMO director in under 5 minutes
- [ ] Each RAG status traces to specific KPI data with calculation shown
- [ ] Dimensions trending negatively for 2+ periods flagged for structural intervention
- [ ] Health check drives actual operational improvement — not just documentation
- [ ] Format consistent across reporting periods for quarter-over-quarter comparison

## Escalation Triggers
- 3+ dimensions in red simultaneously
- Same dimension in amber for 3+ consecutive periods
- Stakeholder satisfaction below 3.0/5.0
- Financial oversight dimension showing systemic budget tracking failures

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When defining PMO operational KPIs | `references/body-of-knowledge.md` |
| State of the Art | When implementing modern PMO health monitoring | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping health check to PMO governance cycle | `references/knowledge-graph.mmd` |
| Use Case Prompts | When running health checks for specific PMO types | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting health check for non-standard PMO structures | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected health check dashboard quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
