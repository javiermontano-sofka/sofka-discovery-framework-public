# Use-Case Prompts — Benefits Realization Plan

## Prompt 1: Benefits Identification Workshop

**When**: Project initiation or business case development.

**Context variables**:
- `{business_case}` — Business case document
- `{strategic_objectives}` — Organizational strategic objectives
- `{stakeholders}` — Key benefit owners

**Deliver**:
> Analyze `{business_case}` against `{strategic_objectives}` to identify all expected benefits. For each benefit, create a profile: category, description, KPI, baseline, target, measurement method, owner, and realization timeline. Produce a benefits map connecting deliverables to outcomes to strategic objectives.

## Prompt 2: Benefits Tracking Dashboard Design

**When**: Benefits measurement framework needs operationalization.

**Context variables**:
- `{benefits_register}` — List of identified benefits with KPIs
- `{data_sources}` — Available data systems for measurement

**Deliver**:
> Design a benefits tracking dashboard for `{benefits_register}` using `{data_sources}`. Define data collection frequency, visualization type per KPI, alert thresholds for at-risk benefits, and reporting cadence. Include Mermaid diagram of data flow.

## Prompt 3: Post-Project Benefits Review

**When**: 3-6 months after project delivery.

**Context variables**:
- `{planned_benefits}` — Original benefits register with targets
- `{actual_outcomes}` — Measured outcomes post-delivery

**Deliver**:
> Compare `{planned_benefits}` against `{actual_outcomes}`. Calculate realization percentage per benefit. Identify root causes for unrealized benefits. Recommend corrective actions and document lessons for future benefits planning.

*PMO-APEX v1.0 — Use-Case Prompts · Benefits Realization Plan*
