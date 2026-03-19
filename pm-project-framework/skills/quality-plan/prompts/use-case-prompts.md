# Use-Case Prompts — Quality Plan

## Prompt 1: Comprehensive Quality Plan

**When:** Starting a new project requiring formal quality planning
**Context variables:** `{project_name}`, `{deliverables}`, `{standards}`, `{team_size}`
**Deliver:**

```
Create a quality plan for {project_name}:
Deliverables: {deliverables}
Applicable standards: {standards}
Team size: {team_size}
Include: quality objectives, standards matrix, quality activities schedule, metrics with thresholds, roles and responsibilities (RACI), tools, and cost of quality estimate. Use [METRIC] and [PLAN] tags.
```

## Prompt 2: Test Strategy Derivation

**When:** Deriving test approach from quality plan
**Context variables:** `{quality_plan}`, `{technology_stack}`, `{risk_profile}`
**Deliver:**

```
Derive a test strategy from this quality plan:
Quality plan: {quality_plan}
Technology: {technology_stack}
Risk profile: {risk_profile}
Map quality objectives to test levels (unit, integration, system, acceptance). Define coverage targets, tool recommendations, and test automation approach.
```

## Prompt 3: Quality Metrics Dashboard Design

**When:** Designing quality monitoring for an active project
**Context variables:** `{project_name}`, `{quality_objectives}`, `{tools_in_use}`
**Deliver:**

```
Design a quality metrics dashboard for {project_name}:
Objectives: {quality_objectives}
Tools: {tools_in_use}
Define: leading and lagging quality indicators, data sources, refresh cadence, thresholds (green/amber/red), and alert rules. Include dashboard wireframe in Mermaid.
```

*PMO-APEX v1.0 — Use-Case Prompts · Quality Plan*
