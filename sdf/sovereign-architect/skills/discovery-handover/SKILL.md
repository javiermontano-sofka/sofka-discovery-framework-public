---
name: discovery-handover
author: JM Labs (Javier Montaño)
description: >
  Produces structured handover packages that bridge analysis to implementation,
  ensuring zero knowledge loss. Trigger: "handover", "transition to implementation", "delivery package".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Discovery Handover

Creates comprehensive handover packages that transfer discovery findings to
implementation teams with complete context, explicit assumptions, and actionable
decision records that prevent knowledge loss at the analysis-to-build boundary.

## Guiding Principle

> *"Every assumption not transferred is a decision the implementation team will make without context."*

## Procedure

### Step 1 — Deliverable Inventory

1. Catalog all discovery artifacts: assessments, diagrams, risk registers, roadmaps.
2. Verify completeness against the original discovery scope.
3. Identify artifacts that require updates or finalization.
4. Tag each artifact with its evidence quality level.

### Step 2 — Context Packaging

1. Write the architectural decision records (ADRs) for all key decisions made during discovery.
2. Document rejected alternatives with rationale for rejection.
3. Compile the assumption register with validation status.
4. Create a stakeholder map with contact points and domain ownership.

### Step 3 — Implementation Guidance

1. Translate roadmap phases into implementation-ready work packages.
2. Define acceptance criteria for each work package.
3. Identify technical prerequisites and environment requirements.
4. Document known risks with their mitigation strategies and triggers.

### Step 4 — Handover Execution

1. Produce the handover document with navigable structure.
2. Include a "start here" guide for the implementation team.
3. Define the support model during the transition period.
4. Schedule knowledge transfer sessions for complex topics.

## Quality Criteria

- Every discovery decision has an ADR with context, decision, and consequences.
- Assumption register is complete with validation status for each assumption.
- Work packages have explicit acceptance criteria and prerequisites.
- Handover document is self-navigable without requiring the discovery team's presence.

## Anti-Patterns

- Handing over raw discovery artifacts without synthesis or context.
- Omitting rejected alternatives, forcing the implementation team to re-evaluate.
- Assuming the implementation team has the same context as the discovery team.
- Creating handover documents that require oral explanation to be useful.
