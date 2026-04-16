---
name: roadmap-poc
author: JM Labs (Javier Montaño)
description: >
  Designs proof-of-concept roadmaps with sprint breakdowns, prerequisites, gates,
  team composition, budget, and risk registers. Trigger: "PoC plan", "proof of concept", "sprint breakdown".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Roadmap PoC

Produces structured proof-of-concept plans that validate high-risk assumptions
through time-boxed experiments with clear success criteria, sprint breakdowns,
and go/no-go decision frameworks.

## Guiding Principle

> *"A proof of concept that cannot fail is not a proof of concept. Define what failure looks like before you start."*

## Procedure

### Step 1 — Hypothesis Definition

1. Identify the top 3-5 assumptions that carry the highest risk and impact.
2. Formulate each assumption as a testable hypothesis with measurable criteria.
3. Define success thresholds and failure conditions for each hypothesis.
4. Prioritize hypotheses by risk and dependency order.

### Step 2 — Sprint Architecture

1. Design 1-2 week sprints, each focused on validating specific hypotheses.
2. Define prerequisites for each sprint (environment, data, access, team).
3. Establish sprint deliverables: working code, measurements, decision record.
4. Build in buffer sprints for unexpected findings.

### Step 3 — Resource and Risk Planning

1. Define team composition: roles, skills, availability windows.
2. Estimate effort in FTE-weeks per sprint with confidence ranges.
3. Identify technical risks and create mitigation/contingency pairs.
4. Establish escalation triggers and decision authority.

### Step 4 — Gates and Decision Framework

1. Place go/no-go gates after each sprint with explicit decision criteria.
2. Define what "proceed," "pivot," and "stop" look like at each gate.
3. Document the investment committed vs remaining at each gate.
4. Produce the final PoC summary with recommendations for full implementation.

## Quality Criteria

- Every hypothesis has measurable success/failure criteria defined before execution.
- Sprint breakdowns include prerequisites, deliverables, and time-boxes.
- Risk register includes both technical risks and PoC-specific execution risks.
- Gates have explicit decision criteria that do not require subjective interpretation.

## Anti-Patterns

- Running a PoC without defining what failure looks like.
- Allowing scope creep to turn a PoC into a prototype or MVP.
- Staffing a PoC with junior engineers when the goal is to validate architecture.
- Skipping gates because initial results are promising.
