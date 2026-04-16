---
name: test-coverage-analyzer
author: JM Labs (Javier Montaño)
description: >
  Test coverage gaps, test quality metrics, and testing strategy assessment.
  Trigger: "analyze test coverage", "test quality", "coverage gaps", "testing strategy".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Test Coverage Analyzer

Evaluate test coverage depth, identify gaps in critical paths, assess test quality beyond line coverage, and recommend testing strategy improvements.

## Guiding Principle

> *"100% line coverage with zero assertion quality is a false sense of security."*

## Procedure

### Step 1 — Test Inventory
1. Locate all test files by convention: `*.test.*`, `*.spec.*`, `test_*.py`, `*_test.go`, `*Test.java`.
2. Classify tests by type: unit, integration, e2e, performance, contract.
3. Count tests per module and calculate test density (tests per source file).
4. Identify modules with zero test files `[HECHO]`.
5. Map test framework and runner configuration.

### Step 2 — Coverage Analysis
1. Parse existing coverage reports (lcov, istanbul, coverage.py, jacoco).
2. If no reports exist, identify how to generate them from project config.
3. Compute line, branch, and function coverage per module.
4. Identify files with <50% coverage that contain business logic `[HECHO]`.
5. Distinguish meaningful coverage from incidental coverage (code hit but not asserted).

### Step 3 — Test Quality Assessment
1. Analyze assertion density: assertions per test function.
2. Detect assertion-free tests (tests that only check "no error thrown").
3. Identify test anti-patterns: excessive mocking, test interdependencies, brittle selectors.
4. Check for snapshot tests that are blindly updated without review.
5. Assess test naming: do test names describe behavior or just reference functions?

### Step 4 — Gap Analysis & Recommendations
1. Cross-reference coverage gaps with code complexity (high complexity + low coverage = critical gap).
2. Identify untested error paths and edge cases.
3. Recommend test types needed: missing integration tests, missing contract tests, etc.
4. Prioritize gaps by business risk and change frequency.

## Quality Criteria
- Coverage numbers from actual reports or tool output `[HECHO]`
- Gaps prioritized by risk, not just percentage
- Test quality assessed beyond line coverage
- Recommendations are actionable with specific files and test types

## Anti-Patterns
- Chasing 100% coverage without considering assertion quality
- Counting test files without checking if tests actually assert anything
- Ignoring integration and e2e test gaps while focusing only on unit tests
- Treating all uncovered code equally regardless of business criticality
