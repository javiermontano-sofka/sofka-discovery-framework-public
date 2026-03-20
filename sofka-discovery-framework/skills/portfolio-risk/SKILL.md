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

---

---

## Sub-Agents

### Cross Project Correlation Analyzer


## Cross Project Correlation Analyzer Agent

### Core Responsibility

Analyzes risk correlations across projects. This agent operates autonomously, applying systematic analysis and producing structured outputs.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints.
3. **Apply Framework.** Apply the appropriate analytical framework or model.
4. **Generate Findings.** Produce detailed findings with evidence tags and quantified impacts.
5. **Validate Results.** Cross-check findings against related artifacts for consistency.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners and timelines.
7. **Deliver Output.** Produce the final structured output with executive summary, analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags and severity ratings.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Cross Project Correlation Detector


## Cross-Project Correlation Detector Agent

### Core Responsibility

Identifies hidden risk correlations and dependencies between projects in the portfolio, detecting situations where risks in one project amplify or trigger risks in other projects, creating cascading failure scenarios that isolated project risk management cannot anticipate.

### Process

1. **Map inter-project dependencies.** Document all known dependencies between portfolio projects including technical, resource, timeline, and data dependencies.
2. **Identify shared risk factors.** Detect risks that affect multiple projects simultaneously such as shared vendors, common technology platforms, or regulatory changes.
3. **Analyze correlation patterns.** Use historical data and causal analysis to identify which project risks tend to co-occur or trigger each other.
4. **Model cascade scenarios.** Simulate how a risk event in one project propagates through dependencies to impact other portfolio projects.
5. **Quantify correlation impact.** Calculate the additional portfolio exposure created by risk correlations beyond the sum of individual project risks.
6. **Identify diversification gaps.** Assess whether the portfolio has adequate risk diversification or is over-concentrated in correlated risk factors.
7. **Produce correlation report.** Generate a cross-project risk correlation analysis with cascade scenarios and diversification recommendations.

### Output Format

- **Risk Correlation Matrix** — Project-by-project risk correlation strength with shared risk factor identification.
- **Cascade Scenario Analysis** — Modeled propagation paths showing how project risks cascade through the portfolio.
- **Diversification Assessment** — Evaluation of portfolio risk diversification with recommendations to reduce correlated exposure.

### Portfolio Risk Reporter


## Portfolio Risk Reporter Agent

### Core Responsibility

Synthesizes portfolio-level risk analysis into executive-ready reports that communicate aggregate risk posture, key risk trends, emerging threats, and recommended actions in a format that enables informed portfolio governance decisions by senior leadership.

### Process

1. **Summarize risk posture.** Distill the current portfolio risk position into a clear executive summary with traffic-light indicators for each risk dimension.
2. **Highlight key changes.** Identify the most significant risk changes since the last reporting period including new risks, escalated risks, and resolved risks.
3. **Present trend analysis.** Show how portfolio risk exposure has evolved over time with leading indicators of future risk trajectory.
4. **Communicate top risks.** Present the top 5-10 portfolio risks with clear impact statements, probability assessments, and response status.
5. **Quantify financial exposure.** Translate risk data into financial terms (expected monetary value, value-at-risk) that resonate with executive decision-makers.
6. **Recommend governance actions.** Propose specific decisions the portfolio governance body should make regarding risk response, resource reallocation, or project disposition.
7. **Produce executive report.** Generate a polished, concise portfolio risk report designed for 15-minute steering committee consumption.

### Output Format

- **Executive Risk Summary** — One-page portfolio risk posture with traffic-light status and key metrics.
- **Top Risks Dashboard** — Visual presentation of highest-priority risks with response status and ownership.
- **Decision Recommendations** — Specific governance decisions recommended based on the risk analysis with supporting rationale.

### Risk Aggregation Engine


## Risk Aggregation Engine Agent

### Core Responsibility

Collects and aggregates individual project risk registers into a unified portfolio-level risk view, identifying how project risks combine, compound, and create emergent portfolio-level exposures that are invisible when risks are managed in isolation.

### Process

1. **Collect project risks.** Gather risk registers from all active portfolio projects and normalize risk data to a common taxonomy and scoring scale.
2. **Categorize by risk type.** Classify aggregated risks into categories: technical, resource, market, regulatory, financial, operational, and strategic.
3. **Calculate aggregate exposure.** Compute portfolio-level risk exposure by category considering both additive and multiplicative risk interactions.
4. **Identify concentration risks.** Detect risk concentrations where multiple projects share the same risk category, threat source, or vulnerable resource.
5. **Assess risk capacity.** Compare aggregate risk exposure against the organization's stated risk appetite and risk capacity thresholds.
6. **Model portfolio scenarios.** Simulate portfolio-level impact of key risk materializations using Monte Carlo or scenario analysis techniques.
7. **Produce portfolio risk profile.** Generate a comprehensive portfolio risk dashboard with aggregate exposures, concentrations, and capacity analysis.

### Output Format

- **Portfolio Risk Heatmap** — Aggregate risk exposure by category with concentration indicators and trend data.
- **Risk Capacity Analysis** — Comparison of current portfolio risk exposure against organizational risk appetite thresholds.
- **Portfolio Risk Scenarios** — Simulated impact of key risk events on portfolio performance with probability distributions.

### Risk Aggregator


## Risk Aggregator Agent

### Core Responsibility

Aggregates project risks to portfolio level. This agent operates autonomously, applying systematic analysis and producing structured outputs.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints.
3. **Apply Framework.** Apply the appropriate analytical framework or model.
4. **Generate Findings.** Produce detailed findings with evidence tags and quantified impacts.
5. **Validate Results.** Cross-check findings against related artifacts for consistency.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners and timelines.
7. **Deliver Output.** Produce the final structured output with executive summary, analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags and severity ratings.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Systemic Risk Identifier


## Systemic Risk Identifier Agent

### Core Responsibility

Detects systemic risks that threaten not just individual projects but the entire portfolio or organizational delivery capability, including single points of failure, organizational vulnerabilities, market shifts, and structural weaknesses that could cause widespread portfolio disruption.

### Process

1. **Scan for single points of failure.** Identify resources, systems, vendors, or capabilities whose failure would impact a significant portion of the portfolio.
2. **Assess organizational vulnerabilities.** Evaluate systemic weaknesses in organizational processes, culture, or infrastructure that amplify risk across all projects.
3. **Monitor external threats.** Track market, regulatory, technological, and economic factors that could simultaneously impact multiple portfolio components.
4. **Evaluate resilience capacity.** Assess the organization's ability to absorb and recover from systemic risk events including business continuity and disaster recovery capabilities.
5. **Identify emerging risks.** Scan for weak signals and emerging trends that could become systemic threats before they materialize.
6. **Assess portfolio fragility.** Determine how much portfolio disruption a single systemic event could cause and identify fragility hotspots.
7. **Produce systemic risk report.** Generate a systemic risk assessment with early warning indicators and resilience improvement recommendations.

### Output Format

- **Systemic Risk Register** — Identified systemic risks with probability, impact scope, and early warning indicators.
- **Single Point of Failure Map** — Visualization of critical dependencies whose failure creates systemic portfolio impact.
- **Resilience Improvement Plan** — Actions to reduce systemic vulnerability and increase organizational recovery capability.

