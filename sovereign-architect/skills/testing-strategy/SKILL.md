---
name: testing-strategy
author: JM Labs (Javier Montaño)
description: >
  Test pyramid design, automation architecture, E2E testing, contract testing,
  shift-left practices, and test data management. Trigger: "testing strategy",
  "test pyramid", "test automation", "E2E testing", "contract testing", "test data".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Testing Strategy

Design comprehensive testing strategies: test pyramid architecture, automation frameworks, E2E testing approaches, contract testing, shift-left practices, and test data management.

## Guiding Principle
> *"Tests are executable specifications — a well-designed test suite tells you what the system does, catches regressions before users do, and enables confident, continuous delivery."*

## Procedure

### Step 1 — Test Pyramid Design
1. Assess current test distribution: unit, integration, E2E, manual ratios
2. Design target pyramid: 70% unit, 20% integration, 10% E2E (adjust per context)
3. Define scope and boundaries for each test layer
4. Identify gaps: untested critical paths, missing layers, redundant tests
5. Establish test execution time budgets per layer (unit <5s, integration <30s, E2E <5min)

### Step 2 — Automation Architecture
1. Select testing frameworks per layer and technology stack
2. Design test infrastructure: fixtures, factories, builders, test doubles
3. Implement test data management: factories, seeding, synthetic data generation
4. Design parallel execution strategy for test suite speed
5. Integrate test execution into CI/CD with stage-appropriate test selection

### Step 3 — Contract & Integration Testing
1. Identify all service-to-service contracts (API, events, database)
2. Implement consumer-driven contract tests for critical integrations
3. Design integration test environment: containerized dependencies, test containers
4. Implement schema validation tests for event contracts
5. Define contract versioning and backward compatibility verification

### Step 4 — Quality Metrics & Shift-Left
1. Establish code coverage targets: line, branch, mutation testing
2. Implement test quality metrics: flakiness rate, execution time, failure signal clarity
3. Design pre-commit and pre-push test hooks for fast feedback
4. Implement test impact analysis: run only tests affected by changes
5. Build test health dashboards with trend analysis and alerting

## Quality Criteria
- Test pyramid ratios approximate 70/20/10 (unit/integration/E2E)
- CI test suite completes in <10 minutes for PR builds
- Flaky test rate <1% with automated quarantine process
- Contract tests cover all critical inter-service boundaries

## Anti-Patterns
- Ice cream cone: mostly manual and E2E tests with few unit tests
- Testing implementation details rather than behavior
- Flaky tests tolerated and re-run instead of fixed
- Test data shared between tests causing coupling and intermittent failures
