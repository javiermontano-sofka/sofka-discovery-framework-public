---
name: acceptance-criteria-writer
author: JM Labs (Javier Montaño)
description: >
  Writes testable acceptance criteria in Given/When/Then format, covering happy paths, edge cases, and error scenarios.
  Trigger: "acceptance criteria", "given when then", "write AC", "define done", "user story criteria".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Acceptance Criteria Writer

Transforms vague requirements into precise, testable acceptance criteria using structured Given/When/Then format — covering happy paths, edge cases, error handling, and non-functional requirements.

## Guiding Principle

> *"If you cannot write the test, you do not understand the requirement."*

## Procedure

### Step 1 — Parse the Requirement
1. Extract the core user intent: who, what, why.
2. Identify the domain entities and their state transitions.
3. Detect implicit requirements not stated but expected (validation, error handling, authorization).
4. Clarify ambiguous terms with concrete examples or propose assumptions.
5. Map the requirement to existing system capabilities and gaps.

### Step 2 — Write Happy Path Criteria
1. Define the primary success scenario in Given/When/Then format.
2. Include specific data examples (not abstract placeholders).
3. State the expected system behavior AND the user-visible outcome.
4. Cover variations of the happy path (different valid inputs, roles).
5. Ensure each criterion is independently testable.

### Step 3 — Write Edge Cases and Error Scenarios
1. Identify boundary conditions: min/max values, empty inputs, null states.
2. Define error scenarios: invalid input, unauthorized access, resource not found, timeout.
3. Specify the expected error response: status code, message, and user guidance.
4. Cover concurrent access scenarios where applicable (race conditions, optimistic locking).
5. Address idempotency: what happens if the action is repeated?

### Step 4 — Add Non-Functional Criteria
1. Performance: response time expectations under stated load.
2. Accessibility: WCAG compliance requirements for UI changes.
3. Security: authentication, authorization, and data protection requirements.
4. Observability: what should be logged, metricked, or alerted.
5. Tag each criterion with evidence: `[REQUISITO]`, `[INFERENCIA]`, `[SUPUESTO]`.

## Quality Criteria
- Every criterion follows Given/When/Then with concrete data examples.
- Edge cases and error scenarios outnumber happy path criteria (2:1 ratio).
- Criteria are independently testable without relying on other criteria's state.
- Non-functional requirements are explicitly stated, not assumed.

## Anti-Patterns
- Writing criteria so vague they pass any implementation ("system works correctly").
- Ignoring error scenarios and only covering the happy path.
- Embedding implementation details in acceptance criteria.
- Writing criteria that are coupled and must execute in sequence.
