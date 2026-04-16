---
name: component-designer
author: JM Labs (Javier Montaño)
description: >
  Designs modular architecture with clear boundaries, interface contracts, and dependency rules.
  Trigger: "design components", "module boundaries", "interface contracts", "component architecture".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Component Designer

Designs modular software architecture by defining component boundaries, public interfaces, dependency direction rules, and integration contracts that enable independent development and deployment.

## Guiding Principle

> *"Good architecture makes the system easy to change. Good components make the change easy to isolate."*

## Procedure

### Step 1 — Identify Component Candidates
1. Analyze the domain model or existing codebase to identify cohesive functional clusters.
2. Apply the Common Closure Principle: group classes that change for the same reason.
3. Map data ownership — each component should own its data and expose it through contracts.
4. Produce a candidate component list with one-line responsibility statements.

### Step 2 — Define Boundaries & Contracts
1. For each component, specify the public API surface (interfaces, DTOs, events).
2. Define what is explicitly excluded from the public surface (internal models, utilities).
3. Specify the communication mechanism between components (function calls, events, REST, gRPC).
4. Document dependency direction rules (e.g., "domain never depends on infrastructure").
5. Create a component diagram showing boundaries and allowed dependency arrows.

### Step 3 — Validate Coupling & Cohesion
1. Apply the Dependency Rule: dependencies point inward toward stability.
2. Check for circular dependencies — break with dependency inversion or events.
3. Measure afferent/efferent coupling conceptually for each component.
4. Verify each component passes the "independent team" test: could a separate team own this?

### Step 4 — Document the Component Catalog
1. Produce a component catalog with: name, responsibility, public interface, owned data, dependencies, team owner.
2. Include a Mermaid diagram showing the component topology.
3. Define versioning strategy for component interfaces (semantic versioning, consumer-driven contracts).
4. List integration test boundaries between components.

## Quality Criteria
- Each component has a single, clearly stated responsibility (max 2 sentences).
- No circular dependencies exist in the component graph.
- Public interfaces use stable, versioned contracts (not implementation types).
- Every inter-component dependency has an explicit justification.

## Anti-Patterns
- "God component" that absorbs unrelated responsibilities because they share a database table.
- Exposing internal data models as public contracts (tight coupling disguised as modularity).
- Defining components by technical layer (UI, service, repo) instead of business capability.
- Ignoring runtime coupling — components may be logically decoupled but temporally coupled at runtime.
