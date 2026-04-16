---
name: functional-spec
author: JM Labs (Javier Montaño)
description: >
  Produces structured functional specifications including use cases, business rules,
  and complexity/risk matrices. Trigger: "write the spec", "functional requirements", "use case analysis".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Functional Specification

Translates stakeholder needs and technical constraints into precise, testable functional
specifications that serve as the contract between engineering intent and delivered behavior.

## Guiding Principle

> *"Ambiguity in specifications is a deferred decision that will be made by the wrong person at the worst time."*

## Procedure

### Step 1 — Requirements Elicitation

1. Gather inputs from stakeholder interviews, existing documentation, and codebase analysis.
2. Classify requirements as functional, non-functional, or constraint.
3. Identify implicit assumptions and make them explicit.
4. Map each requirement to a business objective or user need.

### Step 2 — Use Case Modeling

1. Define actors (primary, secondary, system) and their goals.
2. Write use cases with preconditions, main flow, alternative flows, and postconditions.
3. Identify shared steps and extract them as included use cases.
4. Cross-reference use cases with business rules that govern behavior.

### Step 3 — Complexity and Risk Assessment

1. Score each use case on implementation complexity (Low/Medium/High/Critical).
2. Assess risk based on uncertainty, external dependencies, and regulatory exposure.
3. Build a complexity/risk matrix to prioritize specification depth.
4. Flag high-risk items that require proof-of-concept validation.

### Step 4 — Specification Synthesis

1. Write formal specifications with acceptance criteria in Given/When/Then format.
2. Include boundary conditions, error scenarios, and edge cases.
3. Produce a traceability matrix linking requirements to use cases to acceptance criteria.
4. Review for completeness, consistency, and testability.

## Quality Criteria

- Every requirement has at least one use case and one acceptance criterion.
- Business rules are explicit, numbered, and referenced by use cases.
- Complexity/risk matrix covers all use cases with justified scores.
- Specifications are testable without requiring interpretation.

## Anti-Patterns

- Writing specifications after implementation as retroactive documentation.
- Conflating solution design with functional requirements.
- Ignoring non-functional requirements or treating them as optional.
- Producing specifications that only cover the happy path.
