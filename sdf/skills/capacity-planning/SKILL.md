---
name: apex-capacity-planning
description: >
  Use when the user asks to "plan capacity", "forecast resource demand",
  "analyze resource availability", "match supply to demand", or "model resource scenarios".
  Activates when a stakeholder needs to analyze resource supply vs demand, identify capacity gaps,
  detect over-allocations, build time-phased capacity models, or plan proactive hiring
  and cross-training decisions before bottlenecks impact delivery.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Resource Capacity Planning & Demand Forecasting

**TL;DR**: Analyzes resource supply against demand to identify capacity gaps, over-allocations, and optimization opportunities. Produces time-phased capacity models that forecast resource needs, enabling proactive hiring, training, or reallocation decisions before bottlenecks impact delivery.

## Principio Rector
La capacidad real es siempre menor que la teórica. Un recurso al 100% de utilización no tiene capacidad para absorber variabilidad — ese es el camino al retraso sistémico. La regla: planificar al 80% de capacidad, reservar 20% para variabilidad, reuniones, y trabajo no planificado. La previsibilidad nace de la holgura deliberada.

## Assumptions & Limits
- Assumes resource availability data is current and reflects actual calendars [SUPUESTO]
- Assumes demand data comes from approved project schedules, not wishful planning [PLAN]
- Breaks when resource data is >2 weeks stale — capacity model becomes fiction
- Does not account for unplanned work unless historical unplanned-work ratio is provided
- Planning at 80% utilization is a guideline; organizational policy may override [SUPUESTO]
- Multi-project capacity requires portfolio-level demand aggregation across all active projects

## Usage

```bash
# Build capacity model for a project
/pm:capacity-planning $PROJECT --type=model --horizon="6-months"

# Detect over-allocations across the portfolio
/pm:capacity-planning $PROJECT --type=over-allocation --threshold=80

# Run what-if scenario for resource changes
/pm:capacity-planning $PROJECT --type=scenario --change="add-2-devs"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project or portfolio identifier |
| `--type` | Yes | `model`, `over-allocation`, `scenario`, `gap-analysis` |
| `--horizon` | No | Planning horizon (3-months, 6-months, 12-months) |
| `--threshold` | No | Utilization threshold for over-allocation detection (default: 80) |
| `--change` | No | Scenario description for what-if modeling |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile uses velocity-based capacity; Waterfall uses hours-based resource calendars; SAFe uses PI-level capacity allocation; Portfolio uses aggregate capacity across projects.

## Before Planning

1. **Read** the resource pool data to confirm current availability and skill assignments
2. **Read** the project schedule to extract demand by role and time period
3. **Glob** `skills/capacity-planning/references/*.md` for capacity planning models and benchmarks
4. **Grep** for historical utilization data to calibrate realistic capacity assumptions

## Entrada (Input Requirements)
- Resource pool with skills and availability
- Project demand (schedule + resource plan)
- Organizational calendar and leave policies
- Other project commitments per resource
- Historical utilization data

## Proceso (Protocol)
1. **Supply modeling** — Calculate available capacity per resource (hours/FTE per period)
2. **Demand modeling** — Aggregate resource demand from all project activities
3. **Gap analysis** — Compare supply vs. demand per skill/role per time period
4. **Over-allocation detection** — Flag resources allocated > 80%
5. **Bottleneck identification** — Identify critical skill shortages and timing
6. **Scenario modeling** — Model what-if scenarios (delays, scope changes, resource additions)
7. **Optimization recommendations** — Suggest reallocation, cross-training, or hiring
8. **Hiring/training plan** — If gaps require new resources, define acquisition timeline
9. **Dashboard creation** — Build capacity heatmap (role x time period)
10. **Review cadence** — Establish periodic capacity review schedule

## Edge Cases

1. **Single point of failure resource**: Flag immediately. Design cross-training plan with ≥1 backup per critical skill. Document bus factor risk in risk register. [PLAN]
2. **Resource shared across >3 projects**: Cap effective allocation at 60% per project to account for context-switching overhead. Document productivity loss assumption. [INFERENCIA]
3. **Demand exceeds supply with no budget for hiring**: Prioritize demand using WSJF or sponsor input. Present trade-off: scope reduction, timeline extension, or quality compromise. [STAKEHOLDER]
4. **Resource availability data is unreliable**: Use historical average availability (typically 70-75% of theoretical) as baseline. Tag as [SUPUESTO] and recommend improving data collection. [SUPUESTO]

## Example: Good vs Bad

**Good Capacity Plan:**

| Attribute | Value |
|-----------|-------|
| Supply model | Per-resource with skills, availability, and calendar |
| Demand model | Aggregated from all active project schedules |
| Gap analysis | Per role per month with visual heatmap |
| Over-allocations | Flagged with ≥80% threshold, 4 resources identified |
| Scenarios modeled | 3 what-if scenarios with impact analysis |
| Recommendations | Specific: cross-train 2 devs, hire 1 QA by Month 3 |

**Bad Capacity Plan:**
A spreadsheet showing "we need 10 developers" without supply analysis, no time-phasing, no skill breakdown, no over-allocation detection. Fails because it provides no actionable insight about when gaps occur, which skills are short, or what trade-offs exist.

## Validation Gate
- [ ] Supply model reflects actual resource calendars, not theoretical 100% availability
- [ ] Demand aggregated from ≥1 approved project schedule with role-level granularity
- [ ] Gap analysis produced per role AND per time period — not just aggregate totals
- [ ] Every resource >80% utilization flagged with specific over-allocation periods
- [ ] ≥2 what-if scenarios modeled with quantified impact on delivery dates
- [ ] Single-point-of-failure resources identified with cross-training recommendations
- [ ] Capacity heatmap visualization produced (role x period, color-coded by gap severity)
- [ ] Hiring or training plan includes acquisition timeline aligned with demand peaks
- [ ] Resource managers can plan proactively from the capacity model [STAKEHOLDER]
- [ ] Capacity review cadence established and aligned with methodology [PLAN]

## Escalation Triggers
- Critical skill gap with no available resource within 4 weeks
- Resource utilization > 100% for extended period
- Key resource departing with no succession plan
- Capacity model shows project deadline unachievable

## Salida (Deliverables)

- Primary deliverable: capacity plan with resource allocation model
- All outputs tagged with evidence markers
- Mermaid diagrams where applicable
- Executive summary for stakeholder consumption

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before building model to understand capacity patterns | `references/body-of-knowledge.md` |
| State of the Art | When evaluating capacity planning tools | `references/state-of-the-art.md` |
| Knowledge Graph | To link capacity to resource plan and schedule | `references/knowledge-graph.mmd` |
| Use Case Prompts | When facilitating capacity workshops | `prompts/use-case-prompts.md` |
| Metaprompts | To generate capacity model templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected capacity plan format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Demand Forecaster


# Demand Forecaster

## Core Responsibility

The Demand Forecaster agent quantifies future resource demand by decomposing planned work into effort estimates across multiple time horizons (sprint, quarter, PI, annual). It ingests backlog data, historical velocity, milestone commitments, and anticipated scope changes to produce a demand heatmap that serves as the primary input for gap analysis and capacity reconciliation.

## Process

1. **Inventory** the active and planned backlog across all projects, epics, and initiatives, tagging each item with estimated effort (story points or ideal days) and target delivery window.
2. **Analyze** historical velocity trends per team and per skill cluster, computing rolling averages, standard deviations, and trend direction over the last 4-6 sprints or iterations.
3. **Map** upcoming milestones, contractual deadlines, and go-live dates onto a unified timeline, flagging hard dates that cannot shift versus soft targets with negotiation room.
4. **Project** scope changes by interviewing product owners and reviewing roadmap documents, quantifying the delta between current backlog and anticipated additions or deferrals.
5. **Disaggregate** demand by skill type (frontend, backend, QA, DevOps, design, data) to expose bottlenecks that aggregate numbers would hide.
6. **Model** demand across three scenarios — optimistic (scope trim + velocity increase), baseline (current trajectory), and pessimistic (scope creep + velocity decline) — producing confidence intervals for each period.
7. **Publish** a demand forecast artifact with weekly/sprint-level granularity, including a summary heatmap, risk flags for demand spikes, and assumptions log for traceability.

## Output Format

```markdown
## Demand Forecast — {Project/Program} — {Date}

### TL;DR
- Total demand: {X} FTE-months over {period}
- Peak demand: {Y} FTEs in {week/sprint}
- Critical skill bottleneck: {skill} ({Z} FTE shortfall)

### Demand Heatmap (by period)
| Period | Frontend | Backend | QA | DevOps | Design | Total |
|--------|----------|---------|----|--------|--------|-------|
| ...    | ...      | ...     | ...| ...    | ...    | ...   |

### Scenario Analysis
- **Optimistic**: {summary}
- **Baseline**: {summary}
- **Pessimistic**: {summary}

### Assumptions & Risks
- [ ] {assumption_1} — Impact if wrong: {impact}
- [ ] {assumption_2} — Impact if wrong: {impact}

### Evidence Tags
{Each claim tagged: [CÓDIGO] [CONFIG] [DOC] [INFERENCIA] [SUPUESTO]}
```

### Gap Reconciler


# Gap Reconciler

## Core Responsibility

The Gap Reconciler agent overlays the demand forecast against the supply model to identify periods of over-capacity and under-capacity across skill types and time horizons. For each gap, it generates ranked remediation options — hiring, outsourcing, cross-training, scope deferral, timeline adjustment, or team rebalancing — scored by cost, speed, risk, and reversibility, enabling decision-makers to act before gaps become delivery failures.

## Process

1. **Overlay** the demand forecast and supply model on a unified timeline, computing the delta (supply minus demand) per skill type per period to produce a gap matrix.
2. **Classify** each gap by severity: critical (>30% shortfall threatening a hard deadline), significant (15-30% shortfall requiring intervention), moderate (5-15% manageable with minor adjustments), or surplus (supply exceeds demand by >15%).
3. **Diagnose** root causes for each critical and significant gap — is it a hiring lag, unexpected attrition, scope creep, seasonal dip, skill mismatch, or concurrent project collision?
4. **Generate** remediation options for each gap, evaluating at minimum: (a) hire permanent staff, (b) engage contractors/outsourcing, (c) cross-train existing team members, (d) defer or descope lower-priority work, (e) adjust timelines, (f) redistribute across teams.
5. **Score** each option on four dimensions — cost impact (FTE-months), time to effect (days/sprints until capacity is available), execution risk (probability of failure), and reversibility (ease of unwinding if conditions change).
6. **Recommend** a composite remediation plan that combines multiple options to close gaps while maintaining sustainable pace, including decision deadlines (last responsible moment for each action).
7. **Validate** the reconciled plan by re-running the gap analysis with remediation actions applied, confirming that residual gaps fall below the critical threshold and flagging any remaining risks.

## Output Format

```markdown
## Gap Reconciliation — {Project/Program} — {Date}

### TL;DR
- Periods with critical gaps: {N} ({list periods})
- Largest shortfall: {X} FTEs in {skill} during {period}
- Recommended primary action: {action}
- Decision deadline: {date}

### Gap Matrix
| Period | Skill | Demand (FTE) | Supply (FTE) | Gap | Severity |
|--------|-------|--------------|--------------|-----|----------|
| ...    | ...   | ...          | ...          | ... | ...      |

### Remediation Options (ranked)
| # | Option | Cost | Time to Effect | Risk | Reversibility | Score |
|---|--------|------|----------------|------|---------------|-------|
| 1 | ...    | ...  | ...            | ...  | ...           | ...   |

### Composite Remediation Plan
1. **{Action_1}** — {description} — Deadline: {date}
2. **{Action_2}** — {description} — Deadline: {date}

### Post-Remediation Residual Gaps
| Period | Skill | Residual Gap | Acceptable? |
|--------|-------|--------------|-------------|
| ...    | ...   | ...          | ...         |

### Evidence Tags
{Each claim tagged: [CÓDIGO] [CONFIG] [DOC] [INFERENCIA] [SUPUESTO]}
```

### Supply Modeler


# Supply Modeler

## Core Responsibility

The Supply Modeler agent builds a comprehensive picture of available resource supply by accounting for current headcount, individual allocation percentages, planned hiring timelines, attrition probability, shared resource contention, leave calendars, and seasonal availability patterns. It produces a supply model that reflects realistic — not theoretical — capacity, enabling accurate gap analysis against forecasted demand.

## Process

1. **Catalog** every team member with their role, skill profile, current allocation percentage across projects, and contractual availability (full-time, part-time, contractor with end date).
2. **Calculate** net available capacity per person by subtracting organizational overhead (ceremonies, meetings, training) — typically 15-20% of gross hours — and applying a sustainable pace multiplier (target 70-85% utilization).
3. **Integrate** the hiring pipeline by mapping each open requisition to its expected start date, ramp-up period (typically 2-4 sprints to full productivity), and probability of fill based on market conditions and recruiter pipeline stage.
4. **Assess** attrition risk per team member using signals such as tenure, engagement survey scores, market demand for their skill set, and recent organizational changes, assigning low/medium/high probability with corresponding capacity impact.
5. **Model** shared resource contention by identifying individuals split across multiple projects or serving as SMEs on-call, calculating their effective availability per project with contention penalties.
6. **Overlay** seasonal availability patterns including national holidays, common PTO periods (December, summer), mandatory training windows, and company-wide events that reduce productive capacity.
7. **Produce** a supply model artifact with weekly/sprint-level granularity showing available FTEs by skill type, including confidence bands that widen as attrition and hiring uncertainty increase over time.

## Output Format

```markdown
## Supply Model — {Team/Program} — {Date}

### TL;DR
- Current effective capacity: {X} FTEs (after overhead)
- Projected capacity in {N} months: {Y} FTEs
- Key risk: {attrition/hiring delay/seasonal dip} reducing capacity by {Z}%

### Team Roster & Allocation
| Name | Role | Skills | Allocation | Net Availability | Attrition Risk |
|------|------|--------|------------|------------------|----------------|
| ...  | ...  | ...    | ...        | ...              | ...            |

### Hiring Pipeline
| Requisition | Role | Expected Start | Ramp-Up | Fill Probability |
|-------------|------|----------------|---------|------------------|
| ...         | ...  | ...            | ...     | ...              |

### Seasonal Availability Calendar
| Period | Available FTEs | Reduction Factor | Reason |
|--------|----------------|------------------|--------|
| ...    | ...            | ...              | ...    |

### Supply Confidence Bands
- **High confidence** (0-4 weeks): {X} FTEs
- **Medium confidence** (1-3 months): {X +/- Y} FTEs
- **Low confidence** (3-6 months): {X +/- Z} FTEs

### Evidence Tags
{Each claim tagged: [CÓDIGO] [CONFIG] [DOC] [INFERENCIA] [SUPUESTO]}
```

### Utilization Optimizer


# Utilization Optimizer

## Core Responsibility

The Utilization Optimizer agent monitors and tunes team utilization rates to maintain the sustainable pace zone of 70-85%. It flags individuals and teams exceeding 90% utilization as burnout risks requiring immediate load shedding, and those below 60% as potential waste or misallocation requiring rebalancing. The agent produces actionable recommendations to keep utilization within healthy bounds while maximizing throughput and team well-being.

## Process

1. **Measure** current utilization per person and per team by dividing actual productive hours (billable work + direct project tasks) by available capacity, excluding approved overhead (ceremonies, learning, mentoring).
2. **Benchmark** utilization against the sustainable pace framework: green zone (70-85%), amber zone (60-70% or 85-90%), red zone (<60% or >90%), applying role-specific adjustments (e.g., architects and tech leads naturally run lower direct utilization due to mentoring duties).
3. **Detect** chronic patterns by analyzing utilization trends over 4+ sprints — a single sprint at 92% is a spike, but four consecutive sprints above 90% is a systemic burnout risk requiring structural intervention.
4. **Identify** over-utilization root causes: too many concurrent projects per person, inadequate delegation, hero culture, missing automation, insufficient team size, or unrealistic commitments.
5. **Identify** under-utilization root causes: skill mismatch with available work, blocked dependencies, unclear priorities, onboarding ramp-up, or intentional bench time between engagements.
6. **Prescribe** optimization actions: for over-utilization — redistribute load, defer low-priority work, add capacity, automate repetitive tasks, enforce WIP limits; for under-utilization — cross-train for adjacent skills, assign to technical debt reduction, pair with overloaded team members, or accelerate upcoming work.
7. **Track** optimization outcomes by projecting the utilization impact of each recommended action and establishing a monitoring cadence (weekly for red-zone individuals, bi-weekly for amber, monthly for green) with automatic escalation triggers.

## Output Format

```markdown
## Utilization Report — {Team/Program} — {Date}

### TL;DR
- Team average utilization: {X}% ({zone})
- Individuals in red zone: {N} ({names})
- Burnout risk alert: {yes/no} — {details}
- Waste/idle alert: {yes/no} — {details}

### Individual Utilization Dashboard
| Name | Role | Utilization % | Zone | Trend (4 sprints) | Action Required |
|------|------|---------------|------|--------------------|-----------------|
| ...  | ...  | ...           | ...  | ...                | ...             |

### Team Utilization Summary
| Team | Avg Utilization | Min | Max | Std Dev | Zone |
|------|-----------------|-----|-----|---------|------|
| ...  | ...             | ... | ... | ...     | ...  |

### Red Zone Interventions
| Person/Team | Current % | Root Cause | Recommended Action | Expected Impact | Deadline |
|-------------|-----------|------------|--------------------|-----------------|----------|
| ...         | ...       | ...        | ...                | ...             | ...      |

### Optimization Actions
1. **{Action_1}** — Target: {person/team} — Expected utilization shift: {from}% -> {to}%
2. **{Action_2}** — Target: {person/team} — Expected utilization shift: {from}% -> {to}%

### Monitoring Cadence
- Red zone: Weekly check-ins until resolved
- Amber zone: Bi-weekly review
- Green zone: Monthly pulse

### Evidence Tags
{Each claim tagged: [CÓDIGO] [CONFIG] [DOC] [INFERENCIA] [SUPUESTO]}
```

