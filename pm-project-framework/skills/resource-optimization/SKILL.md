---
name: apex-resource-optimization
description: >
  Use when the user asks to "optimize resources", "level resources",
  "run what-if scenarios", "resolve over-allocations", "balance resource demand",
  or mentions resource leveling, resource smoothing, optimization, what-if analysis,
  resource allocation optimization, capacity balancing.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Resource Optimization & What-If Scenarios

**TL;DR**: Performs resource optimization through leveling and smoothing techniques, resolving over-allocations while minimizing schedule impact. Runs what-if scenarios to evaluate the impact of resource changes (additions, removals, reallocation) on schedule, cost, and quality.

## Principio Rector
Resource leveling intercambia tiempo por recursos; resource smoothing intercambia eficiencia por estabilidad. La elección depende de qué es más escaso: si el deadline es inflexible, suavizar; si los recursos son inflexibles, nivelar. What-if scenarios convierten "qué pasaría si" de especulación en análisis cuantificado.

## Assumptions & Limits
- Assumes resource plan and schedule baseline exist with dependency logic [PLAN]
- Assumes resource availability calendars are current and accurate [SUPUESTO]
- Breaks when no schedule float exists — leveling without float extends the critical path
- Does not create the resource plan; optimizes an existing one. Use `resource-plan` first
- Assumes capacity constraints are hard limits (not negotiable) unless flagged [SUPUESTO]
- Limited to single-project optimization; for cross-project optimization use portfolio-level tools

## Usage

```bash
# Full resource optimization with leveling
/pm:resource-optimization $ARGUMENTS="--schedule schedule.md --resources resource-plan.md"

# What-if scenario comparison
/pm:resource-optimization --type what-if --scenarios "add-dev,delay-phase2,reduce-scope"

# Smoothing only (preserve deadline)
/pm:resource-optimization --type smoothing --deadline 2026-09-30
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to schedule and resource plan |
| `--type` | No | `full` (default), `leveling`, `smoothing`, `what-if` |
| `--scenarios` | No | Comma-separated what-if scenario names |
| `--deadline` | No | Hard deadline for smoothing constraint |
| `--threshold` | No | Max allocation % (default 80%) |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types benefit from optimization. Waterfall uses traditional leveling algorithms; Agile uses velocity-based capacity adjustment; SAFe uses PI-level load balancing; Portfolio uses cross-project resource optimization.

## Before Optimizing
1. **Read** the schedule baseline to understand dependency logic and float [SCHEDULE]
2. **Read** the resource plan to identify current allocations and over-allocations [PLAN]
3. **Glob** `**/resource_calendar*` to verify availability data is current [SCHEDULE]
4. **Grep** for critical path activities to ensure leveling protects them [SCHEDULE]

## Entrada (Input Requirements)
- Resource plan with allocations
- Schedule baseline with dependencies
- Resource availability calendars
- Capacity constraints
- Scenarios to evaluate

## Proceso (Protocol)
1. **Over-allocation detection** — Identify all resources allocated above capacity
2. **Impact assessment** — Evaluate schedule impact of each over-allocation
3. **Leveling application** — Apply resource leveling within float when possible
4. **Smoothing application** — Apply smoothing to reduce allocation peaks
5. **Critical path protection** — Ensure leveling does not extend critical path (unless necessary)
6. **What-if scenario definition** — Define scenarios (add resource, delay start, reduce scope)
7. **Scenario simulation** — Model each scenario's impact on schedule and cost
8. **Comparison analysis** — Compare scenario outcomes side by side
9. **Recommendation** — Recommend optimal resource configuration
10. **Implementation plan** — Plan resource changes with transition timeline

## Edge Cases
1. **Leveling extends critical path beyond deadline** — Present trade-off analysis: accept delay, add resources (fast-tracking), or reduce scope. All three options with impact quantified [SCHEDULE].
2. **What-if scenarios all show negative outcomes** — Recommend scope reduction or phased delivery. Document that current plan is infeasible without changes [PLAN].
3. **Resource shared across projects with conflicting priorities** — Escalate to portfolio level. Document both projects' needs and the impact of each allocation option [STAKEHOLDER].
4. **Seasonal availability changes (holidays, vacations)** — Apply calendar-aware leveling. Ensure resource histograms account for actual working days, not calendar days [SCHEDULE].

## Example: Good vs Bad

**Good example — Quantified optimization:**

| Attribute | Value |
|-----------|-------|
| Over-allocations found | 4 resources at 110-130% |
| Leveling result | 3 resolved within float, 1 requires schedule extension |
| What-if scenarios | 3 scenarios compared with schedule/cost/quality impact |
| Recommendation | Scenario B selected — add 1 FTE for 3 sprints |
| Before/after | Resource histograms showing peak reduction from 130% to 85% |
| Schedule impact | +3 days on non-critical path, critical path preserved |

**Bad example — Manual redistribution:**
"Move some tasks around so nobody is overloaded." No dependency analysis, no float calculation, no impact quantification. Manual redistribution without respecting dependency logic creates impossible schedules.

## Salida (Deliverables)
- Resource optimization report
- Before/after resource histograms
- What-if scenario comparison matrix
- Optimized schedule with resource assignments
- Implementation recommendations

## Validation Gate
- [ ] Every over-allocation identified with specific resource and period [METRIC]
- [ ] Leveling respects dependency logic (no FS violations) [SCHEDULE]
- [ ] Critical path impact quantified (days added or preserved) [SCHEDULE]
- [ ] ≥2 what-if scenarios compared with schedule and cost impact [METRIC]
- [ ] No resource exceeds threshold allocation (default 80%) after optimization [METRIC]
- [ ] Before/after resource histograms provided [PLAN]
- [ ] Recommendation includes implementation timeline [SCHEDULE]
- [ ] Evidence ratio: ≥80% [SCHEDULE]/[METRIC], <20% [SUPUESTO]
- [ ] Float analysis updated post-optimization [SCHEDULE]
- [ ] Scenario comparison includes risk assessment per option [PLAN]

## Escalation Triggers
- Leveling extends critical path beyond deadline
- No feasible optimization without scope reduction
- What-if scenarios all show negative outcomes
- Resource contention between projects unresolvable at team level

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
