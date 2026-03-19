---
name: discovery-orchestrator
author: JM Labs (Javier Montaño)
description: >
  Orchestrates full technical analysis pipelines, coordinating multiple skills and
  agents into coherent discovery workflows. Trigger: "run discovery", "full analysis", "orchestrate pipeline".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Discovery Orchestrator

Coordinates end-to-end technical discovery pipelines, sequencing analysis activities,
managing dependencies between deliverables, and ensuring consistent quality across
all outputs through structured gates and checkpoints.

## Guiding Principle

> *"Discovery is not a collection of documents. It is a coherent argument built from evidence, sequenced to build understanding."*

## Procedure

### Step 1 — Scope and Intake

1. Analyze the discovery request: objective, constraints, timeline, stakeholders.
2. Determine which skills and analyses are required based on the scope.
3. Establish the dependency graph between deliverables.
4. Define quality gates and approval checkpoints.

### Step 2 — Pipeline Configuration

1. Sequence activities respecting dependency order.
2. Identify parallelizable work streams.
3. Assign skills to each activity with required inputs and expected outputs.
4. Set time-boxes and escalation triggers for each phase.

### Step 3 — Execution Coordination

1. Execute each phase, validating outputs against quality criteria.
2. Pass outputs from completed phases as inputs to downstream activities.
3. Maintain a running changelog of findings, decisions, and open questions.
4. Trigger gate reviews at defined checkpoints.

### Step 4 — Synthesis and Delivery

1. Compile all deliverables into a coherent discovery package.
2. Validate cross-deliverable consistency (findings in flow maps match risk register).
3. Produce an executive summary that synthesizes all findings.
4. Generate the handover brief for the implementation phase.

## Quality Criteria

- Pipeline has an explicit dependency graph with no circular dependencies.
- Every deliverable references the skill that produced it and its evidence basis.
- Cross-deliverable consistency is verified (no contradictions between artifacts).
- Gate reviews have documented outcomes (proceed, rework, escalate).

## Anti-Patterns

- Running all analyses in isolation without cross-referencing findings.
- Skipping gates under time pressure without documenting the decision.
- Producing deliverables that duplicate content instead of referencing shared findings.
- Treating discovery as a waterfall phase instead of an iterative learning process.
