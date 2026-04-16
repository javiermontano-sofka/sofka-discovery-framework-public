# Use-Case Prompts — Kanban Assessment

## Prompt 1: Team Kanban Health Check

**When**: Evaluating a single team's Kanban implementation quality.

**Context variables**:
- `{TEAM_NAME}`: Team being assessed
- `{KANBAN_DURATION}`: How long team has used Kanban
- `{AVAILABLE_METRICS}`: Flow metrics available

**Deliver**:
> "Conduct a Kanban health check for {TEAM_NAME} using Kanban for {KANBAN_DURATION}. Available metrics: {AVAILABLE_METRICS}. Assess all 6 Kanban practices, score against the KMM, identify top 3 improvement areas, and create a 90-day improvement roadmap with measurable targets."

## Prompt 2: Multi-Team Kanban Maturity Comparison

**When**: Comparing Kanban maturity across multiple teams for standardization.

**Context variables**:
- `{TEAM_LIST}`: Teams to compare
- `{STANDARD_TARGET}`: Target maturity level
- `{CONSTRAINTS}`: Organizational constraints

**Deliver**:
> "Compare Kanban maturity across {TEAM_LIST} against target level {STANDARD_TARGET}. Constraints: {CONSTRAINTS}. Produce comparative radar charts, identify best practices to share, common weaknesses to address, and a consolidated improvement plan."

## Prompt 3: Flow Metric Deep Dive

**When**: Analyzing flow metrics to identify systemic bottlenecks and improvement opportunities.

**Context variables**:
- `{METRICS_DATA}`: Historical flow metric data
- `{TIME_PERIOD}`: Analysis period
- `{KNOWN_ISSUES}`: Known process pain points

**Deliver**:
> "Perform a flow metric deep dive using {METRICS_DATA} from {TIME_PERIOD}. Known issues: {KNOWN_ISSUES}. Analyze cycle time distribution, throughput trends, WIP aging, flow efficiency, and blocker patterns. Identify root causes for flow disruptions and recommend specific improvements with expected impact."

*PMO-APEX v1.0 — Use-Case Prompts · Kanban Assessment*
