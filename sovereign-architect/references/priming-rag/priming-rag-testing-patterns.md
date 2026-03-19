# Testing Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Testing strategy determines the confidence level of every deployment. A well-designed testing architecture balances speed, coverage, and maintenance cost across multiple layers. This document covers the test pyramid, testing methodologies, contract testing, specialized testing techniques, and framework selection for architects designing quality assurance strategies.

## Core Patterns

### Test Pyramid & Trophy

**Classic Test Pyramid** (Mike Cohn): Many unit tests (fast, isolated), fewer integration tests (moderate speed, component interaction), fewest E2E tests (slow, full system). Ratio guideline: 70/20/10. Optimizes for speed and isolation.

**Testing Trophy** (Kent C. Dodds): Emphasizes integration tests as the primary layer. Static analysis at the base, then unit, integration (largest), E2E at the top. Rationale: integration tests catch the bugs users actually experience — unit tests often test implementation details that change frequently.

**Practical approach**: Use the trophy model for application code (test behavior, not implementation) and the pyramid model for library/framework code (unit tests for algorithmic correctness). Both agree: minimize E2E tests — they are slow, flaky, and expensive to maintain.

### Test-Driven Development (TDD)

**Red-Green-Refactor cycle**: Write a failing test (red), write minimal code to pass (green), refactor while tests stay green. Forces design-for-testability and produces naturally high coverage.

**When TDD excels**: Complex domain logic, algorithms, state machines, parsers, validators. When the inputs and outputs are clearly defined.

**When TDD is less valuable**: UI layout, infrastructure glue code, exploratory prototyping. For these, write tests after the design stabilizes.

**Key discipline**: Tests must be independent (no shared mutable state), repeatable (same result every run), fast (unit tests < 10ms each), and readable (test name describes the behavior, not the implementation).

### Behavior-Driven Development (BDD)

**Gherkin syntax**: Given-When-Then scenarios written in natural language. Bridge between business requirements and automated tests. Tools: Cucumber (multi-language), SpecFlow (.NET), Behave (Python).

**When valuable**: Complex business rules where stakeholder validation matters. Acceptance criteria can be directly executable. Shared language between product, QA, and engineering.

**When overhead**: Simple CRUD applications, internal tools, or teams where developers write both specs and tests. The Gherkin layer adds maintenance without adding communication value.

### Contract Testing

**Consumer-Driven Contracts (CDC)**: Consumers define their expectations of a provider API. Provider verifies it satisfies all consumer contracts. Tool: Pact. Prevents breaking changes without requiring full integration environments.

**Provider-Driven Contracts**: Provider publishes its API schema (OpenAPI, GraphQL schema, Protobuf). Consumers validate against the published schema. Tool: Schemathesis (OpenAPI fuzzing), Prism (mock server from OpenAPI).

**When to use**: Microservices architectures where services are owned by different teams. Contract tests replace the need for shared integration environments. Run contract verification in CI for both consumer and provider.

**Schema validation**: Even without full contract testing, validate API responses against published schemas in integration tests. Tools: Ajv (JSON Schema), zod/yup (TypeScript runtime validation).

### Mutation Testing

**Concept**: Automatically introduce small changes (mutations) to source code — flip conditionals, change operators, remove statements — and verify that tests catch them. Mutations that survive indicate untested or weakly tested code paths.

**Tools**: Stryker (JavaScript/TypeScript, C#), PIT (Java), mutmut (Python), cargo-mutants (Rust).

**Metrics**: Mutation score = killed mutations / total mutations. Target 80%+ for critical business logic. 100% is impractical and not necessary.

**When to use**: Critical business logic, financial calculations, permission checks, data transformation pipelines. Not cost-effective for UI tests or infrastructure code.

### Property-Based Testing

**Concept**: Instead of specific input/output examples, define properties that must hold for all inputs. The framework generates hundreds of random inputs and finds minimal failing cases (shrinking).

**Tools**: fast-check (TypeScript/JavaScript), Hypothesis (Python), QuickCheck (Haskell/Erlang), jqwik (Java), proptest (Rust).

**Example properties**: Encoding then decoding returns original input. Sorting is idempotent. Serialization preserves all fields. Mathematical invariants hold.

**When to use**: Serialization/deserialization, parsers, data transformations, mathematical operations, any function with well-defined invariants. Finds edge cases that example-based tests miss.

### Visual Regression Testing

**Concept**: Capture screenshots of UI components or pages, compare against baselines, flag visual differences. Catches CSS regressions, layout shifts, and unintended visual changes.

**Tools**: Chromatic (Storybook-native, best DX), Percy (BrowserStack), Playwright visual comparisons, BackstopJS (open source).

**Strategy**: Test at the component level in Storybook (fast, isolated) rather than full-page E2E screenshots (slow, flaky). Review visual diffs in PR workflows. Threshold setting prevents false positives from anti-aliasing differences.

### E2E Framework Selection

**Playwright**: Microsoft-backed, multi-browser (Chromium, Firefox, WebKit), auto-wait, trace viewer, codegen. Best overall choice for new projects. Native TypeScript support, parallel execution, excellent debugging.

**Cypress**: Developer-friendly, time-travel debugging, component testing. Single-browser tab limitation, Chromium-dominant. Good for teams prioritizing DX over multi-browser coverage.

**Selenium**: Oldest, largest ecosystem, WebDriver protocol. Multi-language (Java, Python, C#, JavaScript). Best for legacy integration or when non-JavaScript languages are required. Slower, more flaky without careful waits.

**Decision**: Playwright for new projects. Cypress if team already invested. Selenium only for legacy or specific language requirements.

## Decision Framework

| Test Type | Speed | Confidence | Maintenance | When to Use |
|-----------|-------|-----------|-------------|-------------|
| Unit | < 10ms | Low-Medium | Low | Pure logic, algorithms |
| Integration | 100ms-2s | High | Medium | API endpoints, DB queries |
| Contract | < 1s | Medium-High | Low | Service boundaries |
| E2E | 5-30s | Highest | High | Critical user flows only |
| Visual | 2-10s | Medium | Medium | UI-heavy applications |
| Property-based | 100ms-5s | High | Low | Data transformations |
| Mutation | Minutes | Meta | None | Validate test quality |

## Anti-Patterns

- **Ice cream cone**: Many E2E tests, few unit tests. Inverted pyramid results in slow CI, flaky tests, and low developer productivity. Invert toward integration and unit tests.
- **Testing implementation details**: Tests that break when refactoring without behavior change. Test what the code does (outputs, side effects), not how it does it (internal method calls, state shape).
- **Shared test state**: Tests that depend on execution order or share mutable fixtures. Every test must set up and tear down its own state. Use factories (fishery, faker) over shared fixtures.
- **Mocking everything**: Over-mocking creates tests that pass but the system fails. Mock at architectural boundaries (external APIs, databases), not between internal modules. Integration tests with real databases (via testcontainers) catch more real bugs.

## Evidence Signals

- Test directory structure: `__tests__/`, `spec/`, `test/` — presence and organization indicates testing culture.
- Test coverage configuration: `.nycrc`, `jest.config` with `coverageThreshold`, `jacoco` config — indicates coverage tracking.
- CI pipeline: check if tests run on every PR, if there are separate stages for unit/integration/E2E.
- Test-to-code ratio: healthy projects have 1:1 to 2:1 test-to-source line ratio for critical paths.
- Flaky test tracking: presence of retry mechanisms or `@flaky` annotations indicates E2E reliability issues.
- Testcontainers dependency indicates real-database integration testing — positive signal.

---
*Sovereign Architect RAG Priming · JM Labs*
