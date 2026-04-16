---
name: test-strategy-designer
author: JM Labs (Javier Montaño)
description: >
  Designs comprehensive test strategies including test pyramid, TDD/BDD flows, contract testing, and mutation testing.
  Trigger: "test strategy", "testing approach", "test pyramid", "what tests do we need".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Test Strategy Designer

Produces a tailored testing strategy that defines what to test, how to test it, and at what layer — balancing coverage, speed, and confidence for a given system architecture.

## Guiding Principle

> *"Tests are not a tax on development; they are the specification made executable."*

## Procedure

### Step 1 — Analyze the System Under Test
1. Identify system architecture: monolith, microservices, serverless, hybrid.
2. Map critical business flows that must never break (revenue paths, auth, data integrity).
3. Catalog existing test infrastructure: frameworks, CI integration, coverage tools.
4. Assess current test health: coverage percentage, flake rate, execution time.
5. Identify testing gaps by layer (unit, integration, e2e, contract, performance).

### Step 2 — Design the Test Pyramid
1. Define the unit test layer: pure logic, domain models, utilities — target 70-80% of total tests.
2. Define the integration test layer: database queries, API calls, message queues — target 15-20%.
3. Define the e2e test layer: critical user journeys only — target 5-10%.
4. Add specialized layers as needed: contract tests (APIs), visual regression, accessibility, security.
5. Set coverage targets per layer with justification.

### Step 3 — Select Testing Patterns
1. Choose TDD or BDD based on team maturity and domain complexity.
2. Design contract testing strategy for service boundaries (Pact, Spring Cloud Contract).
3. Define mutation testing approach for critical modules (Stryker, PIT, mutmut).
4. Establish test data management: factories, fixtures, seeding strategies.
5. Define mocking boundaries: what to mock, what to use real instances for.

### Step 4 — Operationalize the Strategy
1. Define CI pipeline test stages: fast feedback (unit) → integration → e2e → deploy.
2. Set test quality gates: minimum coverage, zero flakes, mutation score thresholds.
3. Create test naming and organization conventions.
4. Design test environment provisioning (testcontainers, docker-compose, ephemeral envs).
5. Establish test maintenance practices: quarterly flake reviews, coverage ratcheting.

## Quality Criteria
- Test pyramid proportions are explicitly stated and justified.
- Critical business flows have end-to-end coverage.
- Contract tests exist at every service boundary.
- Mutation testing validates test effectiveness beyond line coverage.

## Anti-Patterns
- Inverted test pyramid (too many e2e, too few unit tests).
- Testing implementation details instead of behavior.
- Ignoring test maintenance cost in the strategy.
- Treating 100% line coverage as a meaningful goal.
