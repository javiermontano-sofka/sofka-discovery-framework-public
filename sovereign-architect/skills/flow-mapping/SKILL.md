---
name: flow-mapping
author: JM Labs (Javier Montaño)
description: >
  Maps business processes, data flows, and integration points into visual sequence diagrams
  and dependency graphs. Trigger: "map the flow", "show me how data moves", "integration diagram".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Flow Mapping

Transforms implicit system knowledge into explicit, navigable flow diagrams that reveal
integration points, data transformations, and process bottlenecks across distributed architectures.

## Guiding Principle

> *"You cannot optimize what you cannot see. Make the invisible visible before you dare to change it."*

## Procedure

### Step 1 — Boundary Identification

1. Identify all systems, services, and actors involved in the target scope.
2. Classify each as internal, external, or shared-responsibility.
3. Document known protocols and transport mechanisms (REST, gRPC, messaging, batch).
4. Establish the flow's entry points and terminal states.

### Step 2 — Flow Decomposition

1. Trace the happy path end-to-end, documenting each hop.
2. Identify branching logic, conditional routing, and fallback paths.
3. Map data transformations at each boundary crossing.
4. Annotate synchronous vs asynchronous interactions.

### Step 3 — Diagram Synthesis

1. Produce Mermaid sequence diagrams for each major flow.
2. Create a system-level integration map showing all connections.
3. Highlight critical paths and single points of failure.
4. Add latency annotations where data is available.

### Step 4 — Validation and Gap Analysis

1. Cross-reference flows against source code, configs, or documentation.
2. Identify undocumented integrations or shadow data paths.
3. Flag flows with missing error handling or retry logic.
4. Produce a flow inventory with coverage status.

## Quality Criteria

- Every flow has a defined trigger, path, and terminal state.
- Integration points include protocol, direction, and data format.
- Diagrams are renderable Mermaid syntax with no broken references.
- Gap analysis identifies at least one actionable finding per major flow.

## Anti-Patterns

- Mapping only the happy path and ignoring error/fallback flows.
- Creating monolithic diagrams that collapse all flows into one view.
- Assuming integration contracts without verifying against actual implementations.
- Treating flow mapping as a one-time activity rather than a living artifact.
