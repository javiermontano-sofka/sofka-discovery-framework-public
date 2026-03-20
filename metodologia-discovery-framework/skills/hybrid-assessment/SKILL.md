---
name: apex-hybrid-assessment
description: >
  Use when the user asks to "assess hybrid methodology readiness", "evaluate hybrid approach",
  "check hybrid methodology maturity", "measure integration capability", "diagnose water-scrum-fall",
  or mentions hybrid assessment, hybrid readiness, mixed methodology evaluation,
  iterative-sequential integration maturity. Triggers on: evaluates hybrid methodology maturity,
  detects hybrid anti-patterns, scores integration capability, assesses dual-governance readiness,
  produces hybrid adoption roadmap.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Hybrid Methodology Maturity Assessment

**TL;DR**: Evaluates organizational readiness and maturity for hybrid methodology adoption — the deliberate integration of iterative (Agile/Kanban) and sequential (Waterfall/phase-gate) practices. Assesses the organization's ability to manage dual governance, context-switching, and integrated reporting. Produces a maturity score, integration gap analysis, and a phased adoption roadmap.

## Principio Rector
Híbrido no significa "hacemos un poco de todo y nada bien". La madurez híbrida se mide por la capacidad de la organización para elegir conscientemente qué componentes del proyecto son iterativos y cuáles son secuenciales, y gobernarlos de forma integrada sin fricción ni duplicación.

## Assumptions & Limits
- Assumes the organization has at least basic experience with both iterative and sequential approaches [SUPUESTO]
- Assumes assessment respondents can differentiate between intentional hybrid and accidental hybrid [SUPUESTO]
- Breaks if the organization has zero iterative or zero sequential experience — use `methodology-assessment` instead [PLAN]
- Scope limited to methodology integration maturity; tool integration is assessed separately by `jira-configuration` [PLAN]
- Does not prescribe a specific hybrid model — assesses capability to execute any hybrid approach [PLAN]

## Usage
```bash
/pm:hybrid-assessment $PROJECT_NAME --dimensions=all
/pm:hybrid-assessment $PROJECT_NAME --dimensions=governance,reporting --benchmark=industry
/pm:hybrid-assessment $PROJECT_NAME --type=quick --teams=5
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project or organization identifier |
| `--dimensions` | No | `all` / comma-separated list (default: `all`) |
| `--benchmark` | No | `industry` / `internal` (default: `internal`) |
| `--teams` | No | Number of teams to assess |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Assess readiness to integrate phase-gate governance into Agile delivery
- **Waterfall**: Assess readiness to introduce iterative elements within phase-gate structure
- **SAFe**: Assess ability to manage SAFe alongside traditional PMO governance
- **Kanban**: Assess ability to overlay Kanban flow with milestone-driven reporting
- **Hybrid**: Primary use — full maturity assessment across all hybrid dimensions
- **PMO**: Assess PMO capability to govern mixed-methodology portfolio
- **Transformation**: Assess readiness for transition from single to hybrid methodology

## Before Assessing Hybrid Maturity
1. Read `methodology-assessment` results — confirm both iterative and sequential baselines exist [PLAN]
2. Glob `*governance*` — verify governance structures are documented for comparison [PLAN]
3. Read team composition data — identify teams operating under different methodologies [STAKEHOLDER]
4. Review organizational change readiness — hybrid adoption is a change management challenge [PLAN]

## Entrada (Input Requirements)
- Current methodology practices (both iterative and sequential)
- Governance and reporting structures
- Team composition and methodology experience
- Tooling landscape and integration capabilities
- Organizational culture and change readiness

## Proceso (Protocol)
1. **Dimension definition** — Establish hybrid assessment dimensions (governance integration, reporting unification, team flexibility, tooling integration, culture adaptability)
2. **Data collection** — Gather evidence through interviews, process review, and artifact analysis
3. **Iterative capability scoring** — Rate maturity of Agile/iterative practices (1-5)
4. **Sequential capability scoring** — Rate maturity of Waterfall/sequential practices (1-5)
5. **Integration capability scoring** — Rate ability to combine both coherently (1-5)
6. **Gap analysis** — Identify where integration breaks down
7. **Anti-pattern detection** — Flag common hybrid anti-patterns (Water-Scrum-Fall, Agile-in-Name-Only)
8. **Benchmark comparison** — Compare against hybrid methodology maturity benchmarks
9. **Roadmap creation** — Design phased improvement plan toward effective hybrid operation
10. **Report generation** — Compile dual-radar assessment report

## Edge Cases
1. **Organization claims hybrid but operates pure waterfall with daily standups** — Flag as "cosmetic hybrid" anti-pattern; score integration capability at Level 1; recommend honest baseline before improvement.
2. **Different teams at vastly different maturity levels** — Produce per-team scorecards alongside aggregate; roadmap must address team-specific gaps, not just organizational average.
3. **No governance integration exists** — Dual governance creates double reporting burden; prioritize governance unification as first roadmap item.
4. **Regulatory constraints force sequential governance on agile teams** — Design compliance-compatible agile governance; map regulatory checkpoints to sprint boundaries.

## Example: Good vs Bad

**Good Hybrid Assessment:**
| Attribute | Value |
|-----------|-------|
| Iterative maturity | Level 3 across 4 teams, evidence-based scoring [METRIC] |
| Sequential maturity | Level 4 across PMO processes, calibrated against P3M3 [METRIC] |
| Integration score | Level 2 — governance unified but reporting still duplicated [METRIC] |
| Anti-patterns | Water-Scrum-Fall detected in 2 of 6 teams [METRIC] |
| Roadmap | 3 phases over 9 months with specific actions per team [SCHEDULE] |

**Bad Hybrid Assessment:**
"The organization is somewhat hybrid." — No dimension scoring, no anti-pattern analysis, no per-team breakdown, no evidence-based maturity levels. Assessment provides no actionable improvement path.

## Salida (Deliverables)
- `05_hybrid_assessment_{proyecto}_{WIP}.md` — Hybrid maturity report
- Dual maturity radar (iterative vs. sequential capabilities)
- Integration gap analysis matrix
- Anti-pattern detection report
- Hybrid adoption roadmap

## Validation Gate
- [ ] Every maturity score backed by specific observed evidence — no self-reported scores without verification
- [ ] Both iterative and sequential dimensions independently scored (1-5)
- [ ] Integration capability scored separately from component capabilities
- [ ] Anti-pattern detection covers at least Water-Scrum-Fall, Agile-in-Name-Only, and Governance Duplication
- [ ] Same scoring rubric applied across all teams and departments
- [ ] Roadmap addresses root causes, not symptoms — each action traces to a gap
- [ ] Assessment distinguishes intentional hybrid from accidental hybrid
- [ ] Risks of premature hybrid adoption explicitly identified
- [ ] Leadership sees clear path from current to target state with effort estimates
- [ ] Assessment respects that hybrid is intentional design, not methodology confusion

## Escalation Triggers
- Organization practicing "accidental hybrid" with no intentional integration
- Level 1 maturity in both iterative and sequential dimensions simultaneously
- Governance structure actively prevents methodology integration
- Teams forced into hybrid without training or tooling support

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

### Balance Evaluator


## Balance Evaluator Agent

### Core Responsibility

Analyzes the current distribution of agile and predictive practices within a project or program to determine whether the hybrid methodology balance is optimal for the given context, constraints, and organizational culture.

### Process

1. **Map current practices.** Inventory all ceremonies, artifacts, and governance mechanisms currently in use across the project lifecycle.
2. **Classify each practice.** Tag every practice as agile-origin, predictive-origin, or hybrid-native using the methodology taxonomy.
3. **Score balance dimensions.** Evaluate balance across planning horizon, documentation depth, change responsiveness, stakeholder cadence, and risk management.
4. **Assess context fit.** Compare the current balance ratio against project complexity, regulatory requirements, team maturity, and contract type.
5. **Identify imbalance zones.** Detect areas where one paradigm dominates inappropriately given the context factors.
6. **Model rebalancing scenarios.** Simulate 2-3 alternative balance configurations and project their impact on delivery predictability and adaptability.
7. **Recommend target balance.** Produce a calibrated agile-predictive ratio with phase-specific adjustments and transition guidance.

### Output Format

- **Balance Scorecard** — Dimensional scoring of agile vs predictive weight across 5+ dimensions with radar visualization data.
- **Rebalancing Roadmap** — Phased plan to shift practices toward the recommended balance ratio.
- **Context Fit Matrix** — Mapping of project context factors to their optimal methodology weight.

### Ceremony Harmonizer


## Ceremony Harmonizer Agent

### Core Responsibility

Analyzes the full ceremony landscape of a hybrid project to detect redundancies, gaps, and misalignments between agile rituals and predictive meetings, then designs a unified ceremony calendar that serves both paradigms efficiently.

### Process

1. **Catalog all ceremonies.** List every recurring meeting, review, retrospective, gate, and checkpoint across both agile and predictive streams.
2. **Map purpose overlap.** Identify ceremonies that serve the same underlying purpose but exist in both paradigms with different names or formats.
3. **Detect ceremony gaps.** Find areas where neither paradigm provides adequate ceremony coverage for the hybrid context.
4. **Assess participant fatigue.** Calculate meeting load per role and identify roles suffering from excessive ceremony participation across both streams.
5. **Design unified calendar.** Create an integrated ceremony schedule that consolidates overlapping events and fills gaps without increasing total meeting time.
6. **Define ceremony bridges.** Specify how outputs from agile ceremonies feed into predictive checkpoints and vice versa.
7. **Produce transition playbook.** Document the migration path from current ceremony landscape to the harmonized model with change management considerations.

### Output Format

- **Ceremony Overlap Matrix** — Cross-reference of agile and predictive ceremonies showing purpose overlap and consolidation opportunities.
- **Unified Ceremony Calendar** — Integrated schedule with cadence, participants, inputs, outputs, and duration for each harmonized ceremony.
- **Transition Playbook** — Step-by-step guide for migrating to the harmonized ceremony model.

### Ceremony Overlap Analyzer


## Ceremony Overlap Analyzer Agent

### Core Responsibility

Analyzes ceremony overlap between agile and predictive. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Governance Bridge Assessor


## Governance Bridge Assessor Agent

### Core Responsibility

Assesses governance bridging capability. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Governance Bridge Auditor


## Governance Bridge Auditor Agent

### Core Responsibility

Examines how governance structures connect agile delivery teams with predictive oversight frameworks, ensuring that decision-making authority, escalation paths, and compliance checkpoints function cohesively across both paradigms without creating bottlenecks.

### Process

1. **Inventory governance touchpoints.** Catalog every decision gate, approval step, review board, and escalation path in the current governance model.
2. **Trace information flow.** Map how delivery status, risks, and decisions flow between agile teams and predictive governance layers.
3. **Detect friction points.** Identify where governance handoffs cause delays, information loss, or conflicting directives between paradigms.
4. **Evaluate authority alignment.** Assess whether decision-making authority is appropriately distributed between Product Owners, Project Managers, and steering committees.
5. **Benchmark against patterns.** Compare the governance bridge against known hybrid governance patterns (bimodal, scaled, federated).
6. **Measure governance overhead.** Quantify the cost of governance activities as a percentage of total delivery effort and compare to industry benchmarks.
7. **Propose bridge improvements.** Recommend specific governance bridge mechanisms that reduce friction while maintaining compliance and visibility.

### Output Format

- **Governance Bridge Map** — Visual flow of decision authority and information between agile and predictive layers.
- **Friction Analysis Report** — Ranked list of governance friction points with root cause and remediation options.
- **Bridge Design Recommendations** — Specific governance mechanisms to improve cross-paradigm cohesion.

### Hybrid Fitness Evaluator


## Hybrid Fitness Evaluator Agent

### Core Responsibility

Evaluates project fitness for hybrid methodology. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Hybrid Maturity Scorer


## Hybrid Maturity Scorer Agent

### Core Responsibility

Scores organizational hybrid maturity. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Hybrid Readiness Scorer


## Hybrid Readiness Scorer Agent

### Core Responsibility

Evaluates an organization's readiness to adopt or improve a hybrid methodology approach by assessing team skills, tooling maturity, cultural openness, leadership support, and process flexibility across multiple dimensions to produce a composite readiness score.

### Process

1. **Assess team capabilities.** Evaluate team experience with both agile and predictive practices using skill matrices and certification data.
2. **Evaluate tooling landscape.** Determine whether current tools support both paradigms and the integration points between them.
3. **Measure cultural indicators.** Assess organizational culture on the spectrum from command-and-control to self-organizing using survey data and behavioral signals.
4. **Gauge leadership alignment.** Evaluate sponsor and executive understanding of hybrid approaches and their willingness to support dual governance.
5. **Analyze process flexibility.** Determine how rigid or adaptable current processes are to accommodate practice mixing and methodology tailoring.
6. **Score each dimension.** Apply a 1-5 maturity scale across all readiness dimensions and compute weighted composite scores.
7. **Generate readiness report.** Produce a comprehensive readiness assessment with dimension scores, critical gaps, and a prioritized enablement roadmap.

### Output Format

- **Readiness Scorecard** — Multi-dimensional scoring with composite readiness index and benchmark comparison.
- **Gap Analysis** — Critical gaps that must be addressed before or during hybrid adoption with severity ratings.
- **Enablement Roadmap** — Prioritized actions to close readiness gaps organized by effort and impact.

