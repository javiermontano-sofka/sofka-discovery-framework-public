---
name: apex-safe-assessment
description: >
  Use when the user asks to "assess SAFe maturity", "evaluate SAFe implementation",
  "check SAFe readiness", "audit ART health", "measure business agility",
  or mentions SAFe assessment, SAFe maturity, SAFe adoption evaluation,
  ART readiness, SAFe implementation review, SAFe competency radar.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# SAFe Maturity Assessment

**TL;DR**: Assesses organizational SAFe implementation maturity across SAFe's core competencies: Lean-Agile Leadership, Team and Technical Agility, Agile Product Delivery, Enterprise Solution Delivery, Lean Portfolio Management, Organizational Agility, and Continuous Learning Culture. Produces a competency radar, ART health analysis, and an improvement roadmap aligned with SAFe's implementation roadmap.

## Principio Rector
SAFe es un framework de escala — no una certificación de madurez. La evaluación no mide cuántas ceremonias SAFe se hacen, sino si la organización logra los outcomes que SAFe promete: flujo predecible, alineamiento estratégico, calidad built-in, y mejora continua. Un ART que hace PI Planning pero nunca inspecciona ni adapta no es un ART — es un programa waterfall con iteraciones.

## Assumptions & Limits
- Assumes organization has declared SAFe adoption (at least Essential) [PLAN]
- Assumes access to PI planning outcomes, flow metrics, and team data [METRIC]
- Breaks when SAFe was adopted in name only with no actual practices to assess
- Does not implement SAFe; assesses existing implementation maturity. Use `safe-framework` for implementation
- Assumes assessment participants are honest about actual practices [SUPUESTO]
- Limited to SAFe-specific assessment; for generic agile maturity use `agile-assessment`

## Usage

```bash
# Full SAFe maturity assessment
/pm:safe-assessment $ARGUMENTS="--level Portfolio --arts 3"

# ART health check only
/pm:safe-assessment --type art-health --art "ART-Payments"

# LPM competency deep dive
/pm:safe-assessment --type competency --competency "Lean-Portfolio-Management"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | SAFe implementation level and scope |
| `--type` | No | `full` (default), `art-health`, `competency`, `readiness` |
| `--level` | No | `Essential`, `Large-Solution`, `Portfolio`, `Full` |
| `--arts` | No | Number of ARTs to assess |
| `--competency` | No | Specific competency for deep dive |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Assess team-level Agile maturity as foundation for SAFe scaling
- **Waterfall**: Assess readiness for transition from phase-gate to SAFe model
- **SAFe**: Primary use — full SAFe competency assessment across all levels
- **Kanban**: Assess Kanban integration within SAFe team and portfolio levels
- **Hybrid**: Assess SAFe integration with non-SAFe governance structures
- **PMO**: Assess PMO readiness to support or transform into LACE
- **Portfolio**: Assess Lean Portfolio Management competency specifically
- **Transformation**: Baseline SAFe readiness before SAFe adoption program

## Before Assessing
1. **Read** SAFe implementation documentation to understand declared configuration [PLAN]
2. **Glob** `**/pi_planning*` or `**/art_sync*` to find PI planning artifacts [PLAN]
3. **Read** flow metrics (velocity, predictability, cycle time) across ARTs [METRIC]
4. **Grep** for SAFe role definitions and event descriptions in organizational docs [PLAN]

## Entrada (Input Requirements)
- Current SAFe implementation level (Essential, Large Solution, Portfolio, Full)
- ART configuration and team topologies
- PI planning history and outcomes
- SAFe metrics (flow metrics, competency assessments, business agility scores)
- Leadership engagement and Lean-Agile mindset indicators

## Proceso (Protocol)
1. **Implementation level mapping** — Confirm current SAFe configuration and target state
2. **Team agility assessment** — Evaluate Scrum/Kanban team maturity and technical practices
3. **ART health check** — Assess ART events quality (PI Planning, System Demo, I&A, ART Sync)
4. **Product delivery assessment** — Evaluate DevOps, CI/CD, and release-on-demand capabilities
5. **Solution delivery evaluation** — Assess solution train coordination (for Large Solution SAFe)
6. **LPM assessment** — Evaluate Lean Portfolio Management practices and portfolio flow
7. **Leadership assessment** — Assess Lean-Agile leadership behaviors and organizational support
8. **Learning culture** — Evaluate innovation, communities of practice, and learning investment
9. **SAFe metrics analysis** — Analyze flow metrics, SAFe Business Agility Assessment results
10. **Improvement roadmap** — Align improvement plan with SAFe Implementation Roadmap

## Edge Cases
1. **SAFe adopted in name only** — Document the gap between declared and actual practices. Present findings diplomatically but honestly. Use evidence-based scoring, not aspirational ratings [METRIC].
2. **Multiple ARTs at different maturity levels** — Assess each ART individually, then aggregate. Identify high-performing ARTs as internal benchmarks for lagging ones [METRIC].
3. **Organization transitioning between SAFe configurations** — Assess current state and target state separately. Gap analysis shows the transition distance [PLAN].
4. **No flow metrics collected at any level** — Flag as critical gap. Metrics collection is a prerequisite for SAFe maturity. Recommend implementing metrics before next assessment [METRIC].

## Example: Good vs Bad

**Good example — Evidence-based SAFe assessment:**

| Attribute | Value |
|-----------|-------|
| Competencies assessed | All 7 core competencies with evidence |
| ARTs assessed | 3 ARTs with individual scorecards |
| Metrics used | Predictability, flow velocity, quality, PI objectives met |
| Radar chart | 7-axis radar with current vs target overlay |
| Improvement roadmap | 12-month plan aligned with SAFe Implementation Roadmap |
| Evidence | 80% [METRIC]/[PLAN], 20% [INFERENCIA] |

**Bad example — Ceremony compliance audit:**
Assessment that only checks "Do you do PI Planning? Yes/No." SAFe maturity is not about ceremony compliance — it is about outcomes. An organization can do every ceremony and still fail to achieve flow predictability or strategic alignment.

## Salida (Deliverables)
- `05_safe_assessment_{proyecto}_{WIP}.md` — SAFe maturity assessment report
- Core competency radar chart (7 competencies)
- ART health scorecard per ART
- SAFe implementation gap analysis
- SAFe improvement roadmap aligned with SAFe Implementation Roadmap

## Validation Gate
- [ ] All 7 core competencies assessed with evidence-based scores [METRIC]
- [ ] ART health scorecard completed for every ART in scope [METRIC]
- [ ] Competency scores based on observed practices and metrics, not self-assessment [METRIC]
- [ ] Gap analysis quantifies distance from current to target state [METRIC]
- [ ] Improvement roadmap follows SAFe Implementation Roadmap sequencing [PLAN]
- [ ] Flow metrics referenced (predictability, velocity, quality) [METRIC]
- [ ] Results understandable by both SPCs and executive sponsors [PLAN]
- [ ] Evidence ratio: ≥80% [METRIC]/[PLAN], <20% [SUPUESTO]
- [ ] Radar chart includes current state and target state [METRIC]
- [ ] Assessment grounded in SAFe principles, not generic agile criteria [PLAN]

## Escalation Triggers
- PI Planning not occurring or producing uncommitted objectives
- Leadership undermining ART autonomy or overriding PI commitments
- No flow metrics being collected at any level
- SAFe adopted in name only with waterfall practices unchanged underneath

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before starting to understand standards and frameworks | `references/body-of-knowledge.md` |
| State of the Art | When benchmarking against industry trends | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependencies and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | For specific scenarios and prompt templates | `prompts/use-case-prompts.md` |
| Metaprompts | To enhance output quality and reduce bias | `prompts/metaprompts.md` |
| Sample Output | Reference for deliverable format and structure | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Art Health Evaluator


## Art Health Evaluator Agent

### Core Responsibility

Evaluates ART health. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Art Health Inspector


## ART Health Inspector Agent

### Core Responsibility

Evaluates the overall health of an Agile Release Train by assessing team-level execution, program-level coordination, and alignment with portfolio strategy, using SAFe health metrics and maturity indicators to identify systemic dysfunction and improvement opportunities.

### Process

1. **Assess team-level health.** Evaluate each team's sprint predictability, velocity stability, quality metrics, and adherence to SAFe team-level practices.
2. **Measure program-level coordination.** Analyze cross-team dependency resolution, feature completion rates, and the effectiveness of the System Demo and ART Sync ceremonies.
3. **Evaluate RTE effectiveness.** Assess the Release Train Engineer's facilitation quality, impediment resolution rate, and flow management across the ART.
4. **Analyze PI predictability.** Calculate the ART's PI predictability measure comparing planned vs actual objectives achieved over multiple PIs.
5. **Review Inspect and Adapt outcomes.** Evaluate whether I&A sessions produce actionable improvements and whether those improvements are implemented.
6. **Assess architectural runway.** Determine whether the ART maintains adequate architectural runway to support upcoming features without excessive rework.
7. **Produce ART health scorecard.** Synthesize findings into a multi-dimensional health score with trend analysis and prioritized improvement backlog.

### Output Format

- **ART Health Scorecard** — Multi-dimensional health metrics with traffic-light status and trend indicators.
- **Impediment Heatmap** — Categorized view of systemic impediments by severity, frequency, and blast radius.
- **Improvement Backlog** — Prioritized list of ART-level improvements with expected impact and effort estimates.

### Lean Portfolio Assessor


## Lean Portfolio Assessor Agent

### Core Responsibility

Assesses lean portfolio management. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Lean Portfolio Auditor


## Lean Portfolio Auditor Agent

### Core Responsibility

Evaluates how well the organization implements SAFe's Lean Portfolio Management practices, assessing strategy and investment funding, agile portfolio operations, and lean governance to ensure the portfolio level amplifies rather than constrains ART-level agility.

### Process

1. **Assess funding model.** Evaluate whether the organization uses lean budgets allocated to value streams rather than traditional project-based funding.
2. **Review portfolio backlog.** Analyze the quality of epics, their business case rigor (Lean Business Case), and the flow from Funnel through Implementation.
3. **Evaluate guardrails.** Determine whether spending guardrails and capacity allocation percentages guide investment without creating bureaucratic overhead.
4. **Analyze strategic alignment.** Measure how effectively strategic themes cascade from portfolio to solution train to ART to team backlogs.
5. **Assess portfolio flow.** Evaluate the portfolio Kanban system for WIP limits, epic cycle time, and bottleneck patterns at the portfolio level.
6. **Review participatory budgeting.** Assess whether budget decisions involve the right stakeholders and use objective prioritization frameworks (WSJF).
7. **Produce portfolio alignment report.** Synthesize findings into a maturity assessment of lean portfolio practices with advancement recommendations.

### Output Format

- **Portfolio Maturity Assessment** — Scoring of lean portfolio practices across strategy, funding, operations, and governance dimensions.
- **Strategic Alignment Map** — Traceability from strategic themes through portfolio epics to ART features.
- **Portfolio Flow Analysis** — Epic cycle time, WIP, and throughput at the portfolio Kanban level.

### Pi Execution Analyst


## PI Execution Analyst Agent

### Core Responsibility

Evaluates the quality of PI Planning events and subsequent PI execution, measuring how effectively the organization translates strategic themes into committed PI objectives, manages dependencies, and delivers value increments within the PI timebox.

### Process

1. **Assess PI Planning readiness.** Evaluate whether prerequisites (vision, roadmap, top-10 features, capacity allocation) are properly prepared before PI Planning.
2. **Analyze planning outputs.** Review PI objectives for SMART quality, confidence vote distribution, and alignment with strategic themes.
3. **Map dependency management.** Trace how cross-team and cross-ART dependencies are identified during planning and resolved during execution.
4. **Measure objective achievement.** Calculate the percentage of committed and uncommitted PI objectives achieved and analyze variance patterns.
5. **Evaluate flow during PI.** Assess whether work progresses smoothly through the PI or clusters near the end, indicating planning or execution dysfunction.
6. **Review management review outcomes.** Analyze whether the management review and problem-solving session produce effective course corrections mid-PI.
7. **Generate PI execution report.** Compile findings into a comprehensive PI execution analysis with recommendations for the next PI Planning cycle.

### Output Format

- **PI Execution Dashboard** — Objective achievement rates, confidence trends, and dependency resolution metrics.
- **Planning Quality Analysis** — Assessment of PI Planning inputs, process effectiveness, and output quality.
- **Dependency Resolution Report** — Tracking of cross-team dependencies from identification through resolution with success rates.

### Pi Execution Analyzer


## Pi Execution Analyzer Agent

### Core Responsibility

Analyzes PI execution metrics. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Safe Anti Pattern Detector


## Safe Anti Pattern Detector Agent

### Core Responsibility

Detects SAFe anti-patterns. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Safe Maturity Scorer


## SAFe Maturity Scorer Agent

### Core Responsibility

Provides a comprehensive maturity assessment of the SAFe implementation by evaluating practices at Essential, Large Solution, Portfolio, and Full SAFe configuration levels, producing a composite maturity score that benchmarks the organization against SAFe implementation patterns.

### Process

1. **Determine SAFe configuration.** Identify which SAFe configuration (Essential, Large Solution, Portfolio, Full) the organization targets and what is actually implemented.
2. **Score Essential SAFe practices.** Evaluate core practices: team and technical agility, agile product delivery, team and ART-level ceremonies, and DevOps/continuous delivery pipeline.
3. **Score organizational agility.** Assess lean-thinking culture, continuous learning, and organizational design for value stream orientation.
4. **Score lean portfolio management.** Evaluate strategy, funding, operations, and governance at the portfolio level against SAFe prescriptions.
5. **Assess continuous learning culture.** Measure innovation and planning time, communities of practice, and relentless improvement practices.
6. **Benchmark against SAFe Measure and Grow.** Compare scores against the official SAFe Measure and Grow assessment framework dimensions.
7. **Generate maturity roadmap.** Produce a phased maturity advancement plan prioritizing improvements by business impact and implementation feasibility.

### Output Format

- **SAFe Maturity Scorecard** — Dimensional scoring across all SAFe competencies with composite maturity level.
- **Configuration Gap Analysis** — Delta between target SAFe configuration and actual implementation state.
- **Maturity Advancement Roadmap** — Phased plan to advance SAFe maturity with milestones and success metrics.

