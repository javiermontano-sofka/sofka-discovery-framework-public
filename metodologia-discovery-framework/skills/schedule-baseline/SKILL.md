---
name: apex-schedule-baseline
description: >
  Use when the user asks to "create a schedule", "build a Gantt chart", "define critical path",
  "plan milestones", "establish timeline", "estimate durations with PERT",
  or mentions scheduling, dependencies, float, lead/lag, fast-tracking,
  crashing, schedule baseline, 3-point estimation.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Schedule Baseline & Critical Path

**TL;DR**: Produces a comprehensive schedule baseline including activity sequencing, duration estimation (3-point), critical path analysis, milestone chart, and Gantt visualization in Mermaid. Identifies float, near-critical paths, and schedule risks. Serves as the time baseline for Earned Value Management.

## Principio Rector
El cronograma es una hipótesis verificable, no una promesa. La ruta crítica revela las actividades que determinan la duración del proyecto — todo lo demás es gestión de holgura. Un buen cronograma distingue entre lo que DEBE hacerse en secuencia y lo que PUEDE hacerse en paralelo.

## Assumptions & Limits
- Assumes WBS with work packages exists from `scope-wbs` [PLAN]
- Assumes resource availability information is at least partially known [SUPUESTO]
- Breaks when WBS is incomplete — schedule built on incomplete scope will miss activities
- Does not allocate specific people; schedules roles. Use `resource-plan` for staffing
- Assumes organizational calendar (holidays, blackout periods) is provided [SUPUESTO]
- Limited to deterministic CPM + PERT estimation; for probabilistic scheduling use `risk-quantification`

## Usage

```bash
# Full schedule baseline from WBS
/pm:schedule-baseline $ARGUMENTS="--wbs wbs.md --calendar org-calendar.md"

# Critical path analysis only
/pm:schedule-baseline --type critical-path --schedule existing-schedule.md

# Schedule compression analysis
/pm:schedule-baseline --type compression --deadline 2026-09-30 --options "fast-track,crash"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to WBS and organizational calendar |
| `--type` | No | `full` (default), `critical-path`, `compression`, `milestone` |
| `--calendar` | No | Path to organizational calendar |
| `--deadline` | No | Hard deadline constraint |
| `--options` | No | Compression options to evaluate |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Sprint-based milestones overlaid on release plan; rolling-wave detail; velocity-driven forecasting
- **Waterfall**: Critical path method with phase gates, Gantt baselines, and formal change control on schedule variances
- **SAFe**: PI cadence (8-12 weeks) with iteration boundaries; program milestones aligned to ART sync points
- **Kanban**: No fixed schedule baseline; Monte Carlo forecasting on cycle time distributions for delivery date predictions
- **Hybrid**: Stage-gate milestones at macro level with sprint cadence within phases; dual tracking of planned vs. iterative dates
- **Recovery**: Compressed schedule with fast-tracking and crashing; milestone triage to identify minimum viable scope per deadline

## Before Scheduling
1. **Read** the approved WBS to extract work packages for activity definition [PLAN]
2. **Read** resource availability data to inform duration estimates [SCHEDULE]
3. **Glob** `**/calendar*` to find organizational calendar and blackout periods [SCHEDULE]
4. **Grep** for hard deadline constraints in the project charter [PLAN]

## Entrada (Input Requirements)
- Approved WBS with work packages (from `scope-wbs`)
- Resource availability information (from `resource-plan` if available)
- Organizational calendar (holidays, blackout periods)
- Historical duration data (if available)
- Hard deadline constraints from charter

## Proceso (Protocol)
1. **Activity definition** — Derive activities from WBS work packages
2. **Sequence activities** — Establish dependencies (FS, FF, SS, SF) with lead/lag
3. **Estimate durations** — Use 3-point estimation (Optimistic, Most Likely, Pessimistic) for PERT
4. **Build network diagram** — Create precedence diagram (PDM) in Mermaid
5. **Calculate critical path** — Identify CP using forward/backward pass
6. **Identify float** — Calculate total float and free float for non-critical activities
7. **Set milestones** — Define key decision points and deliverable dates
8. **Generate Gantt** — Create Mermaid Gantt chart with phases, activities, and milestones
9. **Schedule risk analysis** — Identify near-critical paths (float < 5 days) and schedule risks
10. **Establish baseline** — Lock schedule baseline for EVM tracking

## Edge Cases
1. **Critical path exceeds deadline** — Present compression options: fast-tracking (parallel activities) or crashing (add resources). Quantify cost and risk of each option [SCHEDULE].
2. **Multiple near-critical paths (float <5 days)** — Flag as high schedule risk. Any delay on near-critical activities could create a new critical path. Recommend monitoring all paths [SCHEDULE].
3. **External dependency with unconfirmed dates** — Include in schedule with [SUPUESTO] tag and buffer. Establish date confirmation deadline with external party [SUPUESTO].
4. **Agile project requiring schedule baseline** — Use rolling-wave: detail for next 2 PIs, milestones for remainder. Schedule evolves with backlog refinement [PLAN].

## Example: Good vs Bad

**Good example — Rigorous schedule baseline:**

| Attribute | Value |
|-----------|-------|
| Activities | 45 activities derived from WBS with dependencies |
| Estimation | 3-point estimates for all activities (PERT calculated) |
| Critical path | Identified with 12 activities, 87 days duration |
| Float analysis | Total float calculated for all activities |
| Near-critical | 2 near-critical paths (float <5 days) flagged |
| Milestones | 7 milestones with decision points |

**Bad example — Wish-list schedule:**
Activity list with no dependencies, single-point duration estimates ("it will take 2 weeks"), no critical path analysis, and no milestones. Without dependencies, there is no critical path. Without 3-point estimates, there is no confidence range. This is a to-do list, not a schedule.

## Salida (Deliverables)
- `01_schedule_baseline_{proyecto}_{WIP}.md` — Schedule with Gantt (Mermaid)
- Critical path analysis with float calculations
- Milestone chart with decision points
- Schedule risk register (near-critical paths, resource conflicts)
- PERT estimates table (O, ML, P, Expected, Std Dev)

## Validation Gate
- [ ] Every WBS work package has ≥1 scheduled activity [PLAN]
- [ ] All activities have 3-point estimates (O, ML, P) [SCHEDULE]
- [ ] Dependencies use correct relationship types (FS, FF, SS, SF) with documented rationale [SCHEDULE]
- [ ] Critical path identified and documented with total duration [SCHEDULE]
- [ ] Total float and free float calculated for non-critical activities [SCHEDULE]
- [ ] ≥5 milestones with target dates defined [SCHEDULE]
- [ ] Near-critical paths (float <5 days) identified and flagged [SCHEDULE]
- [ ] Gantt chart includes phases, activities, dependencies, and milestones [PLAN]
- [ ] Evidence ratio: ≥85% [SCHEDULE]/[PLAN], <15% [SUPUESTO]
- [ ] Schedule aligned with resource availability and organizational calendar [SCHEDULE]

## Escalation Triggers
- Critical path exceeds deadline constraint
- Resource conflicts on critical path activities
- More than 3 near-critical paths identified
- External dependency dates unconfirmed

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | CPM and PERT methodology | `references/body-of-knowledge.md` |
| State of the Art | Agile scheduling and Monte Carlo forecasting | `references/state-of-the-art.md` |
| Knowledge Graph | Schedule in Phase 2 planning | `references/knowledge-graph.mmd` |
| Use Case Prompts | Scheduling scenarios by methodology | `prompts/use-case-prompts.md` |
| Metaprompts | Custom schedule frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference schedule with Gantt | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Activity Sequencer


## Activity Sequencer Agent

### Core Responsibility

Transform the flat list of WBS work packages into a logically sequenced network diagram by identifying mandatory, discretionary, and external dependencies. Every dependency must be typed (FS, FF, SS, SF) and justified, with lead/lag times documented where applicable.

### Process

1. **Import Work Packages.** Receive the WBS dictionary with terminal work packages. Verify each has a unique WBS code, description, and estimated effort.
2. **Identify Mandatory Dependencies.** Determine hard logic — activities that MUST follow a specific sequence due to the nature of the work (e.g., design before build, test after build).
3. **Identify Discretionary Dependencies.** Document soft logic — preferred sequences based on best practices, resource preferences, or risk reduction, marking them as adjustable for fast-tracking.
4. **Identify External Dependencies.** Flag activities dependent on external parties (vendor deliveries, regulatory approvals, client sign-offs) with expected dates and risk of delay.
5. **Assign Dependency Types.** For each dependency, specify: Finish-to-Start (FS), Finish-to-Finish (FF), Start-to-Start (SS), or Start-to-Finish (SF). Default to FS unless another type is justified.
6. **Define Lead/Lag Times.** Where activities overlap (lead) or have mandatory wait periods (lag), document the duration and rationale. Flag excessive lags (>5 days) for review.
7. **Produce Network Diagram.** Generate a precedence diagram (Mermaid) showing all activities, dependencies, and the resulting network paths from project start to finish.

### Output Format

- **Dependency Register** — Table: Predecessor WBS Code, Successor WBS Code, Type (FS/FF/SS/SF), Lead/Lag, Category (Mandatory/Discretionary/External), Rationale.
- **Network Diagram** — Mermaid flowchart showing activity sequence with dependency types annotated.
- **External Dependency Risk List** — External dependencies with expected dates, risk rating, and contingency plan.

### Critical Path Analyzer


## Critical Path Analyzer Agent

### Core Responsibility

Execute forward and backward pass calculations on the activity network to determine the critical path (longest path, zero float), calculate total and free float for every activity, and identify near-critical paths (float ≤5 days) that represent hidden schedule risk.

### Process

1. **Execute Forward Pass.** Starting from project start (time 0), calculate Early Start (ES) and Early Finish (EF) for every activity. EF = ES + Duration. ES of successor = max(EF of all predecessors) adjusted for leads/lags.
2. **Determine Project Duration.** The maximum EF across all terminal activities equals the minimum project duration. Document this as the baseline duration.
3. **Execute Backward Pass.** Starting from project end, calculate Late Finish (LF) and Late Start (LS) for every activity. LS = LF - Duration. LF of predecessor = min(LS of all successors) adjusted for leads/lags.
4. **Calculate Float.** Total Float = LS - ES (or LF - EF). Free Float = min(ES of successors) - EF. Activities with Total Float = 0 are on the critical path.
5. **Identify Critical Path.** Trace the continuous path of zero-float activities from start to finish. If multiple critical paths exist, document all of them.
6. **Identify Near-Critical Paths.** Flag paths with total float ≤5 working days as near-critical. These are one delay away from becoming the new critical path.
7. **Produce CPM Analysis.** Deliver complete schedule calculations, critical path visualization, float distribution, and recommendations for schedule protection.

### Output Format

- **Schedule Calculation Table** — Table: WBS Code, Activity, Duration, ES, EF, LS, LF, Total Float, Free Float, Critical (Y/N).
- **Critical Path Diagram** — Mermaid Gantt or flowchart highlighting the critical path in red, near-critical in amber.
- **Float Distribution Summary** — Histogram of float values across all activities.
- **Schedule Risk Assessment** — Near-critical paths with probability of becoming critical.

### Gantt Visualizer


## Gantt Visualizer Agent

### Core Responsibility

Transform CPM schedule calculations into clear, publication-ready Gantt chart visualizations using Mermaid syntax. Charts must show activity bars, dependencies, milestones, critical path highlighting, phase groupings, and the current date marker for tracking.

### Process

1. **Receive Schedule Data.** Import the complete schedule calculation table with ES, EF, durations, dependencies, and critical path flags.
2. **Define Phase Groupings.** Organize activities into logical sections (phases, deliverable branches, or WBS Level-1 groups) for visual clarity.
3. **Generate Activity Bars.** Create Mermaid `gantt` bars for each activity with correct start dates and durations. Critical path activities use `crit` modifier.
4. **Add Milestones.** Insert milestone markers at key project checkpoints: phase gates, deliverable acceptance points, external dependency dates, and contractual deadlines.
5. **Apply Visual Standards.** Use APEX branding: critical path in #DC2626 (red), near-critical in #F97316 (orange), milestones in #2563EB (blue). Group labels use #0F172A (dark).
6. **Generate Summary Gantt.** Produce a high-level executive Gantt showing only phases and milestones (no work packages) for stakeholder communication.
7. **Deliver Chart Package.** Produce both detailed (all activities) and summary (phases + milestones) Gantt charts with a legend and reading guide.

### Output Format

- **Detailed Gantt Chart** — Mermaid gantt with all activities, dependencies, critical path, and milestones grouped by phase.
- **Executive Summary Gantt** — Mermaid gantt with phases and milestones only for stakeholder presentations.
- **Milestone Register** — Table: Milestone Name, Date, Type (Phase Gate/Deliverable/External/Contractual), Dependencies.

### Pert Duration Estimator


## PERT Duration Estimator Agent

### Core Responsibility

Transform raw effort estimates into calibrated schedule durations using PERT three-point estimation (Optimistic, Most Likely, Pessimistic). Produce expected durations with standard deviations and confidence intervals that feed into both deterministic CPM and probabilistic schedule risk analysis.

### Process

1. **Collect Effort Estimates.** Receive work package estimates from the WBS (P50, P80, P95 or raw estimates). Map effort to duration using resource assignment assumptions.
2. **Elicit Three-Point Estimates.** For each activity, determine Optimistic (O) — best case with no obstacles, Most Likely (M) — normal conditions, and Pessimistic (P) — worst case without catastrophe.
3. **Calculate PERT Expected Duration.** Apply the PERT formula: tE = (O + 4M + P) / 6. This weighted average accounts for the typical right-skew of duration distributions.
4. **Calculate Standard Deviation.** σ = (P - O) / 6 for each activity. Variance = σ². These feed into project-level confidence calculations.
5. **Determine Confidence Intervals.** For individual activities: P50 = tE, P80 = tE + 0.84σ, P95 = tE + 1.65σ. For project total: aggregate using √(Σvariances) along the critical path.
6. **Flag High-Variance Activities.** Identify activities where (P - O) / M > 1.5 — these have extreme uncertainty and may need decomposition, prototyping, or risk reserves.
7. **Deliver Duration Package.** Produce calibrated durations for CPM input, confidence ranges for risk analysis, and high-variance flags for management attention.

### Output Format

- **PERT Estimation Register** — Table: WBS Code, Activity, O, M, P, tE, σ, Variance, P80 Duration, P95 Duration, High-Variance Flag.
- **Project Confidence Profile** — Aggregate project duration at P50, P80, P95 with critical path variance.
- **High-Variance Activity List** — Activities requiring estimation refinement or risk reserves.

