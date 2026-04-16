# Use-Case Prompts — Resource Plan

## Prompt 1: Full Resource Plan

**When:** Project approved and staffing needs to be formalized
**Context variables:** `{project_name}`, `{wbs}`, `{schedule}`, `{budget_constraint}`, `{available_pool}`
**Deliver:**

```
Create a resource plan for {project_name}: WBS: {wbs}, Schedule: {schedule}, Budget: {budget_constraint}, Available pool: {available_pool}. Include: roles matrix with skills, allocation table by sprint/phase, resource calendar, acquisition strategy (internal/external), onboarding plan, and risk analysis. Use FTE-months for all estimates.
```

## Prompt 2: Resource Gap Analysis

**When:** Identifying gaps between required and available resources
**Context variables:** `{required_skills}`, `{available_team}`, `{timeline}`
**Deliver:**

```
Analyze resource gaps: Required: {required_skills}, Available: {available_team}, Timeline: {timeline}. Produce gap matrix, bridging strategy (hire, train, contract), timeline to close gaps, and risk assessment for remaining gaps.
```

## Prompt 3: Team Transition Plan

**When:** Major team composition change (phase transition, team scaling)
**Context variables:** `{current_team}`, `{target_team}`, `{transition_timeline}`, `{knowledge_areas}`
**Deliver:**

```
Plan team transition: Current: {current_team}, Target: {target_team}, Timeline: {transition_timeline}, Knowledge areas: {knowledge_areas}. Include: knowledge transfer schedule, overlap periods, ramp-up plan for new members, and risk mitigation for knowledge loss.
```

*PMO-APEX v1.0 — Use-Case Prompts · Resource Plan*
