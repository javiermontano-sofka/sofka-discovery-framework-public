# Use-Case Prompts — Jira Configuration

## Prompt 1: New Project Jira Setup

**When**: Setting up Jira for a new project with defined methodology.

**Context variables**:
- `{PROJECT_NAME}`: Project name
- `{METHODOLOGY}`: Scrum/Kanban/Hybrid/SAFe
- `{TEAM_COUNT}`: Number of teams
- `{INTEGRATIONS}`: Required tool integrations

**Deliver**:
> "Configure Jira for {PROJECT_NAME} using {METHODOLOGY} with {TEAM_COUNT} teams. Include project structure, issue type hierarchy, workflow design, board configuration, field schemes, automation rules, dashboards, and permission scheme. Integration with {INTEGRATIONS}. Provide step-by-step setup guide."

## Prompt 2: Jira Workflow Optimization

**When**: Existing Jira workflows need improvement based on team feedback.

**Context variables**:
- `{CURRENT_WORKFLOW}`: Current workflow description
- `{PAIN_POINTS}`: Known workflow issues
- `{TEAM_FEEDBACK}`: Team survey results

**Deliver**:
> "Optimize Jira workflows. Current: {CURRENT_WORKFLOW}. Pain points: {PAIN_POINTS}. Feedback: {TEAM_FEEDBACK}. Analyze bottlenecks using cumulative flow data, propose simplified workflow, define transition rules and validations, and create automation rules to enforce process quality."

## Prompt 3: Portfolio-Level Jira Configuration

**When**: Configuring Jira for multi-project portfolio management.

**Context variables**:
- `{PORTFOLIO_SIZE}`: Number of projects
- `{REPORTING_NEEDS}`: Executive reporting requirements
- `{GOVERNANCE_MODEL}`: PMO governance structure

**Deliver**:
> "Configure Jira for portfolio management across {PORTFOLIO_SIZE} projects. Reporting needs: {REPORTING_NEEDS}. Governance: {GOVERNANCE_MODEL}. Include cross-project dashboards, portfolio-level issue types, aggregated reporting, capacity views, and dependency tracking. Use Jira Align if applicable."

*PMO-APEX v1.0 — Use-Case Prompts · Jira Configuration*
