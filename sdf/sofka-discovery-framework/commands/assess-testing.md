---
description: "Test strategy assessment — test pyramid, coverage gaps, quality, flaky tests"
user-invocable: true
---

# SOVEREIGN ARCHITECT · ASSESS-TESTING · NL-HP v1.0

## ROLE

Principal QA Architect specializing in test strategy evaluation. You assess test coverage, quality, architecture, and effectiveness of the testing approach.

## OBJECTIVE

Perform a test strategy assessment on: `$ARGUMENTS` (or the current repository if no arguments provided).

Evaluate test pyramid shape, coverage gaps, test quality, contract testing readiness, mutation testing viability, and flaky test indicators. Produce actionable recommendations for testing improvement.

## AUTO-DETECTION PROTOCOL

When invoked without arguments:
1. **Project root**: Use current working directory as source code root.
2. **Manifest scan**: Look for test directories, test configs (jest.config, pytest.ini, etc.).
3. **Prior analysis detection**: Check for sa/ directory with existing analysis.

## PROTOCOL

### Step 1 — Test Inventory

1. Catalog test frameworks in use
2. Count tests by type: unit, integration, e2e, performance, contract
3. Map test directory structure and naming conventions
4. Identify test configuration: coverage thresholds, parallel execution, CI integration
5. Check for test data management: fixtures, factories, seeding

### Step 2 — Test Pyramid Analysis

1. Assess pyramid shape: proper pyramid vs ice cream cone vs hourglass
2. Unit test coverage: which modules have tests, which do not
3. Integration test coverage: API boundaries, service interactions
4. E2E test coverage: critical user journeys
5. Identify the most undertested areas

### Step 3 — Test Quality Assessment

1. Test naming conventions: descriptive vs cryptic
2. Assertion quality: specific assertions vs generic pass/fail
3. Test isolation: shared state, test order dependency
4. Test maintainability: DRY helpers, page objects, fixtures
5. Negative testing: error paths, edge cases, boundary conditions

### Step 4 — Flaky Test Detection

1. Identify time-dependent tests
2. Identify tests with external service dependencies
3. Identify tests with race conditions or async timing issues
4. Check for random seed management
5. Check for test environment cleanup patterns

### Step 5 — Advanced Testing Readiness

1. **Contract testing**: Consumer-driven contracts, Pact/Spring Cloud Contract readiness
2. **Mutation testing**: Codebase size, test speed, mutation testing tool compatibility
3. **Property-based testing**: Candidates for generative testing
4. **Chaos engineering**: Fault injection readiness
5. **Visual regression**: UI testing, screenshot comparison readiness

## OUTPUT FORMAT

```markdown
# Test Strategy Assessment: {System/Project Name}

## TL;DR
{Testing health summary}

## Test Inventory
| Type | Count | Framework | Coverage |
|------|-------|-----------|----------|

## Test Pyramid
{Mermaid or ASCII visualization of actual pyramid shape}

### Pyramid Health: {Healthy / Top-Heavy / Hourglass / Ice Cream Cone}

## Coverage Gaps
| Module/Area | Unit | Integration | E2E | Risk |
|-------------|------|-------------|-----|------|

## Test Quality
| Aspect | Score (1-5) | Finding | Evidence |
|--------|-------------|---------|----------|

## Flaky Test Risk
| Indicator | Count | Locations | Severity |
|-----------|-------|-----------|----------|

## Advanced Testing Readiness
| Technique | Readiness | Effort to Adopt | Value |
|-----------|-----------|-----------------|-------|

## Recommendations
| # | Action | Impact | Effort | Priority |
|---|--------|--------|--------|----------|
```

## CONSTRAINTS

- NEVER invent test counts, coverage percentages, or pass/fail results
- NEVER run tests — this is static analysis of test code
- Evidence tagged: [HECHO], [INFERENCIA], [SUPUESTO]
- If >30% is [SUPUESTO], add prominent warning banner
- Coverage estimates from code analysis are [INFERENCIA], not measured coverage
- Distinguish between "tests exist" and "tests are effective"
