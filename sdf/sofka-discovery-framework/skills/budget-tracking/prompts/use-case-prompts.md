# Use-Case Prompts — Budget Tracking

## Prompt 1: Sprint Budget Review

**When**: End of each sprint.

**Context variables**:
- `{sprint_number}` — Current sprint
- `{planned_cost}` — Planned budget for this sprint
- `{actual_cost}` — Actual expenditure
- `{earned_value}` — Value of completed work

**Deliver**:
> Generate sprint budget review for Sprint `{sprint_number}`. Calculate CV, CPI, and SPI. Compare `{actual_cost}` against `{planned_cost}`. Compute EAC using CPI trend. If CPI < 0.95, provide root cause analysis and corrective action recommendations with effort in sprints.

## Prompt 2: Budget Health Dashboard

**When**: Steering committee or sponsor update.

**Context variables**:
- `{project_name}` — Project name
- `{baseline}` — Approved budget baseline
- `{actuals_to_date}` — Cumulative actual costs

**Deliver**:
> Create executive budget health dashboard for `{project_name}`. Show S-curve (baseline vs. actual), CPI trend chart, EAC projection with confidence interval, and top 3 variance drivers. Use RAG status for overall budget health. Include 3-month forecast.

## Prompt 3: Variance Investigation

**When**: Budget variance exceeds threshold (>10%).

**Context variables**:
- `{variance_amount}` — Variance in FTE-months
- `{work_packages}` — Affected work packages
- `{root_causes}` — Suspected causes

**Deliver**:
> Investigate budget variance of `{variance_amount}` across `{work_packages}`. Perform root cause analysis using 5-Why technique. Classify causes as: estimation error, scope change, efficiency issue, or external factor. Recommend corrective actions with cost-benefit analysis.

*PMO-APEX v1.0 — Use-Case Prompts · Budget Tracking*
