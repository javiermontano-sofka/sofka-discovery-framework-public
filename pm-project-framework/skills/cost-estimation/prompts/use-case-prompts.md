# Use-Case Prompts — Cost Estimation

## Prompt 1: Bottom-Up Estimation
**When**: Detailed WBS available, need definitive estimate.
**Context variables**: `{wbs}`, `{resource_rates}`, `{complexity_factors}`
**Deliver**:
> Develop bottom-up cost estimate for `{wbs}` using `{resource_rates}`. Apply three-point estimation per work package. Calculate contingency using EMV. Present as estimate range (P50, P80) with confidence assessment.

## Prompt 2: Agile Estimation to Budget
**When**: Converting agile backlog to financial estimates.
**Context variables**: `{backlog}`, `{velocity_history}`, `{team_cost_per_sprint}`
**Deliver**:
> Convert `{backlog}` to FTE-month estimate using `{velocity_history}` and `{team_cost_per_sprint}`. Show estimation method, assumptions, and confidence level. Include sensitivity analysis on velocity variance.

## Prompt 3: Estimation Accuracy Review
**When**: Improving estimation capability through retrospective analysis.
**Context variables**: `{estimated_costs}`, `{actual_costs}`, `{project_history}`
**Deliver**:
> Compare `{estimated_costs}` against `{actual_costs}` across `{project_history}`. Calculate estimation accuracy by method, project type, and team. Identify systematic biases. Recommend calibration factors for future estimates.

*PMO-APEX v1.0 — Use-Case Prompts · Cost Estimation*
