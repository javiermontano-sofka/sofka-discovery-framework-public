# Use-Case Prompts — Risk Response Planning

## Prompt 1: Risk Response Strategy Design

**When:** Developing response strategies for identified risks
**Context variables:** `{risk_register}`, `{risk_appetite}`, `{available_budget}`, `{project_constraints}`
**Deliver:**

```
Design risk response strategies for: Risks: {risk_register}, Appetite: {risk_appetite}, Budget: {available_budget}, Constraints: {project_constraints}. For each risk: select strategy (avoid/transfer/mitigate/accept), define specific actions with owners and deadlines, estimate residual risk, and plan contingency fallback. Include response effectiveness prediction.
```

## Prompt 2: Contingency Plan Development

**When:** Critical risks need detailed fallback plans
**Context variables:** `{critical_risks}`, `{trigger_conditions}`, `{available_reserves}`
**Deliver:**

```
Develop contingency plans for critical risks: Risks: {critical_risks}, Triggers: {trigger_conditions}, Reserves: {available_reserves}. For each: define trigger criteria, step-by-step contingency actions, resource requirements, communication protocol, and success criteria for contingency resolution.
```

## Prompt 3: Response Effectiveness Review

**When:** Assessing whether planned responses are working
**Context variables:** `{planned_responses}`, `{current_risk_status}`, `{actions_completed}`
**Deliver:**

```
Evaluate risk response effectiveness: Planned: {planned_responses}, Current status: {current_risk_status}, Completed actions: {actions_completed}. Assess: risk exposure reduction achieved, response implementation timeliness, residual risk vs. planned, and recommendations for response adjustments.
```

*PMO-APEX v1.0 — Use-Case Prompts · Risk Response Planning*
