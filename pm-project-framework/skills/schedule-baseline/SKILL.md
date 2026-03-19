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
