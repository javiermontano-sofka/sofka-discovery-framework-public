# Use-Case Prompts — Project Health Check

## Prompt 1: Comprehensive Health Assessment

**When:** Quarterly or milestone-based health review
**Context variables:** `{project_name}`, `{current_metrics}`, `{baseline_data}`, `{team_size}`
**Deliver:**

```
Conduct a comprehensive project health check for {project_name}:
Current metrics: {current_metrics}
Baseline: {baseline_data}
Team size: {team_size}
Assess all 6 dimensions: Schedule, Budget, Scope, Quality, Team, Stakeholder.
For each dimension provide: RAG status, evidence, trend direction, corrective actions.
Include a health radar chart (Mermaid) and executive summary dashboard.
Tag all findings with [METRIC], [PLAN], or [SUPUESTO].
```

## Prompt 2: Early Warning Detection

**When:** Proactive check triggered by declining metrics
**Context variables:** `{project_name}`, `{declining_metrics}`, `{historical_data}`
**Deliver:**

```
Analyze early warning signals for {project_name}:
Declining metrics: {declining_metrics}
Historical patterns: {historical_data}
Produce:
1. Root cause hypothesis for each declining metric
2. Correlation analysis between declining metrics
3. Predicted trajectory if no intervention (4-sprint forecast)
4. Recommended interventions ranked by impact
5. Escalation recommendation (yes/no with justification)
```

## Prompt 3: Recovery Plan Generation

**When:** Project is in Red status and needs a turnaround plan
**Context variables:** `{project_name}`, `{red_dimensions}`, `{constraints}`, `{deadline}`
**Deliver:**

```
Generate a recovery plan for {project_name} in Red status:
Red dimensions: {red_dimensions}
Constraints: {constraints}
Hard deadline: {deadline}
Include:
1. Triage assessment — what is salvageable vs. must be descoped
2. Quick wins (implementable within 1 sprint)
3. Medium-term corrections (2-4 sprints)
4. Resource reallocation recommendations
5. Revised milestone schedule with confidence levels
6. Stakeholder communication strategy for recovery
```

## Prompt 4: Team Health Retrospective

**When:** Team morale or productivity concerns identified
**Context variables:** `{team_name}`, `{survey_results}`, `{velocity_trend}`, `{attrition_data}`
**Deliver:**

```
Analyze team health for {team_name}:
Survey results: {survey_results}
Velocity trend: {velocity_trend}
Attrition data: {attrition_data}
Assess: psychological safety, workload balance, skills growth, collaboration quality.
Produce actionable recommendations with owner and timeline for each.
```

*PMO-APEX v1.0 — Use-Case Prompts · Project Health Check*
