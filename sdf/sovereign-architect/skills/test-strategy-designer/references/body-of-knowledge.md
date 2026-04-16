# Test Strategy Designer — Body of Knowledge

## Core Concepts
- **Test Pyramid**: Unit tests form the wide base (fast, cheap), integration tests the middle, e2e tests the narrow tip (slow, expensive).
- **TDD (Test-Driven Development)**: Write test first, watch it fail, write minimal code to pass, refactor. Red-Green-Refactor cycle.
- **BDD (Behavior-Driven Development)**: Specify behavior in Given/When/Then format before implementation, bridging business and engineering.
- **Contract Testing**: Verify that service interfaces conform to agreed contracts without requiring full integration environments.
- **Mutation Testing**: Inject small faults into code and verify tests detect them — measures test effectiveness, not just coverage.
- **Test Flakiness**: Non-deterministic test failures caused by timing, shared state, or external dependencies. The silent killer of test confidence.
- **Coverage Ratcheting**: Only allow coverage to increase, never decrease — enforced via CI gates.
- **Test Isolation**: Each test runs independently, sets up its own state, and cleans up after itself.

## Patterns & Practices
- **Arrange-Act-Assert (AAA)**: Standard unit test structure for clarity and consistency.
- **Object Mother / Test Factories**: Centralized test data creation to reduce duplication and improve maintainability.
- **Testcontainers**: Spin up real databases, queues, and services in Docker for integration tests.
- **Consumer-Driven Contracts**: Consumers define the contract, providers verify — prevents breaking changes.
- **Snapshot Testing**: Capture output and compare against stored snapshots — useful for UI and serialization.
- **Property-Based Testing**: Generate random inputs to test invariants rather than specific examples (Hypothesis, fast-check).

## Tools & Technologies
- **Unit Testing**: Jest, Vitest, pytest, JUnit, xUnit, Go testing.
- **Contract Testing**: Pact, Spring Cloud Contract, Specmatic.
- **Mutation Testing**: Stryker (JS/TS), PIT (Java), mutmut (Python).
- **E2E Testing**: Playwright, Cypress, Selenium.
- **Coverage Tools**: Istanbul/nyc, JaCoCo, coverage.py, go tool cover.
- **Test Data**: Faker, Factory Bot, AutoFixture, Testcontainers.

## References
- Martin Fowler, "The Practical Test Pyramid" — Canonical article on test layering.
- Kent Beck, "Test-Driven Development: By Example" — TDD fundamentals.
- Growing Object-Oriented Software, Guided by Tests (Freeman & Pryce) — Outside-in TDD.
- Google Testing Blog — Large-scale testing practices and anti-patterns.
