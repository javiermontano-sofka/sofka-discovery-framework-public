# Use-Case Prompts — Automation Opportunities

## Prompt 1: Full Automation Assessment

**When**: PMO optimization initiative or digital transformation kickoff.

**Context variables**:
- `{team_workflows}` — List of current PM workflows and tools
- `{pain_points}` — Known bottlenecks and manual overhead areas

**Deliver**:
> Analyze `{team_workflows}` and `{pain_points}` to identify automation opportunities. For each candidate, score on feasibility (1-5), ROI potential (1-5), and risk (1-5). Produce a prioritized automation backlog using WSJF scoring. Include implementation approach (no-code/low-code/custom/RPA) and effort estimate in sprints.

## Prompt 2: Quick-Win Automation Scan

**When**: Sprint retrospective reveals repetitive manual tasks.

**Context variables**:
- `{retro_action_items}` — Retrospective items related to manual overhead
- `{tool_stack}` — Current project tools (Jira, Slack, etc.)

**Deliver**:
> From `{retro_action_items}`, identify tasks automatable within 1 sprint using `{tool_stack}` native capabilities or no-code integrations. For each quick win, provide step-by-step implementation guide, expected time savings per sprint, and rollback plan.

## Prompt 3: ROI Business Case for Automation

**When**: Seeking budget approval for automation investment.

**Context variables**:
- `{automation_candidates}` — Shortlisted automation opportunities
- `{team_size}` — Number of people affected
- `{current_effort}` — Hours spent on manual tasks per sprint

**Deliver**:
> Build a business case for automating `{automation_candidates}`. Calculate FTE-month savings over 12 months, payback period, and net value. Present as executive summary with comparison table and recommendation. Include risk assessment and maintenance cost estimates.

*PMO-APEX v1.0 — Use-Case Prompts · Automation Opportunities*
