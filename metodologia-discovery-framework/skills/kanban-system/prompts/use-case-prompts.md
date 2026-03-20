# Use-Case Prompts — Kanban System

## Prompt 1: Team Kanban System Design

**When**: Designing a new Kanban system for a delivery team.

**Context variables**:
- `{TEAM_NAME}`: Team name
- `{WORK_TYPES}`: Types of work items (features, bugs, support)
- `{TEAM_SIZE}`: Number of team members
- `{CURRENT_PROCESS}`: Current workflow description

**Deliver**:
> "Design a Kanban system for {TEAM_NAME} ({TEAM_SIZE} members) handling {WORK_TYPES}. Current process: {CURRENT_PROCESS}. Include board layout with columns and swimlanes, WIP limits with rationale, classes of service, pull policies, cadence calendar, and initial metrics dashboard."

## Prompt 2: Portfolio Kanban Implementation

**When**: Implementing Kanban at the portfolio level for strategic initiative management.

**Context variables**:
- `{PORTFOLIO_SIZE}`: Number of initiatives
- `{DECISION_CADENCE}`: How often strategic decisions are made
- `{CAPACITY}`: Available delivery capacity

**Deliver**:
> "Implement a portfolio Kanban system for {PORTFOLIO_SIZE} strategic initiatives. Decision cadence: {DECISION_CADENCE}. Capacity: {CAPACITY}. Design a Flight Levels-compatible board, define portfolio WIP limits, create investment allocation policies, and establish service-level expectations per initiative class."

## Prompt 3: Kanban System Optimization

**When**: Improving an existing Kanban system based on flow metric analysis.

**Context variables**:
- `{CURRENT_METRICS}`: Current flow metrics
- `{PAIN_POINTS}`: Known flow issues
- `{IMPROVEMENT_GOALS}`: Specific targets

**Deliver**:
> "Optimize the existing Kanban system. Current metrics: {CURRENT_METRICS}. Pain points: {PAIN_POINTS}. Goals: {IMPROVEMENT_GOALS}. Analyze flow data, propose WIP limit adjustments, policy refinements, board layout changes, and cadence improvements. Include expected metric improvements with confidence levels."

*PMO-APEX v1.0 — Use-Case Prompts · Kanban System*
