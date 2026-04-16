# Use-Case Prompts — Schedule Baseline

## Prompt 1: Schedule Development from WBS

**When:** Creating initial schedule from approved WBS
**Context variables:** `{project_name}`, `{wbs}`, `{resources}`, `{constraints}`, `{target_date}`
**Deliver:**

```
Develop a schedule baseline for {project_name}: WBS: {wbs}, Resources: {resources}, Constraints: {constraints}, Target: {target_date}. Include: activity list with dependencies, CPM analysis, critical path identification, resource-leveled Gantt chart (Mermaid), milestone summary, and P50/P80 completion estimates. Tag all estimates with confidence level.
```

## Prompt 2: Schedule Variance Analysis

**When:** Assessing schedule performance against baseline
**Context variables:** `{project_name}`, `{baseline_schedule}`, `{actual_progress}`, `{current_date}`
**Deliver:**

```
Analyze schedule variance for {project_name}: Baseline: {baseline_schedule}, Actual: {actual_progress}, Date: {current_date}. Calculate SPI and SV, identify activities causing delay, assess critical path impact, and recommend corrective actions (fast-track, crash, or re-baseline).
```

## Prompt 3: Schedule Compression

**When:** Need to accelerate delivery without changing scope
**Context variables:** `{current_schedule}`, `{target_acceleration}`, `{available_resources}`, `{risk_tolerance}`
**Deliver:**

```
Compress schedule by {target_acceleration}: Current: {current_schedule}, Additional resources: {available_resources}, Risk tolerance: {risk_tolerance}. Evaluate fast-tracking and crashing options, present trade-offs (cost, risk, quality), and recommend optimal compression strategy.
```

*PMO-APEX v1.0 — Use-Case Prompts · Schedule Baseline*
