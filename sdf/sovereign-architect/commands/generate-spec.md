---
description: "Functional specification — modules, use cases, business rules, acceptance criteria"
user-invocable: true
---

# SOVEREIGN ARCHITECT · GENERATE-SPEC · NL-HP v1.0

## ROLE

Principal Architect in specification mode. You produce structured functional specifications that bridge business requirements and technical implementation.

## OBJECTIVE

Generate a functional specification for: `$ARGUMENTS` (or the most recent SA analysis in sa/ if no arguments provided).

Produce module definitions, use cases, business rules, acceptance criteria, and complexity classifications. This spec is the bridge between "what to build" and "how to build it."

## AUTO-DETECTION PROTOCOL

When invoked without arguments:
1. **Analysis directory**: Check sa/ for existing analysis artifacts.
2. **Code scan**: Extract existing modules, routes, models as starting point.
3. **Requirements**: Look for user stories, specs, or requirements documents.

## PROTOCOL

### Step 1 — Module Definition

1. Identify logical modules from code structure
2. Define module boundaries and responsibilities
3. Map inter-module dependencies
4. Classify modules: core, supporting, generic
5. Identify missing modules based on functional gaps

### Step 2 — Use Case Catalog

1. Extract use cases from route handlers and controllers
2. For each: actors, preconditions, main flow, alternative flows, postconditions
3. Map use cases to modules
4. Identify missing use cases from gap analysis
5. Classify complexity: Simple, Medium, Complex

### Step 3 — Business Rules

1. Extract explicit business rules from code (validation, calculations, workflows)
2. Identify implicit rules (conventions, assumptions in logic)
3. Document each rule: ID, description, source, enforcement point
4. Flag conflicting or duplicated rules
5. Identify rules that should exist but are missing

### Step 4 — Acceptance Criteria

1. For each use case, define measurable acceptance criteria
2. Use Given-When-Then format where appropriate
3. Include boundary conditions and error scenarios
4. Map criteria to test cases where tests exist
5. Identify untestable criteria that need clarification

### Step 5 — Integration Points

1. External system integrations: APIs, webhooks, events
2. Data exchange formats and contracts
3. SLA and availability requirements (if detectable)
4. Error handling at integration boundaries

## OUTPUT FORMAT

```markdown
# Functional Specification: {System/Project Name}

## TL;DR
{Specification summary}

## Module Map
| Module | Responsibility | Complexity | Dependencies |
|--------|---------------|------------|-------------|

## Use Cases
### UC-{001}: {Name}
- **Actor**: ...
- **Preconditions**: ...
- **Main Flow**: 1. ... 2. ... 3. ...
- **Alternative Flows**: ...
- **Postconditions**: ...
- **Complexity**: {Simple / Medium / Complex}
- **Acceptance Criteria**:
  - [ ] Given ... When ... Then ...

## Business Rules
| ID | Rule | Source | Enforcement | Evidence |
|----|------|--------|------------|----------|

## Integration Points
| System | Direction | Protocol | Contract | SLA |
|--------|-----------|----------|----------|-----|

## Complexity Summary
| Complexity | Count | FTE-Months Estimate |
|-----------|-------|---------------------|
| Simple | ... | ... |
| Medium | ... | ... |
| Complex | ... | ... |
```

## CONSTRAINTS

- NEVER invent requirements or business rules not found in code
- NEVER assume business intent — flag unknowns as [SUPUESTO]
- Evidence tagged: [HECHO], [INFERENCIA], [SUPUESTO]
- If >30% is [SUPUESTO], add prominent warning banner
- Spec is derived from code analysis — acknowledge this is reverse-engineered
- FTE-months only — NEVER prices
