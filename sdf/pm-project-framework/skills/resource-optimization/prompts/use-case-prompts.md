# Use-Case Prompts — Resource Optimization

## Prompt 1: Resource Leveling Analysis

**When:** Team is overallocated and schedule needs adjustment
**Context variables:** `{project_name}`, `{resource_assignments}`, `{schedule}`, `{constraints}`
**Deliver:**

```
Perform resource leveling for {project_name}:
Assignments: {resource_assignments}
Schedule: {schedule}
Constraints: {constraints}
Identify overallocations, apply leveling algorithm, produce revised schedule with impact analysis. Show before/after resource histograms. Tag trade-offs with [PLAN] and [SCHEDULE].
```

## Prompt 2: Multi-Project Resource Balancing

**When:** Multiple projects competing for same resources
**Context variables:** `{projects}`, `{shared_resources}`, `{priorities}`, `{timeline}`
**Deliver:**

```
Balance resources across multiple projects:
Projects: {projects}
Shared resources: {shared_resources}
Priority ranking: {priorities}
Timeline: {timeline}
Produce optimized allocation matrix, highlight conflicts, recommend resolution strategies. Include context-switch analysis and utilization targets.
```

## Prompt 3: Capacity Forecast

**When:** Planning resource needs for upcoming quarters
**Context variables:** `{current_capacity}`, `{pipeline_projects}`, `{attrition_forecast}`, `{hiring_plan}`
**Deliver:**

```
Generate a capacity forecast:
Current capacity: {current_capacity}
Pipeline: {pipeline_projects}
Expected attrition: {attrition_forecast}
Hiring plan: {hiring_plan}
Produce quarterly demand vs. supply forecast, gap analysis by skill, and recommendations for bridging gaps (hiring, training, contracting). Include confidence intervals.
```

*PMO-APEX v1.0 — Use-Case Prompts · Resource Optimization*
