# Use-Case Prompts — Capacity Planning

## Prompt 1: Sprint Capacity Calculation

**When**: Sprint planning preparation.

**Context variables**:
- `{team_members}` — Team roster with availability
- `{sprint_length}` — Sprint duration in days
- `{velocity_history}` — Last 3 sprints velocity

**Deliver**:
> Calculate sprint capacity for `{team_members}` over `{sprint_length}` days. Account for PTO, meeting overhead (20%), and focus factor. Compare calculated capacity against `{velocity_history}` average. Recommend story point commitment with confidence interval.

## Prompt 2: Quarterly Capacity Forecast

**When**: PI planning or quarterly roadmap planning.

**Context variables**:
- `{team_composition}` — Current team and planned changes
- `{demand_backlog}` — Prioritized feature backlog
- `{hiring_pipeline}` — Expected new hires and start dates

**Deliver**:
> Forecast capacity for next quarter considering `{team_composition}`, `{hiring_pipeline}` (with ramp-up penalty), and known absences. Map against `{demand_backlog}` to identify: achievable scope, resource gaps by skill, and recommended trade-offs.

## Prompt 3: Multi-Project Allocation Optimization

**When**: Resource conflicts across projects.

**Context variables**:
- `{projects}` — Active projects with priority and resource needs
- `{available_resources}` — Team members with skills and current allocation

**Deliver**:
> Optimize resource allocation across `{projects}` using `{available_resources}`. Minimize context-switching cost. Flag over-allocated individuals (>100%) and under-allocated skills. Produce allocation matrix and Gantt view of resource assignments.

*PMO-APEX v1.0 — Use-Case Prompts · Capacity Planning*
