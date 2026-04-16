# Use-Case Prompts — Program Management

## Prompt 1: Program Charter Development

**When:** Initiating a new program with 3+ related projects
**Context variables:** `{program_name}`, `{strategic_objectives}`, `{component_projects}`, `{sponsor}`
**Deliver:**

```
You are a Program Management expert. Create a program charter for {program_name} that:
1. Articulates the program vision aligned to {strategic_objectives}
2. Maps component projects: {component_projects}
3. Defines governance structure with {sponsor} as executive sponsor
4. Establishes benefit targets with measurable KPIs
5. Identifies program-level risks and interdependencies
Include a benefits dependency network (Mermaid) and RACI matrix.
Tag all claims with [PLAN], [METRIC], or [STAKEHOLDER].
```

## Prompt 2: Cross-Project Dependency Resolution

**When:** Multiple projects have blocking interdependencies
**Context variables:** `{projects_list}`, `{dependency_conflicts}`, `{deadline}`
**Deliver:**

```
Analyze the following cross-project dependencies and conflicts:
Projects: {projects_list}
Conflicts: {dependency_conflicts}
Hard deadline: {deadline}
Produce:
1. Dependency graph (Mermaid) showing critical path
2. Resolution options ranked by impact and feasibility
3. Resource reallocation recommendations
4. Risk-adjusted timeline with buffers
Use evidence tags throughout. Flag any [SUPUESTO] items.
```

## Prompt 3: Benefit Realization Assessment

**When:** Mid-program review to assess value delivery
**Context variables:** `{program_name}`, `{planned_benefits}`, `{actual_metrics}`, `{remaining_timeline}`
**Deliver:**

```
Conduct a benefit realization assessment for {program_name}:
Planned benefits: {planned_benefits}
Actual metrics to date: {actual_metrics}
Remaining timeline: {remaining_timeline}
Deliver:
1. Benefit Realization Index (BRI) calculation
2. Variance analysis per benefit category
3. Forecast to completion with confidence intervals
4. Corrective actions for underperforming benefits
5. Stakeholder communication recommendations
```

## Prompt 4: Program Health Dashboard

**When:** Periodic program status reporting to steering committee
**Context variables:** `{program_name}`, `{component_status}`, `{risks}`, `{budget_data}`
**Deliver:**

```
Generate a program health dashboard for {program_name}:
Component project status: {component_status}
Active risks: {risks}
Budget data: {budget_data}
Include:
1. RAG status for each component project
2. Aggregated schedule performance index
3. Top 5 risks with mitigation status
4. Budget burn-down chart data
5. Key decisions needed from Program Board
Format as executive-ready Markdown with tables and Mermaid charts.
```

*PMO-APEX v1.0 — Use-Case Prompts · Program Management*
