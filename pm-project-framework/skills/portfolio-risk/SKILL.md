---
name: apex-portfolio-risk
description: >
  Use when the user asks to "assess portfolio risk", "aggregate project risks",
  "analyze portfolio risk exposure", "detect risk concentration", "model systemic risk",
  or mentions portfolio risk, aggregated risk, risk concentration, systemic risk,
  portfolio risk management. Triggers on: aggregates risk exposure across project portfolio,
  identifies correlated risks across projects, detects vendor/technology/resource concentration,
  models portfolio-level risk scenarios, produces portfolio risk heatmap for governance.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Portfolio Risk Aggregation

**TL;DR**: Aggregates and analyzes risk exposure across the project portfolio to identify systemic risks, risk concentration, correlated risks, and portfolio-level threats. Produces portfolio risk heatmaps and recommendations for portfolio-level risk mitigation.

## Principio Rector
El riesgo de un portfolio no es la suma de los riesgos individuales — las correlaciones y concentraciones crean riesgo sistémico invisible a nivel de proyecto. Un portfolio donde todos los proyectos dependen del mismo proveedor tiene un riesgo de concentración que ningún proyecto individual ve. El análisis de riesgo a nivel portfolio revela estos patrones.

## Assumptions & Limits
- Assumes individual project risk registers exist and are current [SUPUESTO]
- Assumes risk rating scales are normalized across projects (or can be normalized) [SUPUESTO]
- Breaks if project risk registers use incompatible scales — normalization must precede aggregation [METRIC]
- Scope limited to portfolio-level risk analysis; project-level risk management uses `risk-register` [PLAN]
- Does not replace project-level risk management — complements it with cross-project visibility [PLAN]

## Usage
```bash
/pm:portfolio-risk $PORTFOLIO_NAME --analysis=full
/pm:portfolio-risk $PORTFOLIO_NAME --analysis=concentration --dimension=vendor
/pm:portfolio-risk $PORTFOLIO_NAME --analysis=correlation --scenario=vendor-failure
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PORTFOLIO_NAME` | Yes | Target portfolio identifier |
| `--analysis` | No | `full` / `concentration` / `correlation` / `scenario` |
| `--dimension` | No | `vendor` / `technology` / `resource` / `geography` / `all` |
| `--scenario` | No | Specific risk scenario to model |

## Service Type Routing
`{TIPO_PROYECTO}`: Portfolio uses full portfolio risk analysis; PMO uses aggregate risk reporting; Multi-Program assesses correlated program risks; All portfolio governance uses risk aggregation.

## Before Analyzing Portfolio Risk
1. Glob `*risk-register*` across all portfolio projects — collect individual risk data [PLAN]
2. Read shared resource and vendor information — identify concentration sources [PLAN]
3. Read portfolio composition — understand project interdependencies [PLAN]
4. Review portfolio risk appetite thresholds — calibrate severity against organizational tolerance [STAKEHOLDER]

## Entrada (Input Requirements)
- Individual project risk registers
- Portfolio composition and dependencies
- Shared resource and vendor information
- Market and industry risk factors
- Portfolio risk appetite thresholds

## Proceso (Protocol)
1. **Risk aggregation** — Collect and normalize risks from all portfolio projects
2. **Correlation analysis** — Identify correlated risks across projects
3. **Concentration analysis** — Detect risk concentration (vendor, technology, resource, geography)
4. **Systemic risk identification** — Find risks that could impact multiple projects simultaneously
5. **Portfolio risk scoring** — Rate aggregate risk exposure by category
6. **Heatmap generation** — Create portfolio risk heatmap (project x risk category)
7. **Scenario analysis** — Model portfolio-level risk scenarios
8. **Mitigation recommendations** — Design portfolio-level risk responses
9. **Diversification assessment** — Evaluate portfolio diversification as risk mitigation
10. **Report generation** — Produce portfolio risk report for governance

## Edge Cases
1. **Single vendor concentration across 30%+ of projects** — Critical concentration risk; recommend vendor diversification strategy or formal contingency plan for vendor failure.
2. **Correlated risk could impact 50%+ of portfolio** — Systemic risk event; model the scenario explicitly with financial impact; present to steering committee as priority governance item.
3. **Project risk registers use different rating scales** — Normalize to common 5x5 scale before aggregation; document normalization assumptions.
4. **No portfolio-level risk mitigation exists** — First-time aggregation; focus on establishing visibility and governance mechanism before designing mitigation strategies.

## Example: Good vs Bad

**Good Portfolio Risk Aggregation:**
| Attribute | Value |
|-----------|-------|
| Risks aggregated | 187 risks from 15 projects normalized to common scale [METRIC] |
| Correlations | 12 correlated risk clusters identified across 3+ projects [METRIC] |
| Concentration | AWS dependency in 8 of 15 projects (53%) — concentration risk flagged [METRIC] |
| Scenario | "AWS region outage" modeled: 8 projects impacted, estimated portfolio delay 3 weeks [SCHEDULE] |
| Heatmap | 15 projects x 6 risk categories with portfolio-level RAG [METRIC] |

**Bad Portfolio Risk Aggregation:**
A list of all 187 risks from all projects in a single spreadsheet with no aggregation, no correlation analysis, no concentration detection. Decision-makers cannot identify portfolio-level patterns.

## Salida (Deliverables)
- Portfolio risk heatmap
- Risk concentration analysis
- Correlated risk register
- Portfolio risk scenario analysis
- Portfolio-level mitigation recommendations

## Validation Gate
- [ ] Risk data from verified project registers — not estimated at portfolio level
- [ ] Correlations identified from actual shared dependencies, not assumed
- [ ] All portfolio projects included in aggregation — no omissions
- [ ] Risk ratings normalized across projects using consistent scale
- [ ] Portfolio-level mitigations implementable with named owners
- [ ] Heatmap reveals patterns at a glance — readable by governance board
- [ ] Every portfolio risk traces to originating project risks
- [ ] Systemic risks prominently flagged with impact quantification
- [ ] Governance board sees true risk posture, not sanitized version
- [ ] Analysis cadence fits portfolio governance meeting schedule

## Escalation Triggers
- Portfolio risk exposure exceeds organizational threshold
- Single-vendor concentration risk across > 30% of projects
- Correlated risk could impact > 50% of portfolio simultaneously
- No portfolio-level risk mitigation in place

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When applying portfolio risk management frameworks | `references/body-of-knowledge.md` |
| State of the Art | When implementing modern portfolio risk analytics | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping portfolio risk to governance pipeline | `references/knowledge-graph.mmd` |
| Use Case Prompts | When generating risk analysis for specific portfolio types | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting risk aggregation for non-standard portfolios | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected risk report quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
