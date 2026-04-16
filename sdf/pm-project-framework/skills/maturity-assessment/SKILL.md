---
name: apex-maturity-assessment
description: >
  Use when the user asks to "assess PM maturity", "evaluate project management capability",
  "run OPM3 assessment", "check P3M3 level", "benchmark organizational PM capability",
  or mentions PM maturity, organizational PM maturity, OPM3, P3M3, project management
  maturity model, PM capability assessment. Triggers on: scores PM maturity against
  established frameworks, produces capability heat maps, identifies improvement priorities,
  creates strategic maturity roadmap, benchmarks against industry standards.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Overall PM Maturity Assessment

**TL;DR**: Assesses organizational project management maturity using established frameworks (OPM3, P3M3, or custom APEX model). Evaluates capability across project, program, and portfolio management domains, covering process standardization, measurement, control, and continuous improvement. Produces a maturity level determination, capability heat map, and a strategic improvement roadmap.

## Principio Rector
La madurez en gestión de proyectos no es un destino — es un indicador de capacidad organizacional para entregar valor de forma predecible. Un nivel 5 de madurez no significa perfección; significa que la organización mide, controla y mejora sus procesos de forma sistémica. La evaluación debe revelar dónde invertir para maximizar la capacidad de entrega.

## Assumptions & Limits
- Assumes access to PM practitioners, sponsors, and executives for interview-based evidence [STAKEHOLDER]
- Assumes historical project performance data exists (on-time, on-budget, on-scope rates) [SUPUESTO]
- Breaks if organization has fewer than 5 projects in history — insufficient data for meaningful maturity assessment [METRIC]
- Scope limited to PM maturity; IT maturity, organizational maturity, and digital maturity are separate assessments [PLAN]
- Does not prescribe target maturity level — target depends on organizational strategy and investment appetite [PLAN]

## Usage
```bash
/pm:maturity-assessment $ORG_NAME --framework=opm3
/pm:maturity-assessment $ORG_NAME --framework=p3m3 --domains=project,program,portfolio
/pm:maturity-assessment $ORG_NAME --framework=apex --benchmark=industry
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ORG_NAME` | Yes | Target organization identifier |
| `--framework` | No | `opm3` / `p3m3` / `apex` (default: `apex`) |
| `--domains` | No | `project` / `program` / `portfolio` / `all` (default: `all`) |
| `--benchmark` | No | `industry` / `sector` / `internal` |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Assess PM maturity with Agile-specific capability dimensions added
- **Waterfall**: Classic PM maturity assessment aligned with PMBOK knowledge areas
- **SAFe**: Extend assessment to include Lean-Agile maturity at portfolio level
- **Kanban**: Include flow-based PM maturity dimensions alongside traditional domains
- **Hybrid**: Assess maturity across both iterative and sequential PM capabilities
- **PMO**: Primary use — full organizational PM maturity across all domains
- **Portfolio**: Emphasize portfolio management maturity (strategic alignment, resource optimization)
- **Transformation**: Baseline PM maturity to design capability building program

## Before Assessing Maturity
1. Read organizational PM governance model — understand existing structures before scoring [PLAN]
2. Glob `*process*`, `*template*`, `*standard*` — inventory existing PM artifacts [PLAN]
3. Read historical project performance data — quantitative evidence for maturity scoring [METRIC]
4. Schedule stakeholder interviews — maturity assessment requires multi-perspective evidence [STAKEHOLDER]

## Entrada (Input Requirements)
- Organizational structure and PM governance model
- Existing PM processes, templates, and standards
- PM tool landscape and utilization levels
- PM competency profiles and training programs
- Historical project performance data (on-time, on-budget, on-scope rates)

## Proceso (Protocol)
1. **Framework selection** — Choose maturity model (OPM3, P3M3, or APEX custom) based on org context
2. **Domain scoping** — Define assessment domains (project, program, portfolio, organizational enablers)
3. **Data collection** — Gather evidence through interviews, process review, and artifact analysis
4. **Process maturity scoring** — Rate each domain on standardization, measurement, control, improvement (1-5)
5. **Capability heat mapping** — Visualize maturity across domains as heat map
6. **Strengths identification** — Document areas of high maturity and contributing factors
7. **Gap analysis** — Identify critical gaps between current and target maturity
8. **Benchmark comparison** — Compare against industry and sector benchmarks
9. **Investment prioritization** — Rank improvements by impact on delivery capability
10. **Strategic roadmap** — Design multi-year maturity improvement roadmap

## Edge Cases
1. **Level 1 maturity across all critical domains** — Do not attempt Level 5 roadmap; design Level 2 quick-wins (basic standardization) as immediate priority.
2. **Assessment reveals regulatory or compliance exposure** — Escalate immediately to governance; compliance gaps take priority over maturity improvement.
3. **Organization lacks basic PM competency framework** — Competency development becomes prerequisite to process maturity; roadmap must address people before process.
4. **Stakeholders disagree on maturity scores** — Use evidence-based scoring with artifact review; document dissenting views but let evidence prevail.

## Example: Good vs Bad

**Good Maturity Assessment:**
| Attribute | Value |
|-----------|-------|
| Framework | P3M3 with APEX extensions for agile dimensions [PLAN] |
| Scoring | 12 domains rated 1-5 with specific evidence per score [METRIC] |
| Heat map | Visual showing strengths (Level 4 in risk) and gaps (Level 1 in portfolio) [METRIC] |
| Benchmark | Compared against financial services sector P3M3 data [METRIC] |
| Roadmap | 18-month plan with quarterly milestones and FTE-month estimates [SCHEDULE] |

**Bad Maturity Assessment:**
"The organization is at Level 2 overall." — No domain breakdown, no evidence per score, no heat map, no benchmark, no roadmap. Single number provides no basis for improvement investment.

## Salida (Deliverables)
- `05_pm_maturity_assessment_{proyecto}_{WIP}.md` — Full maturity assessment report
- Capability heat map across PM domains
- Gap analysis with prioritized improvement areas
- Benchmark comparison scorecard
- Strategic maturity improvement roadmap (12-24 months)

## Validation Gate
- [ ] Maturity levels supported by process artifacts and performance data — not self-reported
- [ ] Framework levels applied per published model definitions exactly
- [ ] All PM domains and organizational enablers assessed — no dimension skipped
- [ ] Scoring calibrated across departments and business units consistently
- [ ] Improvement roadmap includes effort estimates (FTE-months) and expected maturity gain
- [ ] Maturity levels translated to business capability language for executive audience
- [ ] Each score links to 2 or more specific evidence artifacts
- [ ] Risks of current maturity gaps on project portfolio quantified
- [ ] C-level presentation shows maturity as investment in delivery predictability
- [ ] Assessment model appropriate for organizational context and methodology portfolio

## Escalation Triggers
- Level 1 maturity across all critical PM domains
- No PM processes standardized despite running 50+ projects
- PM maturity assessment reveals compliance or regulatory exposure
- Organization lacks basic PM competency framework

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

### Benchmark Comparator


## Benchmark Comparator Agent

### Core Responsibility

Compares against industry benchmarks. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Capability Dimension Scorer


## Capability Dimension Scorer Agent

### Core Responsibility

Scores PM capability dimensions. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Cmmi Assessor


## CMMI Assessor Agent

### Core Responsibility

Evaluates the organization's project management process maturity using the CMMI (Capability Maturity Model Integration) framework, scoring practices across maturity levels from Initial through Optimizing to determine the current state and define improvement pathways.

### Process

1. **Scope the assessment.** Define which CMMI process areas are in scope based on the organization's PM domain (project planning, monitoring, risk management, requirements management, etc.).
2. **Gather process evidence.** Collect documentation, interview data, and observational evidence for each process area under assessment.
3. **Evaluate process institutionalization.** Assess whether processes are documented, followed, measured, and managed or merely ad hoc and person-dependent.
4. **Score maturity levels.** Rate each process area against CMMI maturity levels (1-Initial, 2-Managed, 3-Defined, 4-Quantitatively Managed, 5-Optimizing).
5. **Identify level gaps.** For each process area below target maturity, identify specific practice gaps that prevent advancement to the next level.
6. **Assess organizational support.** Evaluate whether organizational infrastructure (training, tools, governance) supports the target maturity level.
7. **Produce maturity report.** Generate a comprehensive maturity assessment with current scores, gap analysis, and a staged improvement plan.

### Output Format

- **CMMI Maturity Scorecard** — Process area scores mapped to maturity levels with evidence references.
- **Gap Analysis by Level** — Specific practices missing for each process area to advance to the next maturity level.
- **Maturity Improvement Roadmap** — Staged plan with milestones, effort estimates, and dependencies for maturity advancement.

### Gap Prioritizer


## Gap Prioritizer Agent

### Core Responsibility

Prioritizes maturity gaps. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Improvement Roadmap Builder


## Improvement Roadmap Builder Agent

### Core Responsibility

Builds improvement roadmap. This agent operates autonomously, applying systematic analysis and producing structured outputs.

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

### Maturity Benchmark Analyst


## Maturity Benchmark Analyst Agent

### Core Responsibility

Compares the organization's project management maturity scores against industry benchmarks, peer organizations, and recognized best practices to contextualize the assessment results and identify where the organization leads, matches, or lags relative to its competitive landscape.

### Process

1. **Select benchmark set.** Identify appropriate industry benchmarks, peer group data, and best-practice references relevant to the organization's sector and size.
2. **Normalize maturity data.** Convert the organization's maturity scores to a comparable scale that aligns with available benchmark datasets.
3. **Perform comparative analysis.** Compare the organization's scores against benchmark medians, quartiles, and best-in-class performers for each maturity dimension.
4. **Identify competitive gaps.** Highlight dimensions where the organization falls below industry median as competitive risks requiring attention.
5. **Recognize strengths.** Identify dimensions where the organization exceeds benchmarks as potential competitive advantages to leverage.
6. **Contextualize findings.** Adjust benchmark comparisons for organizational context (size, industry, regulatory environment, geographic distribution).
7. **Produce benchmark report.** Generate a contextual benchmark analysis with competitive positioning and strategically prioritized improvement recommendations.

### Output Format

- **Benchmark Comparison Dashboard** — Organization scores vs industry median, quartiles, and best-in-class across maturity dimensions.
- **Competitive Position Analysis** — Strengths and gaps relative to peers with strategic implications.
- **Priority Improvement Map** — Dimensions prioritized by competitive impact and improvement feasibility.

### Maturity Roadmap Planner


## Maturity Roadmap Planner Agent

### Core Responsibility

Translates maturity assessment findings into a realistic, phased roadmap for advancing organizational PM maturity, sequencing improvements based on dependencies, organizational capacity for change, quick-win opportunities, and strategic impact to maximize the return on improvement investment.

### Process

1. **Prioritize improvement areas.** Rank maturity gaps by strategic importance, competitive impact, and foundational dependency (some improvements enable others).
2. **Identify quick wins.** Find low-effort, high-impact improvements that can build momentum and demonstrate value in the first 90 days.
3. **Map dependencies.** Identify which improvements must precede others (e.g., standardization before measurement, measurement before control).
4. **Estimate effort and timeline.** Size each improvement initiative using comparable benchmarks and organizational change capacity analysis.
5. **Design maturity phases.** Group improvements into logical phases (typically 6-12 months each) that advance the organization through maturity levels progressively.
6. **Define success metrics.** Establish measurable success criteria for each phase that demonstrate maturity advancement to stakeholders.
7. **Produce roadmap.** Generate a visual, time-bound roadmap with phases, milestones, dependencies, resource requirements, and governance checkpoints.

### Output Format

- **Maturity Advancement Roadmap** — Phased timeline with improvement initiatives, milestones, and dependencies.
- **Quick Win Catalog** — Immediately actionable improvements with expected impact and minimal prerequisites.
- **Investment Case** — Resource requirements and expected ROI for each maturity advancement phase.

### Opm3 Evaluator


## OPM3 Evaluator Agent

### Core Responsibility

Assesses organizational project management maturity using PMI's OPM3 (Organizational Project Management Maturity Model) framework, evaluating capabilities across project, program, and portfolio management domains and the progressive stages of standardize, measure, control, and continuously improve.

### Process

1. **Define assessment scope.** Determine which OPM3 domains (project, program, portfolio) and organizational enablers are included in the assessment.
2. **Assess standardization.** Evaluate whether PM processes are documented, standardized, and consistently applied across the organization.
3. **Evaluate measurement.** Determine whether the organization collects and uses process metrics to understand PM performance and identify trends.
4. **Assess control mechanisms.** Review whether the organization has controls in place to manage process variation and ensure consistent outcomes.
5. **Evaluate continuous improvement.** Assess whether the organization systematically identifies and implements process improvements based on measurement data.
6. **Map organizational enablers.** Evaluate the supporting infrastructure: structural, cultural, technological, and human resource enablers of PM maturity.
7. **Generate OPM3 assessment.** Produce a comprehensive maturity profile across domains and stages with capability percentages and improvement priorities.

### Output Format

- **OPM3 Maturity Profile** — Capability assessment across project, program, and portfolio domains at each maturity stage.
- **Organizational Enabler Assessment** — Evaluation of structural, cultural, technological, and HR enablers with gap identification.
- **Capability Improvement Plan** — Prioritized actions to advance organizational PM maturity with expected business benefits.

