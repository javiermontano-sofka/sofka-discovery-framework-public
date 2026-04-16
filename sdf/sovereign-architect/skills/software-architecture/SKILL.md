---
name: software-architecture
author: JM Labs (Javier Montaño)
description: >
  Module design, layer boundaries, design patterns, ADR generation, and quality attribute
  analysis for software systems. Trigger: "software architecture", "module design",
  "design patterns", "ADR", "quality attributes", "layered architecture".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Software Architecture

Analyze and design the internal structure of software systems: modules, layers, boundaries, design patterns, and quality attributes. Produce Architecture Decision Records and validate structural integrity.

## Guiding Principle
> *"Good software architecture maximizes the number of decisions not made — it preserves options while enforcing the constraints that matter."*

## Procedure

### Step 1 — Structural Analysis
1. Map the codebase into modules, packages, and layers
2. Calculate coupling metrics: afferent coupling (Ca), efferent coupling (Ce), instability (I)
3. Identify dependency cycles and layering violations
4. Classify components by volatility and stability
5. Produce a dependency graph with hotspots annotated

### Step 2 — Pattern Application
1. Identify recurring design problems in the codebase
2. Match problems to appropriate design patterns (GoF, domain, architectural)
3. Evaluate pattern trade-offs: complexity vs. flexibility vs. testability
4. Design pattern implementation with concrete interfaces and contracts
5. Document pattern rationale in ADR format

### Step 3 — Quality Attribute Engineering
1. Identify critical quality attributes: maintainability, testability, modifiability, performance
2. Define architectural tactics for each quality attribute
3. Map tactics to code-level decisions (DI, interfaces, abstractions)
4. Design fitness functions to guard each quality attribute
5. Establish measurable thresholds for each attribute

### Step 4 — ADR Generation
1. Identify each significant architectural decision made
2. Document context: what forces led to this decision point
3. Record the decision and alternatives considered
4. Analyze consequences: trade-offs, risks, technical debt
5. Link ADRs to affected modules and quality attributes

## Quality Criteria
- Dependency graph shows no circular dependencies between modules
- Every architectural pattern has an ADR with rationale and alternatives
- Quality attributes have measurable fitness functions defined
- Layer boundaries are enforced by build tooling or linting rules

## Anti-Patterns
- Big Ball of Mud: no discernible module boundaries or layering
- Golden Hammer: applying the same pattern everywhere regardless of context
- Architecture by buzzword: choosing patterns for trend rather than fit
- Decision amnesia: no record of why architectural choices were made
