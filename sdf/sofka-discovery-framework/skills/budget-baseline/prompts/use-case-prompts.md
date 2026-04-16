# Use-Case Prompts — Budget Baseline

## Prompt 1: Bottom-Up Baseline Development

**When**: Detailed WBS available, need comprehensive budget baseline.

**Context variables**:
- `{wbs}` — Work Breakdown Structure with work packages
- `{resource_rates}` — Team resource rates in FTE-months
- `{risk_register}` — Identified risks with probability and impact

**Deliver**:
> Develop a budget baseline for project using `{wbs}`. Apply bottom-up estimation for each work package using `{resource_rates}`. Calculate contingency reserves from `{risk_register}` using expected monetary value. Time-phase against schedule baseline. Produce S-curve visualization and summary table.

## Prompt 2: Agile Rolling-Wave Budget

**When**: Agile project requiring budget governance with flexibility.

**Context variables**:
- `{backlog}` — Product backlog with story point estimates
- `{velocity}` — Historical velocity (story points per sprint)
- `{team_cost}` — Sprint cost in FTE-months

**Deliver**:
> Create a rolling-wave budget baseline for `{backlog}`. Detail next 3 sprints at work-package level. Provide ROM estimates for remaining backlog based on `{velocity}` and `{team_cost}`. Include buffer for backlog growth and technical debt. Show cumulative budget curve.

## Prompt 3: Budget Re-Baseline Analysis

**When**: Significant scope change or variance triggers re-baseline need.

**Context variables**:
- `{current_baseline}` — Current approved baseline
- `{change_requests}` — Approved change requests affecting budget
- `{actual_costs}` — Actual costs to date

**Deliver**:
> Analyze need for re-baseline comparing `{current_baseline}` against `{actual_costs}` and `{change_requests}`. Calculate variance at completion. If variance exceeds 10%, produce new baseline with justification memo for governance board approval. Show old vs. new S-curve overlay.

*PMO-APEX v1.0 — Use-Case Prompts · Budget Baseline*
