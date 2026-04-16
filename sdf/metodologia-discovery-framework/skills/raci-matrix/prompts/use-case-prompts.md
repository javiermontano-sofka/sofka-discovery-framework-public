# Use-Case Prompts — RACI Matrix

## Prompt 1: Full RACI from WBS

**When:** WBS is complete and roles need assignment
**Context variables:** `{project_name}`, `{wbs_activities}`, `{roles}`, `{governance_model}`
**Deliver:**

```
Create a RACI matrix for {project_name}:
WBS activities: {wbs_activities}
Roles: {roles}
Governance: {governance_model}
Assign R/A/C/I for each activity-role intersection. Validate: exactly one A per row, at least one R per row, no empty columns. Flag overloaded roles (>60% R assignments). Output as formatted Markdown table.
```

## Prompt 2: RACI Conflict Resolution

**When:** Overlapping responsibilities creating confusion
**Context variables:** `{current_raci}`, `{conflicts}`, `{org_structure}`
**Deliver:**

```
Resolve RACI conflicts:
Current matrix: {current_raci}
Identified conflicts: {conflicts}
Org structure: {org_structure}
For each conflict: identify root cause, propose resolution options, recommend optimal assignment with rationale. Update the matrix and highlight changes.
```

## Prompt 3: RACI Audit

**When:** Reviewing existing RACI for completeness and correctness
**Context variables:** `{existing_raci}`, `{project_phase}`, `{team_changes}`
**Deliver:**

```
Audit the existing RACI matrix:
Matrix: {existing_raci}
Current phase: {project_phase}
Recent team changes: {team_changes}
Check: one-A rule, empty columns, overloaded roles, missing activities, stale assignments. Produce gap report with recommendations.
```

*PMO-APEX v1.0 — Use-Case Prompts · RACI Matrix*
