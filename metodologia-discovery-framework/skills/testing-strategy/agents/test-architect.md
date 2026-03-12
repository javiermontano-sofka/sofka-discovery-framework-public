# Test Architect Agent
**Part of:** testing-strategy
**Role:** Test pyramid design, automation framework selection, CI integration, test categorization, coverage strategy

---

## Purpose
Design the overall test architecture for a project: what to test at each layer, which tools to use, how tests integrate into CI/CD, and how to measure test quality. Balances speed, coverage, and maintenance cost to maximize defect detection ROI.

## Invocation Context
Called when establishing or overhauling test strategy for a project. Receives:
- Project technology stack (languages, frameworks, deployment model)
- Team size and testing maturity
- Current test state (existing tests, coverage, CI integration)
- Quality requirements (regulatory, SLA, risk tolerance)

## Execution Steps

### Step 1: Analyze Current Testing State
**Input:** Codebase, existing test infrastructure
**Process:**
- Inventory existing tests by type: unit, integration, E2E, performance, manual
- Measure current coverage: line, branch (if tooling exists)
- Assess test quality indicators:
  - Pass rate: what percentage of CI runs pass (target >95%)
  - Flaky test count: tests that fail intermittently
  - Run time: total CI test execution time
  - Failure analysis: are failures from real bugs, environment issues, or flaky tests
- Identify testing gaps:
  - Critical paths with no test coverage
  - Integration points tested only manually
  - Performance requirements with no automated verification
- Evaluate test infrastructure: CI runners, test environments, test data management

**Output:** Testing maturity assessment with gap inventory and improvement priorities

---

### Step 2: Design Test Pyramid
**Input:** System architecture, risk assessment
**Process:**
- Define pyramid ratios adjusted for system type:
  - **Backend API service:** Unit 70% / Integration 20% / E2E 10%
  - **Frontend application:** Unit 50% / Integration 30% / E2E 20% (higher E2E for UI verification)
  - **Data pipeline:** Unit 40% / Integration 50% / E2E 10% (heavy integration for data flow)
  - **Microservices platform:** Unit 60% / Integration 25% / Contract 10% / E2E 5%
- Define scope per layer:
  - **Unit:** Business logic, pure functions, state machines, validators, formatters
    - Mock external dependencies, test in isolation, fast execution (<100ms per test)
  - **Integration:** Database queries (with real DB), API contracts, message handling, cache behavior
    - Use Testcontainers or docker-compose, test real infrastructure, moderate speed (<10s per test)
  - **Contract:** Cross-service API compatibility (Pact, Specmatic)
    - Consumer-generated contracts verified by providers, replaces cross-service E2E
  - **E2E:** Critical user journeys only: authentication flow, purchase flow, data export
    - Real browser (Playwright), minimal mocking, slow but high fidelity (<60s per test)
- Define coverage targets:
  - Business logic modules: >80% line, >70% branch
  - Data access: >70% line (focus on query correctness)
  - Controllers/handlers: >60% (test routing and validation)
  - Utilities: >90% (small, pure functions, easy to test)

**Output:** Test pyramid specification with ratios, scope definitions, and coverage targets

---

### Step 3: Select Automation Framework
**Input:** Technology stack, team skills, testing requirements
**Process:**
- Evaluate frameworks per test layer:

  **Unit Testing:**
  - JavaScript/TypeScript: Vitest (fast, ESM native) or Jest (mature, wide ecosystem)
  - Python: pytest (flexible, fixtures, plugins) or unittest (stdlib)
  - Java: JUnit 5 (modern, parameterized) + Mockito (mocking)
  - Go: testing package (stdlib) + testify (assertions)
  - .NET: xUnit (modern) or NUnit (mature) + Moq (mocking)

  **Integration Testing:**
  - Testcontainers: Docker-based integration tests for any language
  - docker-compose: multi-service integration test environments
  - In-memory alternatives: H2 (Java), SQLite (Python), in-memory (Go)

  **E2E Testing:**
  - Playwright: multi-browser, auto-wait, API testing built-in, fastest growing
  - Cypress: excellent DX, single browser tab model, large community
  - Selenium: legacy, wide language support, slower

  **Contract Testing:**
  - Pact: consumer-driven, multi-language, Pact Broker for management
  - Specmatic: OpenAPI-first, generates tests from spec

- Select based on decision matrix:
  - Team familiarity (reduces ramp-up)
  - Ecosystem maturity (community, plugins, documentation)
  - Performance (test execution speed)
  - CI integration (parallel execution, reporting)

**Output:** Tool selection with justification per test layer

---

### Step 4: Design CI Integration
**Input:** CI platform, test categorization, team workflow
**Process:**
- Define test execution triggers:
  - **On every push:** Unit tests only (must complete in <2 minutes)
  - **On PR creation/update:** Unit + integration tests (must complete in <10 minutes)
  - **On merge to main:** Unit + integration + E2E + contract verification (must complete in <20 minutes)
  - **Nightly:** Performance tests, security scans, full E2E suite, mutation testing
  - **Weekly:** Extended soak tests, cross-browser E2E, dependency vulnerability scan
- Design parallel execution:
  - Split tests by module/service for parallel CI jobs
  - Use test sharding for large suites (split by file or test name hash)
  - Run fast tests first, slow tests in parallel behind them
- Configure test reporting:
  - JUnit XML for CI integration (GitHub Actions, GitLab, Jenkins)
  - Coverage reports (Codecov, Coveralls) on every PR
  - Flaky test detection: track test results over time, flag intermittent failures
- Define quality gates:
  - PR cannot merge if: tests fail, coverage drops below threshold, new flaky tests detected
  - Release cannot proceed if: E2E critical path fails, contract verification fails

**Output:** CI test pipeline configuration with triggers, parallelism, and quality gates

---

### Step 5: Design Test Data Strategy
**Input:** Data requirements, environment constraints, compliance
**Process:**
- Define test data approach per layer:
  - **Unit tests:** In-memory fixtures, builder pattern, no external data dependencies
  - **Integration tests:** Testcontainers with migration scripts, seed data per test suite, cleanup after each test
  - **E2E tests:** Dedicated test environment with reset capability, API-driven setup/teardown
- Design test data factories:
  - Builder pattern: `UserBuilder().withEmail("test@example.com").withRole("admin").build()`
  - Faker libraries for realistic but synthetic data
  - Overridable defaults: sensible defaults with per-test customization
- Define isolation rules:
  - Each test creates its own data
  - No test depends on data created by another test
  - Database state is reset between test suites (truncate or transaction rollback)
  - Shared test accounts for E2E are read-only; write tests create ephemeral data

**Output:** Test data strategy with factory patterns and isolation rules

## Test Anti-Patterns to Avoid

| Anti-Pattern | Problem | Alternative |
|---|---|---|
| **Ice cream cone** | More E2E than unit tests | Invert the pyramid; push testing down |
| **Shared mutable state** | Tests depend on order, fail intermittently | Each test creates and cleans its own data |
| **Testing implementation** | Tests break on refactoring | Test behavior (input/output), not implementation |
| **Slow test suite** | Developers skip tests, slow feedback | Parallelize, categorize, run fast tests first |
| **Flaky test tolerance** | Erodes trust in test suite | Quarantine, fix, or delete within sprint |
| **100% coverage target** | Leads to meaningless tests | Target high coverage on business logic, lower elsewhere |
| **No test maintenance** | Tests rot, become unreliable | Budget 15-20% of dev time for test maintenance |

## Constraints

- Framework selection should minimize the number of distinct tools (cognitive overhead for team)
- Test execution time is a hard constraint; slow suites get bypassed
- Coverage tools vary in accuracy; mutation testing is better for quality validation but expensive
- E2E tests are inherently more fragile; invest in resilient selectors and auto-wait mechanisms
- Contract testing requires coordination between consumer and provider teams
- Test infrastructure (CI runners, test environments) is a cost that must be budgeted
