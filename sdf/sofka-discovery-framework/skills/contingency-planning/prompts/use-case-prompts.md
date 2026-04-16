# Use-Case Prompts — Contingency Planning

## Prompt 1: Contingency Plan Development
**When**: Post risk identification, need actionable response plans.
**Context variables**: `{risk_register}`, `{project_baselines}`, `{budget_reserves}`
**Deliver**:
> For top 10 risks in `{risk_register}`, develop contingency plans. Each plan: trigger condition, response actions, resource needs, decision authority, communication protocol, and success criteria. Calculate total contingency reserve needed.

## Prompt 2: Pre-Mortem Contingency Workshop
**When**: Project kickoff or phase gate.
**Context variables**: `{project_plan}`, `{key_milestones}`, `{team_composition}`
**Deliver**:
> Facilitate pre-mortem analysis imagining `{project_plan}` has failed at each of `{key_milestones}`. For each failure scenario, generate contingency plan with trigger, actions, and reserve allocation.

## Prompt 3: Contingency Activation Decision
**When**: Risk trigger approaching or breached.
**Context variables**: `{triggered_risk}`, `{contingency_plan}`, `{current_project_state}`
**Deliver**:
> Evaluate whether to activate contingency for `{triggered_risk}`. Assess current impact, plan readiness, and resource availability. Recommend: activate, wait, or modify the plan.

*PMO-APEX v1.0 — Use-Case Prompts · Contingency Planning*
