# Use-Case Prompts — Governance Framework

## Prompt 1: Enterprise Governance Design

**When**: Establishing governance for a new PMO or organizational transformation.

**Context variables**:
- `{ORG_NAME}`: Organization name
- `{PROJECT_COUNT}`: Number of active projects
- `{MATURITY_LEVEL}`: Current PMO maturity (Ad-hoc/Defined/Managed/Optimized)

**Deliver**:
> "Design a governance framework for {ORG_NAME} managing {PROJECT_COUNT} active projects at {MATURITY_LEVEL} maturity. Include governance tiers (portfolio/program/project), decision rights matrix (RACI+), escalation protocols with tolerance thresholds, meeting cadence, and governance artifacts catalog."

## Prompt 2: Agile Governance Overlay

**When**: Adapting traditional governance for agile/hybrid delivery teams.

**Context variables**:
- `{FRAMEWORK}`: Agile framework in use (Scrum/SAFe/Kanban/Hybrid)
- `{TEAM_COUNT}`: Number of delivery teams
- `{COMPLIANCE_REQUIREMENTS}`: Regulatory constraints

**Deliver**:
> "Create an agile governance overlay for {TEAM_COUNT} teams using {FRAMEWORK}. Must satisfy {COMPLIANCE_REQUIREMENTS}. Include lightweight gate reviews, continuous compliance monitoring, empowered team decision boundaries, and escalation triggers that respect sprint cadence."

## Prompt 3: Governance Health Assessment

**When**: Evaluating effectiveness of existing governance structure.

**Context variables**:
- `{GOVERNANCE_AGE}`: How long current governance has been in place
- `{PAIN_POINTS}`: Known governance issues
- `{STAKEHOLDER_FEEDBACK}`: Summary of stakeholder sentiment

**Deliver**:
> "Assess the governance framework in place for {GOVERNANCE_AGE}. Known pain points: {PAIN_POINTS}. Stakeholder feedback: {STAKEHOLDER_FEEDBACK}. Evaluate against APM governance principles, identify gaps, and recommend improvements with implementation roadmap."

## Prompt 4: Multi-Vendor Governance Model

**When**: Multiple vendors/partners require coordinated governance.

**Context variables**:
- `{VENDOR_COUNT}`: Number of vendors
- `{CONTRACT_TYPE}`: Contract model (T&M/Fixed/Outcome-based)
- `{INTEGRATION_COMPLEXITY}`: Low/Medium/High

**Deliver**:
> "Design a multi-vendor governance model for {VENDOR_COUNT} vendors under {CONTRACT_TYPE} contracts with {INTEGRATION_COMPLEXITY} integration complexity. Include joint governance committee structure, performance measurement framework, dispute resolution process, and integration governance checkpoints."

*PMO-APEX v1.0 — Use-Case Prompts · Governance Framework*
