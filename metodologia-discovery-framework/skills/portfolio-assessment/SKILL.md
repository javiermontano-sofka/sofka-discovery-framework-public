---
name: apex-portfolio-assessment
description: >
  Use when the user asks to "assess portfolio management maturity", "evaluate portfolio governance",
  "review portfolio practices", "benchmark portfolio capability", "score portfolio management",
  or mentions portfolio assessment, portfolio maturity, portfolio management capability,
  portfolio governance evaluation. Triggers on: assesses portfolio management maturity across
  6 dimensions, evaluates strategic alignment effectiveness, reviews prioritization model
  quality, quantifies portfolio governance gaps, produces portfolio improvement roadmap.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Portfolio Management Maturity Assessment

**TL;DR**: Assesses organizational portfolio management maturity across strategic alignment, portfolio governance, resource optimization, risk aggregation, value realization, and portfolio reporting. Evaluates whether the organization selects the right projects (not just executes projects right). Produces a maturity scorecard, capability gap analysis, and a portfolio management improvement roadmap.

## Principio Rector
La gestión de portafolio no es gestión de proyectos en plural — es gestión estratégica de inversiones. La madurez de portafolio se mide por la capacidad de decir "no" a proyectos que no alinean con la estrategia, por la habilidad de reasignar recursos entre proyectos, y por la transparencia del impacto acumulado de decisiones de inversión.

## Assumptions & Limits
- Assumes portfolio governance structure exists in some form (formal or informal) [SUPUESTO]
- Assumes access to portfolio performance data and governance decision-makers [STAKEHOLDER]
- Breaks if organization has fewer than 10 concurrent projects — portfolio management adds overhead without sufficient scale [PLAN]
- Scope limited to portfolio management maturity; individual project maturity uses `maturity-assessment` [PLAN]
- Does not prescribe portfolio management tools — assesses capability regardless of tooling [PLAN]

## Usage
```bash
/pm:portfolio-assessment $ORG_NAME --dimensions=all
/pm:portfolio-assessment $ORG_NAME --dimensions=strategy,governance,prioritization --benchmark=industry
/pm:portfolio-assessment $ORG_NAME --quick --focus=strategic-alignment
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ORG_NAME` | Yes | Target organization identifier |
| `--dimensions` | No | `all` / comma-separated (default: `all`) |
| `--benchmark` | No | `industry` / `sector` / `internal` |
| `--quick` | No | Abbreviated assessment (top 3 dimensions) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Assess Lean portfolio management practices, epic-level investment decisions
- **Waterfall**: Assess traditional portfolio selection, prioritization, and governance
- **SAFe**: Assess Lean Portfolio Management (LPM) maturity and portfolio Kanban
- **Kanban**: Assess portfolio-level flow, strategic WIP limits, and portfolio Kanban board maturity
- **Hybrid**: Assess ability to manage mixed-methodology portfolio coherently
- **PMO**: Assess PMO's portfolio management service maturity
- **Portfolio**: Primary use — full portfolio management capability assessment
- **Transformation**: Baseline portfolio capability before transformation program

## Before Assessing Portfolio
1. Read portfolio governance documentation — understand current decision-making structure [PLAN]
2. Glob `*prioritization*` and `*scoring*` — identify existing selection criteria [PLAN]
3. Read portfolio performance data — project success rates, strategic alignment scores [METRIC]
4. Schedule governance board interviews — multi-perspective evidence required [STAKEHOLDER]

## Entrada (Input Requirements)
- Portfolio governance structure and decision-making process
- Project selection and prioritization criteria
- Resource allocation model across portfolio
- Portfolio reporting and dashboard configuration
- Historical portfolio performance (project success rates, strategic alignment scores)

## Proceso (Protocol)
1. **Dimension definition** — Establish portfolio assessment dimensions (strategy, governance, resources, risk, value, reporting)
2. **Strategic alignment assessment** — Evaluate how projects connect to organizational strategy
3. **Governance evaluation** — Assess portfolio decision-making bodies, frequency, and effectiveness
4. **Prioritization review** — Evaluate scoring models, ranking methods, and trade-off protocols
5. **Resource optimization** — Assess cross-project resource allocation and capacity management
6. **Risk aggregation** — Evaluate portfolio-level risk identification and interdependency analysis
7. **Value tracking** — Assess benefits realization tracking and value measurement
8. **Reporting quality** — Evaluate portfolio dashboards, KPIs, and decision-support quality
9. **Benchmark comparison** — Compare against portfolio management maturity benchmarks
10. **Improvement roadmap** — Design phased portfolio management capability improvement plan

## Edge Cases
1. **No portfolio governance body exists despite 20+ projects** — Flag as critical gap; recommend immediate establishment of minimal portfolio board before detailed assessment.
2. **Project selection based solely on executive preference** — Score prioritization at Level 1; document the risk of politically-driven selection; propose transparent scoring model pilot.
3. **Resource allocation creates systemic conflicts** — Portfolio-level resource management is the gap; recommend resource pooling or at minimum cross-project visibility.
4. **Portfolio success metrics not defined** — Establish baseline metrics as first roadmap item; cannot measure improvement without defined success criteria.

## Example: Good vs Bad

**Good Portfolio Assessment:**
| Attribute | Value |
|-----------|-------|
| Dimensions | 6 dimensions scored 1-5 with evidence per score [METRIC] |
| Strategic alignment | 72% of projects mapped to strategic objectives; 28% without linkage [METRIC] |
| Prioritization model | Weighted scoring model used but criteria not validated in 18 months [PLAN] |
| Resource optimization | Cross-project visibility exists but no rebalancing mechanism [PLAN] |
| Roadmap | 12-month plan: governance board (Q1), scoring refresh (Q2), resource pooling (Q3-Q4) [SCHEDULE] |

**Bad Portfolio Assessment:**
"We have a list of projects." — No governance assessment, no prioritization evaluation, no strategic alignment check, no resource optimization review. Portfolio management is project list management.

## Salida (Deliverables)
- `05_portfolio_assessment_{proyecto}_{WIP}.md` — Portfolio maturity report
- Portfolio capability heat map across dimensions
- Strategic alignment gap analysis
- Prioritization model effectiveness review
- Portfolio management improvement roadmap

## Validation Gate
- [ ] Maturity levels based on actual portfolio decisions and outcomes, not aspirational statements
- [ ] Assessment dimensions aligned with standard portfolio management frameworks
- [ ] All portfolio management functions assessed — no gaps in coverage
- [ ] Scoring calibrated against established maturity models (P3M3 portfolio level)
- [ ] Improvement roadmap includes governance changes and tool requirements with effort estimates
- [ ] Results understandable by portfolio board and executive sponsors
- [ ] Each finding links to specific portfolio data or decision examples
- [ ] Impact of portfolio management gaps on strategic execution quantified
- [ ] Executive sponsors see portfolio management as strategic capability investment
- [ ] Assessment respects organization's existing portfolio governance model

## Escalation Triggers
- No portfolio governance body exists despite 20+ concurrent projects
- Project selection based solely on executive preference with no scoring model
- Resource allocation creates systemic conflicts across portfolio with no resolution protocol
- Portfolio lacks visibility into aggregate risk exposure

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When applying portfolio management maturity frameworks | `references/body-of-knowledge.md` |
| State of the Art | When referencing modern portfolio governance patterns | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping portfolio assessment to pipeline phases | `references/knowledge-graph.mmd` |
| Use Case Prompts | When generating assessments for specific portfolio types | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting assessment for non-standard portfolio structures | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected portfolio assessment quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Governance Effectiveness Reviewer


## Governance Effectiveness Reviewer Agent

### Core Responsibility

Evaluates the effectiveness of portfolio governance mechanisms including the portfolio review board, decision-making processes, escalation paths, and oversight cadence to ensure governance enables rather than impedes portfolio value delivery.

### Process

1. **Map governance structure.** Document the portfolio governance framework including boards, committees, roles, authorities, and meeting cadences.
2. **Assess decision timeliness.** Measure how quickly portfolio governance bodies make decisions and whether decision latency creates project bottlenecks.
3. **Evaluate decision quality.** Review whether governance decisions are based on adequate data, consider appropriate criteria, and produce clear actionable outcomes.
4. **Analyze escalation effectiveness.** Assess whether escalation paths function properly and whether escalated issues receive timely resolution.
5. **Review oversight balance.** Determine whether governance provides adequate oversight without creating micromanagement or excessive reporting burden.
6. **Assess governance participation.** Evaluate whether the right stakeholders participate in governance forums with adequate preparation and authority.
7. **Produce governance report.** Generate an effectiveness assessment with recommendations for governance optimization.

### Output Format

- **Governance Effectiveness Dashboard** — Metrics on decision timeliness, quality, participation, and escalation resolution.
- **Decision Latency Analysis** — Measurement of governance cycle times and their impact on portfolio throughput.
- **Governance Optimization Recommendations** — Specific improvements to enhance governance effectiveness and reduce overhead.

### Portfolio Governance Evaluator


## Portfolio Governance Evaluator Agent

### Core Responsibility

Evaluates portfolio governance. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Portfolio Performance Scorer


## Portfolio Performance Scorer Agent

### Core Responsibility

Scores portfolio performance. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Prioritization Maturity Evaluator


## Prioritization Maturity Evaluator Agent

### Core Responsibility

Assesses how effectively the organization prioritizes projects and programs within its portfolio, evaluating whether prioritization decisions are based on objective criteria, strategic alignment, and resource constraints rather than politics, recency bias, or executive preferences.

### Process

1. **Document prioritization process.** Map the current process for how projects enter, are evaluated, prioritized, and selected for the active portfolio.
2. **Evaluate criteria objectivity.** Assess whether prioritization criteria are clearly defined, weighted, and consistently applied across all project proposals.
3. **Analyze decision quality.** Review historical prioritization decisions for alignment with stated criteria and strategic objectives.
4. **Detect decision biases.** Identify patterns of political influence, HiPPO (Highest Paid Person's Opinion) bias, sunk cost fallacy, or recency bias in prioritization decisions.
5. **Assess reprioritization cadence.** Evaluate how often the portfolio is reprioritized and whether the process responds effectively to changing strategic context.
6. **Benchmark practices.** Compare prioritization practices against established frameworks (scoring models, pairwise comparison, WSJF, strategic buckets).
7. **Produce maturity assessment.** Generate a prioritization maturity score with specific practice improvements to advance decision quality.

### Output Format

- **Prioritization Maturity Scorecard** — Multi-dimensional assessment of prioritization practices with maturity level.
- **Decision Bias Analysis** — Identified patterns of bias in historical prioritization decisions with evidence.
- **Practice Improvement Plan** — Recommended prioritization framework upgrades with implementation guidance.

### Resource Allocation Auditor


## Resource Allocation Auditor Agent

### Core Responsibility

Audits resource allocation. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Resource Optimization Assessor


## Resource Optimization Assessor Agent

### Core Responsibility

Evaluates how effectively the organization allocates, balances, and optimizes resources across the project portfolio, identifying over-allocation, underutilization, skill mismatches, and capacity planning gaps that reduce portfolio throughput and increase delivery risk.

### Process

1. **Map resource allocation.** Document current resource allocation across all active portfolio projects including utilization rates and allocation percentages.
2. **Detect over-allocation.** Identify resources allocated above 100% capacity and projects competing for the same scarce resources.
3. **Measure utilization efficiency.** Calculate the gap between allocated capacity and productive output to identify hidden utilization losses.
4. **Assess skill alignment.** Evaluate whether resources are assigned to projects that match their skills or whether mismatches create inefficiency.
5. **Analyze capacity planning.** Evaluate the organization's ability to forecast resource demand and proactively manage capacity gaps.
6. **Identify optimization opportunities.** Find resource rebalancing, cross-training, and staggering strategies that could increase portfolio throughput.
7. **Produce optimization report.** Generate a resource optimization assessment with specific rebalancing recommendations and expected throughput improvements.

### Output Format

- **Resource Utilization Heatmap** — Visual representation of allocation levels across resources and projects.
- **Capacity Gap Analysis** — Forecast of resource supply vs demand with critical gap identification.
- **Optimization Action Plan** — Specific resource rebalancing and capacity management recommendations.

### Strategic Alignment Auditor


## Strategic Alignment Auditor Agent

### Core Responsibility

Evaluates how well the project portfolio aligns with the organization's strategic objectives, assessing whether investment distribution reflects strategic priorities, whether projects contribute to stated goals, and whether portfolio composition evolves as strategy shifts.

### Process

1. **Map strategic objectives.** Document the organization's strategic objectives, themes, and priorities with their relative weighting and timeline.
2. **Trace project-strategy links.** For each active project, assess the strength and directness of its contribution to one or more strategic objectives.
3. **Analyze investment distribution.** Calculate the percentage of portfolio investment allocated to each strategic objective and compare against stated priorities.
4. **Detect orphan projects.** Identify projects that lack clear strategic alignment or whose original strategic rationale has become obsolete.
5. **Assess strategic responsiveness.** Evaluate how quickly the portfolio composition adjusts when strategic priorities shift.
6. **Evaluate strategic balance.** Assess whether the portfolio maintains appropriate balance across innovation, growth, efficiency, and risk mitigation investments.
7. **Produce alignment report.** Generate a strategic alignment assessment with investment rebalancing recommendations and orphan project disposition.

### Output Format

- **Strategic Alignment Map** — Visual traceability from strategic objectives to portfolio projects with contribution strength.
- **Investment Distribution Analysis** — Actual vs desired investment allocation across strategic themes.
- **Alignment Improvement Plan** — Recommendations for rebalancing the portfolio to improve strategic alignment.

### Strategic Coverage Analyzer


## Strategic Coverage Analyzer Agent

### Core Responsibility

Analyzes strategic coverage. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

