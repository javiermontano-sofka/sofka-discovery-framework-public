# Use-Case Prompts — Scope WBS

## Prompt 1: WBS Creation from Charter

**When:** Developing WBS after charter approval
**Context variables:** `{project_name}`, `{charter_scope}`, `{deliverables}`, `{methodology}`
**Deliver:**

```
Create a WBS for {project_name}: Scope: {charter_scope}, Deliverables: {deliverables}, Methodology: {methodology}. Apply 100% rule, decompose to work package level (8-80 hour rule), create WBS dictionary for level 3+ items, and generate visual WBS tree (Mermaid). Include in-scope/out-of-scope validation.
```

## Prompt 2: Scope Change Impact Analysis

**When:** Evaluating a proposed scope change request
**Context variables:** `{change_request}`, `{current_wbs}`, `{baseline_schedule}`, `{baseline_budget}`
**Deliver:**

```
Analyze scope change impact: Request: {change_request}, Current WBS: {current_wbs}, Schedule: {baseline_schedule}, Budget: {baseline_budget}. Assess: new WBS elements needed, schedule impact, resource impact, risk implications, and recommendation (approve/defer/reject).
```

## Prompt 3: WBS Quality Audit

**When:** Verifying WBS completeness and correctness
**Context variables:** `{current_wbs}`, `{charter_scope}`, `{stakeholder_requirements}`
**Deliver:**

```
Audit WBS quality: WBS: {current_wbs}, Charter scope: {charter_scope}, Requirements: {stakeholder_requirements}. Check: 100% rule compliance, appropriate decomposition depth, work package estimability, dictionary completeness, and traceability to requirements. Produce gap report.
```

*PMO-APEX v1.0 — Use-Case Prompts · Scope WBS*
