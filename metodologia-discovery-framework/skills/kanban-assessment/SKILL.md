---
name: apex-kanban-assessment
description: >
  Use when the user asks to "assess Kanban maturity", "evaluate Kanban practices",
  "check flow efficiency", "measure WIP discipline", "diagnose Kanban health",
  or mentions Kanban assessment, Kanban maturity, flow metrics evaluation, WIP limit
  assessment, Kanban readiness. Triggers on: scores Kanban maturity against KMM levels,
  evaluates flow health metrics, assesses WIP limit enforcement, detects Kanban anti-patterns,
  produces evolutionary improvement roadmap.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Kanban Maturity Assessment

**TL;DR**: Assesses organizational Kanban maturity across the Kanban Maturity Model (KMM) dimensions: workflow visualization, WIP management, flow measurement, explicit policies, feedback loops, and evolutionary improvement. Produces a maturity level determination (ML0-ML6), flow health analysis, and an improvement roadmap grounded in Kanban's evolutionary change principles.

## Principio Rector
Kanban no se implementa — se evoluciona. La evaluación de madurez Kanban respeta este principio: no busca comparar contra un estado final ideal, sino determinar en qué nivel de madurez se encuentra la organización y cuál es el siguiente paso evolutivo viable. Forzar saltos de madurez produce fragilidad, no agilidad.

## Assumptions & Limits
- Assumes teams have at least a visible board (physical or digital) — cannot assess ML0 teams without observation [SUPUESTO]
- Assumes access to flow metrics data if available — assessment quality correlates with data availability [SUPUESTO]
- Breaks if organization conflates Kanban with "task board" — need to distinguish Kanban Method from simple visualization [PLAN]
- Scope limited to Kanban Method maturity; general agile maturity uses `agile-assessment` [PLAN]
- Does not prescribe tools — assesses practices regardless of whether board is physical, Jira, or Azure DevOps [PLAN]

## Usage
```bash
/pm:kanban-assessment $PROJECT_NAME --model=kmm --teams=all
/pm:kanban-assessment $PROJECT_NAME --dimensions=wip,flow,cadences --benchmark=industry
/pm:kanban-assessment $PROJECT_NAME --quick --focus=flow-health
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project or organization identifier |
| `--model` | No | `kmm` / `custom` (default: `kmm`) |
| `--dimensions` | No | Comma-separated KMM dimensions or `all` |
| `--teams` | No | `all` / specific team names |
| `--benchmark` | No | `industry` / `internal` |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Assess Kanban integration with Scrum (Scrumban) or standalone Kanban for Agile teams
- **Waterfall**: Assess readiness to introduce Kanban for workflow visibility within phase-gate projects
- **SAFe**: Assess Team Kanban and Portfolio Kanban maturity within SAFe context
- **Kanban**: Primary use — full KMM-based maturity assessment
- **Hybrid**: Assess Kanban layer within hybrid methodology governance
- **PMO**: Assess organizational Kanban capability across project portfolio
- **Transformation**: Baseline Kanban maturity before organizational change initiative

## Before Assessing Kanban
1. Read current board configurations — photograph or screenshot physical and digital boards [PLAN]
2. Glob `*flow*`, `*lead-time*`, `*throughput*` — identify available flow metrics data [METRIC]
3. Read team policies — determine what is explicit vs. implicit in current workflow [PLAN]
4. Review KMM framework reference — calibrate scoring rubric before assessment [PLAN]

## Entrada (Input Requirements)
- Current board configurations (physical and digital)
- WIP limits (if defined) and adherence data
- Flow metrics history (lead time, cycle time, throughput)
- Team policies (explicit and implicit)
- Feedback loop cadences and effectiveness

## Proceso (Protocol)
1. **KMM dimension mapping** — Establish assessment against Kanban Maturity Model levels
2. **Board analysis** — Evaluate visualization practices (columns, swimlanes, card types, blockers)
3. **WIP management assessment** — Measure WIP limit definition, enforcement, and adaptation
4. **Flow metrics evaluation** — Assess measurement maturity (what is measured, frequency, usage)
5. **Policy explicitness** — Evaluate whether workflow policies are explicit, visible, and followed
6. **Feedback loop assessment** — Rate cadences (standup, replenishment, delivery planning, review, ops review, risk review, strategy review)
7. **Improvement practices** — Assess use of data-driven improvement and experimentation
8. **Service class evaluation** — Check whether service classes are defined and applied
9. **Maturity level determination** — Assign overall KMM level (ML0-ML6) with evidence
10. **Evolutionary roadmap** — Design next-step improvements respecting evolutionary change

## Edge Cases
1. **No visualization of work exists (ML0)** — Start with observation-based assessment; recommend basic board implementation as first step; do not attempt full KMM assessment.
2. **WIP limits defined but systematically overridden** — Score WIP management at ML1 regardless of defined limits; focus roadmap on enforcement mechanisms and cultural understanding.
3. **Team uses Kanban board but no Kanban Method practices** — Distinguish between visualization tool and methodology; score Method practices separately from tool usage.
4. **Multiple teams at vastly different maturity levels** — Produce per-team scorecards; avoid averaging that hides extremes; roadmap respects each team's evolutionary pace.

## Example: Good vs Bad

**Good Kanban Assessment:**
| Attribute | Value |
|-----------|-------|
| KMM level | ML3 overall with dimension breakdown (visualization ML4, WIP ML3, flow ML2) [METRIC] |
| Flow health | Lead time P85 = 12 days; throughput 8 items/week; CFD stable [METRIC] |
| Cadences assessed | All 7 Kanban cadences rated for frequency and effectiveness [METRIC] |
| Evidence | Board screenshots, 3 months flow data, policy documents [PLAN] |
| Roadmap | Next evolutionary step: implement service classes and flow analytics [SCHEDULE] |

**Bad Kanban Assessment:**
"The team uses a Kanban board and it seems to work." — No KMM level, no flow metrics, no cadence assessment, no dimension scoring. No basis for targeted improvement.

## Salida (Deliverables)
- `05_kanban_assessment_{proyecto}_{WIP}.md` — Kanban maturity report
- KMM maturity level scorecard with dimension breakdown
- Flow health dashboard (lead time distribution, throughput trends, WIP aging)
- Policy gap analysis
- Evolutionary improvement roadmap

## Validation Gate
- [ ] Maturity levels based on observed board state and metrics, not interviews alone
- [ ] KMM levels correctly applied per published Kanban Maturity Model definitions
- [ ] All seven Kanban cadences assessed for frequency and effectiveness
- [ ] Scoring calibrated across teams using consistent rubric
- [ ] Next evolutionary step achievable without organizational trauma
- [ ] Every maturity level assignment backed by specific photographic or data evidence
- [ ] Risks of skipping maturity levels explicitly identified
- [ ] Flow health metrics (lead time, throughput, WIP) quantified where data exists
- [ ] Assessment grounded in Kanban Method principles, not Scrum retrofits
- [ ] Management sees evolutionary path with realistic timeline (no "implement Kanban in 2 weeks")

## Escalation Triggers
- No visualization of work exists (ML0 across all dimensions)
- WIP limits defined but systematically overridden
- No flow metrics being collected despite 6+ months of Kanban use
- Leadership demanding Kanban "implementation" deadline (contradicts evolutionary approach)

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

### Continuous Improvement Assessor


## Continuous Improvement Assessor Agent

### Core Responsibility

Evaluates how effectively the organization uses Kanban feedback loops, experiments, and retrospective mechanisms to drive continuous improvement, measuring whether the system evolves based on data and whether improvement actions produce measurable results.

### Process

1. **Audit feedback loops.** Verify that all seven Kanban cadences (standup, replenishment, delivery planning, service delivery review, operations review, risk review, strategy review) are in place and functioning.
2. **Review improvement backlog.** Examine the backlog of improvement experiments and actions for volume, staleness, and completion rate.
3. **Measure experiment velocity.** Calculate how many process experiments are initiated, completed, and adopted per quarter.
4. **Assess data-driven culture.** Evaluate whether improvement decisions are based on flow metrics and evidence or on opinion and intuition.
5. **Track improvement impact.** Measure whether completed improvement actions produced measurable changes in flow metrics or customer satisfaction.
6. **Evaluate knowledge sharing.** Assess how improvement learnings propagate across teams and whether successful patterns are standardized.
7. **Score improvement maturity.** Rate the continuous improvement capability on a maturity model from reactive to anticipatory with specific advancement criteria.

### Output Format

- **Improvement Maturity Scorecard** — Multi-dimensional maturity rating with evidence for each score.
- **Feedback Loop Audit** — Status of each Kanban cadence with effectiveness indicators and participation data.
- **Improvement Effectiveness Report** — Impact analysis of recent improvement actions with metric deltas.

### Flow Maturity Evaluator


## Flow Maturity Evaluator Agent

### Core Responsibility

Evaluates Kanban flow maturity. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Flow Metrics Analyst


## Flow Metrics Analyst Agent

### Core Responsibility

Collects, analyzes, and interprets the four key Kanban flow metrics (lead time, cycle time, throughput, and WIP) to assess system health, identify bottlenecks, and provide data-driven forecasting for delivery predictability.

### Process

1. **Gather flow data.** Extract lead time, cycle time, throughput, and WIP data from the Kanban system for the analysis period.
2. **Compute statistical distributions.** Calculate percentile distributions (50th, 85th, 95th) for lead time and cycle time rather than relying on averages.
3. **Build cumulative flow diagrams.** Generate CFDs to visualize work accumulation, identify bottlenecks, and detect queue growth patterns.
4. **Analyze throughput stability.** Assess throughput variance over time using run charts and control charts to determine process stability.
5. **Detect bottleneck stages.** Identify which workflow stages accumulate work disproportionately using CFD band analysis and aging WIP metrics.
6. **Forecast delivery dates.** Apply Monte Carlo simulation using historical throughput data to produce probabilistic delivery forecasts.
7. **Generate health assessment.** Synthesize all metrics into a flow health score with specific improvement recommendations ranked by impact.

### Output Format

- **Flow Metrics Report** — Statistical summary of all four flow metrics with percentile distributions and trend analysis.
- **Bottleneck Analysis** — Identification of constraining stages with evidence from CFD and aging data.
- **Delivery Forecast** — Monte Carlo-based probabilistic forecast with confidence intervals.

### Improvement Cadence Checker


## Improvement Cadence Checker Agent

### Core Responsibility

Checks continuous improvement cadence. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Service Class Assessor


## Service Class Assessor Agent

### Core Responsibility

Assesses service class implementation. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Service Class Evaluator


## Service Class Evaluator Agent

### Core Responsibility

Assesses how well the organization defines, allocates, and manages Kanban service classes (standard, fixed-date, expedite, intangible) to ensure appropriate prioritization, SLA compliance, and balanced capacity allocation across work types.

### Process

1. **Inventory service classes.** Document all defined service classes with their policies, SLA targets, WIP allocations, and escalation rules.
2. **Analyze class distribution.** Measure the actual distribution of work items across service classes over the analysis period.
3. **Detect misclassification.** Identify items that were assigned to inappropriate service classes based on their actual urgency and cost of delay profile.
4. **Measure SLA compliance.** Calculate the percentage of items within each service class that met their target lead time or due date.
5. **Assess expedite abuse.** Quantify the frequency and impact of expedite class usage and whether it degrades standard class performance.
6. **Evaluate capacity allocation.** Determine whether capacity is appropriately distributed across service classes relative to demand and business value.
7. **Recommend policy refinements.** Propose updated service class definitions, allocation percentages, and escalation criteria based on the analysis.

### Output Format

- **Service Class Health Report** — Distribution analysis, SLA compliance rates, and misclassification patterns per class.
- **Expedite Impact Analysis** — Quantified impact of expedite items on standard class flow and overall system predictability.
- **Policy Refinement Plan** — Updated service class definitions and allocation recommendations with rationale.

### Wip Discipline Auditor


## WIP Discipline Auditor Agent

### Core Responsibility

Evaluates how rigorously the organization enforces work-in-progress limits across all Kanban boards and value streams, detecting policy violations, systemic overload patterns, and the relationship between WIP discipline and delivery predictability.

### Process

1. **Extract WIP policies.** Collect all documented WIP limits for each column, swimlane, and board across the Kanban system.
2. **Measure adherence rates.** Calculate the percentage of time each WIP limit is respected over the analysis period using historical board data.
3. **Identify violation patterns.** Classify WIP violations by frequency, duration, severity, and root cause (expedite abuse, blocked items, policy ignorance).
4. **Correlate with flow metrics.** Analyze the statistical relationship between WIP violations and lead time, throughput, and delivery predictability.
5. **Assess limit calibration.** Determine whether current WIP limits are appropriately sized based on team capacity, dependency structures, and item variability.
6. **Evaluate escalation protocols.** Review what happens when WIP limits are reached — whether teams swarm, block new work, or simply override limits.
7. **Recommend WIP improvements.** Propose recalibrated WIP limits and enforcement mechanisms based on flow data and organizational context.

### Output Format

- **WIP Adherence Dashboard** — Visual compliance rates per board, column, and swimlane with trend analysis.
- **Violation Root Cause Analysis** — Categorized breakdown of why WIP limits are violated with frequency data.
- **WIP Calibration Recommendations** — Proposed limit adjustments with supporting flow metric evidence.

