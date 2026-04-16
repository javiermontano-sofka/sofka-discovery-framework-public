# Use-Case Prompts — Project Orchestrator

## Prompt 1: Multi-Team Coordination Design

**When:** Setting up orchestration for a project with 3+ teams
**Context variables:** `{project_name}`, `{teams}`, `{dependencies}`, `{tools}`
**Deliver:**

```
Design an orchestration framework for {project_name}:
Teams: {teams}
Dependencies: {dependencies}
Tools in use: {tools}
Include: ceremony calendar, communication matrix, escalation paths, dependency board design, and automation opportunities. Output as actionable Markdown with Mermaid diagrams.
```

## Prompt 2: Flow Optimization Analysis

**When:** Cycle times are increasing or throughput is declining
**Context variables:** `{project_name}`, `{cycle_time_data}`, `{wip_data}`, `{bottlenecks}`
**Deliver:**

```
Analyze and optimize project flow for {project_name}:
Cycle time data: {cycle_time_data}
WIP data: {wip_data}
Known bottlenecks: {bottlenecks}
Produce: flow efficiency calculation, bottleneck analysis, WIP limit recommendations, and re-orchestration plan with expected improvement percentages.
```

## Prompt 3: Orchestration Automation Blueprint

**When:** Moving from manual to automated orchestration
**Context variables:** `{current_process}`, `{tools_available}`, `{team_maturity}`
**Deliver:**

```
Create an automation blueprint for project orchestration:
Current manual processes: {current_process}
Available tools: {tools_available}
Team automation maturity: {team_maturity}
Design automation rules for: notifications, handoffs, status aggregation, escalations, and reporting. Include implementation priority and effort estimates in story points.
```

*PMO-APEX v1.0 — Use-Case Prompts · Project Orchestrator*
