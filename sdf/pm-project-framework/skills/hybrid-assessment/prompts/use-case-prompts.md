# Use-Case Prompts — Hybrid Assessment

## Prompt 1: Organization-Wide Methodology Assessment

**When**: PMO needs to assess hybrid readiness across the entire organization.

**Context variables**:
- `{ORG_NAME}`: Organization name
- `{DEPARTMENT_COUNT}`: Number of departments to assess
- `{CURRENT_METHODOLOGY}`: Current dominant methodology

**Deliver**:
> "Conduct a hybrid assessment for {ORG_NAME} across {DEPARTMENT_COUNT} departments currently using {CURRENT_METHODOLOGY}. Assess each dimension (culture, maturity, requirements clarity, technical complexity, regulatory, stakeholder). Produce radar charts per department and an aggregate recommendation with transition roadmap."

## Prompt 2: Project-Level Methodology Selection

**When**: A new project needs to determine its optimal methodology mix.

**Context variables**:
- `{PROJECT_NAME}`: Project name
- `{PROJECT_TYPE}`: Type (software, infrastructure, transformation)
- `{TEAM_EXPERIENCE}`: Team's agile/predictive experience

**Deliver**:
> "Assess {PROJECT_NAME} ({PROJECT_TYPE}) for methodology selection. Team experience: {TEAM_EXPERIENCE}. Apply the Stacey Matrix and PRINCE2 Agilometer. Recommend specific hybrid configuration: which phases predictive, which adaptive, governance overlay, and tooling requirements."

## Prompt 3: Post-Implementation Assessment

**When**: Evaluating hybrid methodology effectiveness after 3-6 months of use.

**Context variables**:
- `{PROJECT_NAME}`: Project being assessed
- `{DURATION}`: Time since hybrid adoption
- `{METRICS}`: Available flow/delivery metrics

**Deliver**:
> "Assess hybrid methodology effectiveness for {PROJECT_NAME} after {DURATION}. Available metrics: {METRICS}. Compare predicted vs. actual methodology fit. Identify what worked, what didn't, and recommend calibration adjustments for the next quarter."

*PMO-APEX v1.0 — Use-Case Prompts · Hybrid Assessment*
