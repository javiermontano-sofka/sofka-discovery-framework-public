# Use-Case Prompts — Risk Appetite Framework

## Prompt 1: Risk Appetite Statement Development

**When:** Establishing organizational or project risk boundaries
**Context variables:** `{organization}`, `{strategic_objectives}`, `{risk_categories}`, `{stakeholders}`
**Deliver:**

```
Develop a risk appetite statement for {organization}: Objectives: {strategic_objectives}, Categories: {risk_categories}, Stakeholders: {stakeholders}. Define appetite level per category, quantified tolerance ranges, escalation thresholds, and governance structure. Include risk appetite heat map (Mermaid).
```

## Prompt 2: Project Risk Threshold Cascading

**When:** Translating organizational appetite into project-specific thresholds
**Context variables:** `{org_appetite}`, `{project_name}`, `{project_type}`, `{strategic_importance}`
**Deliver:**

```
Cascade organizational risk appetite to project thresholds: Org appetite: {org_appetite}, Project: {project_name}, Type: {project_type}, Importance: {strategic_importance}. Define project-specific thresholds for schedule, budget, scope, quality, and stakeholder dimensions. Include escalation matrix.
```

## Prompt 3: Risk Appetite Review

**When:** Periodic reassessment of risk appetite alignment
**Context variables:** `{current_appetite}`, `{portfolio_performance}`, `{market_conditions}`, `{incidents}`
**Deliver:**

```
Review and update risk appetite framework: Current: {current_appetite}, Portfolio performance: {portfolio_performance}, Market: {market_conditions}, Recent incidents: {incidents}. Assess if current appetite is appropriate, recommend adjustments, and document rationale for changes.
```

*PMO-APEX v1.0 — Use-Case Prompts · Risk Appetite Framework*
