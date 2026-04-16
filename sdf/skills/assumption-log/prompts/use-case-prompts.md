# Use-Case Prompts — Assumption Log

## Prompt 1: Initial Assumption Extraction

**When**: Project kickoff or Sprint 0.

**Context variables**:
- `{project_charter}` — Project charter document
- `{stakeholder_list}` — Key stakeholders and roles

**Deliver**:
> Analyze `{project_charter}` and extract all implicit and explicit assumptions. For each, classify by category (Technical/Resource/Business/Financial/Organizational/External), assign impact and probability scores, and suggest a validation method with target date. Output as a structured assumption log table.

## Prompt 2: Pre-Mortem Assumption Discovery

**When**: Risk planning workshop or phase gate preparation.

**Context variables**:
- `{project_name}` — Project name
- `{key_milestones}` — Upcoming milestones and dates
- `{team_composition}` — Team roles and availability

**Deliver**:
> Conduct a pre-mortem analysis for `{project_name}`. Imagine the project has failed at each of `{key_milestones}`. For each failure scenario, identify 3-5 assumptions that would need to be false for failure to occur. Prioritize by combined impact-probability score and create validation tasks.

## Prompt 3: Assumption Validation Review

**When**: Weekly assumption review or pre-gate checkpoint.

**Context variables**:
- `{assumption_log}` — Current assumption log with status
- `{new_evidence}` — Recent project data and stakeholder feedback

**Deliver**:
> Review `{assumption_log}` against `{new_evidence}`. For each open assumption, determine if new evidence validates, invalidates, or is inconclusive. For invalidated assumptions, draft risk register entries with recommended responses. For overdue validations, escalate with owner notification.

## Prompt 4: Assumption Impact Cascade Analysis

**When**: When a critical assumption is invalidated.

**Context variables**:
- `{invalidated_assumption}` — The assumption proven false
- `{project_plan}` — Current project plan and schedule

**Deliver**:
> Analyze the cascade impact of `{invalidated_assumption}` being false on `{project_plan}`. Map affected deliverables, schedule impacts, resource implications, and budget consequences. Recommend scope, schedule, or resource adjustments with effort estimates in sprints.

*PMO-APEX v1.0 — Use-Case Prompts · Assumption Log*
