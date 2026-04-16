# Use-Case Prompts — Lessons Register

## Prompt 1: Project Closure Lessons Harvest

**When**: Conducting a comprehensive lessons learned session at project closure.

**Context variables**:
- `{PROJECT_NAME}`: Project name
- `{PROJECT_DURATION}`: Total project duration
- `{KEY_OUTCOMES}`: Summary of project outcomes

**Deliver**:
> "Facilitate a lessons learned harvest for {PROJECT_NAME} ({PROJECT_DURATION}). Outcomes: {KEY_OUTCOMES}. Structure the session to capture lessons across all 7 categories (process, technical, people, estimation, risk, vendor, governance). For each lesson, ensure root cause analysis, actionable recommendations, and applicability tagging."

## Prompt 2: Lessons Register Setup

**When**: Establishing a lessons learned management system for a PMO.

**Context variables**:
- `{ORG_NAME}`: Organization name
- `{PROJECT_COUNT}`: Number of active projects
- `{EXISTING_KNOWLEDGE}`: Current knowledge management state

**Deliver**:
> "Design a lessons register system for {ORG_NAME} managing {PROJECT_COUNT} projects. Current state: {EXISTING_KNOWLEDGE}. Include register template, taxonomy, collection workflows, validation process, storage and search mechanism, dissemination strategy, and application tracking. Recommend tooling."

## Prompt 3: Cross-Project Lesson Mining

**When**: Analyzing lessons across multiple projects to find organizational patterns.

**Context variables**:
- `{PROJECT_SET}`: Projects to analyze
- `{TIME_PERIOD}`: Analysis period
- `{FOCUS_AREA}`: Specific area of interest

**Deliver**:
> "Mine lessons across {PROJECT_SET} from {TIME_PERIOD} focusing on {FOCUS_AREA}. Identify recurring patterns, root cause clusters, and systemic issues. Produce a lessons digest with organizational recommendations, estimated impact of implementing top 5 lessons, and a change management plan for adoption."

*PMO-APEX v1.0 — Use-Case Prompts · Lessons Register*
