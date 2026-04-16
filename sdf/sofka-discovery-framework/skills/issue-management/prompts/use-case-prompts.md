# Use-Case Prompts — Issue Management

## Prompt 1: Issue Register Setup

**When**: Establishing issue management process for a new project.

**Context variables**:
- `{PROJECT_NAME}`: Project name
- `{TEAM_SIZE}`: Number of team members
- `{GOVERNANCE_LEVEL}`: Light/Standard/Heavy governance

**Deliver**:
> "Set up an issue management process for {PROJECT_NAME} with {TEAM_SIZE} team members under {GOVERNANCE_LEVEL} governance. Include issue register template, classification taxonomy, prioritization matrix, escalation protocol with SLAs, review cadence, and tooling recommendations."

## Prompt 2: Issue Triage and Root Cause Analysis

**When**: A critical issue needs rapid assessment and action planning.

**Context variables**:
- `{ISSUE_DESCRIPTION}`: Description of the issue
- `{IMPACT}`: Known impact on project objectives
- `{TIMELINE}`: When the issue was detected

**Deliver**:
> "Triage this critical issue: {ISSUE_DESCRIPTION}. Known impact: {IMPACT}. Detected: {TIMELINE}. Perform rapid root cause analysis (5 Whys + Fishbone), classify and prioritize, identify immediate containment actions, develop resolution plan with timeline, and draft stakeholder communication."

## Prompt 3: Issue Portfolio Analysis

**When**: Reviewing accumulated issues for patterns and systemic problems.

**Context variables**:
- `{ISSUE_COUNT}`: Number of open issues
- `{TIME_PERIOD}`: Analysis period
- `{PROJECT_PHASE}`: Current project phase

**Deliver**:
> "Analyze {ISSUE_COUNT} open issues from {TIME_PERIOD} in {PROJECT_PHASE}. Identify patterns by category, root cause clusters, resolution time trends, and escalation effectiveness. Recommend systemic improvements to prevent recurring issue types. Include Pareto analysis and trend charts."

*PMO-APEX v1.0 — Use-Case Prompts · Issue Management*
