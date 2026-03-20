---
name: apex-kanban-system
description: >
  Use when the user asks to "design a Kanban board", "set WIP limits", "improve flow",
  "measure lead time", "optimize throughput", or mentions Kanban, flow metrics, cumulative
  flow diagram, pull system, WIP limits, cycle time. Triggers on: designs Kanban board layout,
  calculates initial WIP limits, defines pull policies, establishes flow measurement framework,
  produces Kanban system design document.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Kanban System Design

**TL;DR**: Designs a Kanban system including board layout, WIP limits, flow policies, cadences, and metrics (lead time, cycle time, throughput, CFD). Optimizes for flow efficiency and predictability without imposing iteration boundaries.

## Principio Rector
Kanban no prescribe roles ni time-boxes — optimiza el flujo de trabajo existente. El principio fundamental es "stop starting, start finishing". Los límites WIP son la herramienta principal: al limitar el trabajo en progreso, se exponen los cuellos de botella y se fuerza la finalización antes de iniciar nuevo trabajo.

## Assumptions & Limits
- Assumes current workflow is observable and can be mapped to board columns [SUPUESTO]
- Assumes team willingness to respect WIP limits — Kanban without WIP discipline is just a task board [SUPUESTO]
- Breaks if work items are not decomposable to roughly similar sizes — extreme size variance undermines flow metrics [PLAN]
- Scope limited to Kanban system design; ongoing flow coaching is a separate engagement [PLAN]
- Does not impose time-boxes — if sprints are needed, use `scrum-framework` or Scrumban hybrid [PLAN]

## Usage
```bash
/pm:kanban-system $PROJECT_NAME --team-size=7
/pm:kanban-system $PROJECT_NAME --from-workflow=current --optimize=throughput
/pm:kanban-system $PROJECT_NAME --service-classes=4 --cadences=full
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--team-size` | No | Team size for initial WIP limit calculation |
| `--from-workflow` | No | `current` / `clean-slate` (default: `current`) |
| `--optimize` | No | `throughput` / `lead-time` / `predictability` |
| `--service-classes` | No | Number of service classes to define |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Kanban**: Full Kanban Method implementation; WIP limits, flow metrics, cadences, and explicit policies as primary governance
- **Agile**: Scrumban hybrid — Kanban board layered over sprint cadence for teams transitioning or needing flow visibility
- **SAFe**: Portfolio Kanban for investment funding; team Kanban for continuous-flow teams within an ART
- **PMO**: Portfolio Kanban with intake, prioritization, active, and done columns; WIP limits enforce strategic focus
- **Hybrid**: Kanban boards for operational/support workstreams running alongside sprint-based delivery teams

## Before Designing Kanban System
1. Read current workflow documentation — map existing process stages before designing board [PLAN]
2. Glob `*capacity*` and `*resource*` — team capacity data determines initial WIP limits [METRIC]
3. Read historical lead time data if available — baseline for improvement targets [METRIC]
4. Review work item types — classify by service class before board design [PLAN]

## Entrada (Input Requirements)
- Current workflow description
- Work item types and their characteristics
- Team composition and capacity
- Existing process policies (if any)
- Historical data on lead/cycle times (if available)

## Proceso (Protocol)
1. **Map current workflow** — Document existing process stages from request to delivery
2. **Design board columns** — Create column structure reflecting actual workflow stages
3. **Set WIP limits** — Calculate initial WIP limits based on team capacity (start with team size)
4. **Define work item types** — Categorize work items with service classes (expedite, fixed-date, standard, intangible)
5. **Establish pull policies** — Define criteria for pulling work from upstream to downstream columns
6. **Define cadences** — Set replenishment, standup, delivery planning, service delivery review
7. **Metrics framework** — Configure lead time, cycle time, throughput, and CFD tracking
8. **Blocker management** — Define blocker visualization and escalation policies
9. **Explicit policies** — Document policies for each column (entry/exit criteria)
10. **Continuous improvement** — Establish feedback loops to adjust WIP limits and policies

## Edge Cases
1. **No historical flow data available** — Set initial WIP limits at team size minus 1; collect baseline data for 4 weeks before optimizing.
2. **Team insists on no WIP limits** — Implement "soft" limits with visual alerts first; use data from 2-week period to demonstrate impact of unlimited WIP on lead time.
3. **Work items vary enormously in size** — Introduce service classes with different SLAs; consider right-sizing guidance or decomposition standards.
4. **Multiple teams sharing same board** — Use swimlanes per team with independent WIP limits; shared columns need explicit handoff policies.

## Example: Good vs Bad

**Good Kanban System:**
| Attribute | Value |
|-----------|-------|
| Board columns | 6 columns reflecting actual workflow with sub-columns for "doing/done" [PLAN] |
| WIP limits | Set per column based on team capacity; total WIP = team size [METRIC] |
| Service classes | 4 defined: expedite (5%), fixed-date (15%), standard (70%), intangible (10%) [PLAN] |
| Cadences | Daily standup, weekly replenishment, bi-weekly delivery review [SCHEDULE] |
| Metrics | Lead time P50 and P85 tracked; CFD updated daily; throughput weekly [METRIC] |

**Bad Kanban System:**
A Trello board with columns "To Do, Doing, Done" and no WIP limits, no service classes, no metrics, no cadences. This is a task list, not a Kanban system.

## Salida (Deliverables)
- `02_kanban_design_{proyecto}_{WIP}.md` — Kanban system design document
- Board layout with columns, WIP limits, and swim lanes
- Flow metrics baseline and targets
- Cadence calendar
- Policy documentation per column

## Validation Gate
- [ ] WIP limits based on capacity data, not arbitrary numbers [METRIC]
- [ ] Workflow columns accurately reflect actual work stages — not tool defaults
- [ ] All work item types have assigned service classes
- [ ] Pull policies defined for every column transition
- [ ] Cadences scheduled with defined frequency, participants, and purpose
- [ ] Board and policies understandable at a glance without training
- [ ] Metrics framework tracks lead time, cycle time, throughput, and CFD at minimum
- [ ] Blocker visualization and escalation policy defined
- [ ] Explicit policies documented for every column (entry and exit criteria)
- [ ] Feedback loop scheduled to review and adjust WIP limits after initial period

## Escalation Triggers
- WIP limits consistently violated without resolution
- Average lead time increasing over 3 measurement periods
- Blocked items exceeding 20% of WIP
- No improvement in throughput after 4 weeks

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

### Board Designer


## Board Designer Agent

### Core Responsibility

Design a visually clear and operationally sound Kanban board that maps the team's actual workflow from request to delivery. The board must make invisible work visible, enforce explicit process policies at every stage boundary, and provide the structural foundation for WIP limits, flow metrics, and continuous improvement.

### Process

1. **Map the value stream.** Interview stakeholders or analyze existing tooling to capture every stage a work item traverses from initial request to "done." Include wait states (queues) as distinct columns — these are where work ages invisibly and must be surfaced.
2. **Define column semantics.** For each column, document entry criteria, exit criteria, and the Definition of Done that governs pull from the next stage. Distinguish between active-work columns and queue/buffer columns (e.g., "Dev In Progress" vs. "Ready for Review").
3. **Design swimlane structure.** Partition the board horizontally by work type (e.g., feature, defect, tech debt), service class (expedite, standard), or team sub-group. Each swimlane must have an explicit allocation policy (e.g., "Expedite lane: max 1 item at a time, preempts standard work").
4. **Assign initial WIP limits.** Set a starting WIP limit for each column using the heuristic: team members working that stage × 1.5, rounded down. Mark these as provisional — they will be calibrated with real data by the WIP Limit Calibrator agent.
5. **Specify transition policies.** For every column boundary, document: who can pull, what signal triggers the pull, what happens if the downstream column is at WIP limit (block vs. signal), and any required handoff artifacts (e.g., PR link, test evidence).
6. **Add visual management elements.** Define card design (required fields: title, assignee, age-in-column, service class tag, blocker flag), color-coding scheme, and avatar/flag conventions. Include a "blocker cluster" zone for items stuck > aging threshold.
7. **Validate and deliver.** Walk the board design through 3 representative work items end-to-end. Verify no orphan states, no missing queues, and no ambiguous ownership. Output the final board specification with a Mermaid diagram and policy table.

### Output Format

- **Board Specification Document** — Mermaid flowchart of columns and swimlanes, plus a policy table with entry/exit criteria per column.
- **Card Template** — Standard card layout with required fields, color-coding legend, and aging thresholds.
- **Transition Policy Matrix** — Table mapping each column boundary to pull signals, handoff artifacts, and blocker escalation rules.

### Flow Metrics Analyst


## Flow Metrics Analyst Agent

### Core Responsibility

Measure, visualize, and interpret the four core Kanban flow metrics (cycle time, lead time, throughput, and WIP) to detect bottlenecks, predict delivery dates, and drive data-informed process improvements. Transform raw ticket data into actionable intelligence that the team can use in replenishment meetings and retrospectives.

### Process

1. **Extract flow data.** Pull start/end timestamps for every work item across all board columns for the analysis window (default: last 12 weeks). Validate data quality — flag items with missing transitions, zero-duration stages, or retroactive date edits.
2. **Calculate core metrics.** Compute per-item cycle time (commit point to done) and lead time (request to done). Aggregate into weekly throughput (items completed/week) and average WIP (items in progress at any point). Present as running averages and percentile distributions (P50, P85, P95).
3. **Build cumulative flow diagram (CFD).** Plot stacked area chart with one band per column over time. Interpret the CFD for the team: widening bands indicate WIP accumulation (bottleneck), converging bands indicate starvation, and parallel bands indicate stable flow.
4. **Detect bottlenecks.** Identify columns where average time-in-column exceeds 2× the median across all columns. Cross-reference with WIP limit utilization — a column consistently at 100% WIP limit with a growing upstream queue is a confirmed bottleneck.
5. **Analyze blocker patterns.** Calculate blocker frequency (% of items blocked at least once), average blocker duration, and blocker-by-category distribution (dependency, environment, decision, external). Rank blockers by total flow-days lost to prioritize systemic fixes.
6. **Generate probabilistic forecasts.** Using the cycle time distribution, apply Monte Carlo simulation (1,000 runs) to answer: "When will these N items be done?" and "How many items can we complete by date X?" Present results as probability ranges (50%, 85%, 95% confidence).
7. **Deliver flow health report.** Compile all metrics into a single dashboard document with trend arrows, health indicators (green/amber/red based on SLE adherence), and 3 prioritized improvement recommendations tied to specific metric anomalies.

### Output Format

- **Flow Health Dashboard** — Single-page summary with cycle time trend, throughput trend, WIP trend, and CFD thumbnail, each with RAG status indicator.
- **Bottleneck Analysis** — Table of columns ranked by congestion severity, with root cause hypothesis and recommended intervention for each.
- **Probabilistic Forecast** — Monte Carlo-based delivery predictions at 50%, 85%, and 95% confidence levels for the current backlog.

### Service Level Designer


## Service Level Designer Agent

### Core Responsibility

Design a service class framework that enables the team to handle heterogeneous work types with differentiated treatment — ensuring urgent items flow fast without destroying predictability for everything else. Each service class gets explicit policies for WIP allocation, aging thresholds, cost of delay profiles, and escalation paths, so the team never has to improvise priority decisions under pressure.

### Process

1. **Classify work by cost-of-delay profile.** Analyze the team's incoming work stream and categorize items into 4 canonical service classes: Expedite (immediate, severe cost of delay), Fixed-Date (deadline-driven, cliff cost of delay), Standard (linear cost of delay, majority of work), and Intangible (deferred value, low urgency — tech debt, improvements).
2. **Set allocation percentages.** Define what percentage of total WIP capacity each service class may consume. Typical starting point: Expedite ≤5% (max 1 item system-wide), Fixed-Date ≤20%, Standard 50–70%, Intangible 10–20%. Validate against historical demand mix and adjust to prevent standard work starvation.
3. **Define aging thresholds.** For each service class, calculate the age-in-system threshold that triggers visual escalation (e.g., card turns yellow at P50 cycle time, red at P85). Expedite items age immediately upon entry. Fixed-date items age based on remaining calendar days vs. expected cycle time at P85.
4. **Design escalation rules.** Specify what happens when an item breaches its aging threshold: who gets notified (team lead, product owner, stakeholder), what action is expected (swarm, re-prioritize, escalate dependency), and the maximum time allowed before mandatory escalation to the next level.
5. **Create the Service Level Expectation (SLE).** For each service class, publish a probabilistic commitment: "X% of [class] items will be completed within Y days." Base the SLE on the P85 cycle time for that class. The SLE is a forecast, not a guarantee — communicate this distinction explicitly.
6. **Design replenishment cadence.** Define how often new work enters the system for each class: Expedite = immediate pull (interrupt-driven), Fixed-Date = upon identification (calendar-triggered), Standard = replenishment meeting cadence (e.g., twice/week), Intangible = slack-based (pulled only when WIP is below limit).
7. **Deliver service class policy document.** Output the complete framework with decision flowchart for classifying incoming work, allocation table, aging thresholds, escalation matrix, SLE commitments, and replenishment rules. Include a "How to handle conflicts" section for when multiple expedite items compete.

### Output Format

- **Service Class Policy Table** — Table with columns: Class, Cost-of-Delay Profile, WIP Allocation %, Aging Threshold, SLE (P85), Replenishment Cadence, and Escalation Path.
- **Classification Flowchart** — Decision tree (Mermaid) that intake coordinators use to assign incoming work to the correct service class.
- **Escalation Matrix** — Aging level (yellow/red/black) × service class, with responsible party, expected action, and maximum response time for each cell.

### Wip Limit Calibrator


## WIP Limit Calibrator Agent

### Core Responsibility

Determine mathematically sound WIP limits for each board column by applying Little's Law, analyzing team capacity constraints, and incorporating historical cycle time distributions. The goal is to find the lowest sustainable WIP that maximizes flow efficiency — reducing multitasking waste while preventing starvation of downstream stages.

### Process

1. **Collect baseline data.** Gather historical cycle time, throughput (items/week), and WIP snapshots for the last 8–12 weeks. If no historical data exists, use team size × 1.5 as the starting system-wide WIP limit and flag for re-calibration after 4 weeks of operation.
2. **Apply Little's Law.** Calculate the relationship: Average Lead Time = Average WIP ÷ Average Throughput. Determine the current state — if lead time exceeds the team's service-level expectation, the system is overloaded and WIP must decrease.
3. **Model capacity per stage.** For each column, identify the number of people who work that stage, their average availability (accounting for meetings, support rotation, context-switching tax), and the stage's processing time distribution (P50, P85, P95).
4. **Calculate column-level limits.** Set each column's WIP limit to: effective workers × (1 + buffer factor), where buffer factor is 0.0–0.5 depending on variability. High-variability stages (e.g., code review with external dependencies) get higher buffers; low-variability stages get tighter limits.
5. **Run sensitivity analysis.** Model 3 scenarios — tight (buffer = 0.0), balanced (buffer = 0.25), and loose (buffer = 0.5). For each, predict lead time, throughput, and idle-time percentage using queuing theory approximations. Recommend the balanced scenario unless data indicates otherwise.
6. **Define adjustment triggers.** Establish thresholds that signal when WIP limits need re-calibration: cycle time P85 exceeds SLE by >20%, throughput drops >15% for 2 consecutive weeks, or blocker rate exceeds 25% of active items.
7. **Deliver calibration report.** Output a per-column WIP limit table with rationale, the Little's Law calculation chain, sensitivity analysis results, and a re-calibration schedule (typically every 4–6 weeks or after team composition changes).

### Output Format

- **WIP Limit Table** — Column name, recommended WIP limit, effective workers, buffer factor, and rationale for each stage.
- **Little's Law Analysis** — Current state calculation (WIP ÷ Throughput = Lead Time) with target state after WIP reduction, including predicted improvement percentage.
- **Sensitivity Report** — Three-scenario comparison (tight/balanced/loose) with predicted lead time, throughput, and idle-time trade-offs.

