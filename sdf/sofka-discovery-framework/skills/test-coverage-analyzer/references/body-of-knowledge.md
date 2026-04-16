# Test Coverage Analyzer — Body of Knowledge

## Core Concepts
- **Coverage types**: Line (executed lines), branch (decision paths), function (called functions), statement, condition coverage — each reveals different gaps `[HECHO]`
- **Test pyramid**: Many unit tests (fast, cheap), fewer integration tests (medium), few e2e tests (slow, expensive) `[HECHO]`
- **Mutation testing**: Introduce small code changes (mutants) and verify tests catch them; measures assertion effectiveness
- **Test doubles**: Stubs (canned answers), mocks (behavior verification), fakes (working implementations), spies (call recording)
- **Flaky tests**: Tests that pass and fail nondeterministically; caused by timing, shared state, or external dependencies
- **Test isolation**: Each test should be independent; shared state between tests causes cascade failures
- **Property-based testing**: Generate random inputs to test invariants; finds edge cases that example-based tests miss

## Patterns & Practices
- **Arrange-Act-Assert**: Standard test structure for clarity and consistency
- **Given-When-Then**: BDD-style test naming that documents behavior
- **Test data builders**: Factory patterns for creating test fixtures without coupling to constructor signatures
- **Contract testing**: Pact-style consumer-driven contracts for API boundary testing
- **Snapshot testing**: Captures output for regression detection; requires disciplined review of changes
- **Coverage ratchet**: CI rule that prevents coverage from decreasing below current level

## Tools & Technologies
- **JavaScript**: Jest, Vitest, Playwright, Cypress, c8/istanbul
- **Python**: pytest, coverage.py, hypothesis (property-based), locust (performance)
- **Java**: JUnit 5, Mockito, JaCoCo, ArchUnit, PIT (mutation)
- **Go**: testing package, testify, go-cmp, gocover

## References
- Martin Fowler — "Test Pyramid" and "Mocks Aren't Stubs"
- Kent Beck — "Test-Driven Development: By Example"
- Google Testing Blog — "Testing on the Toilet" series
- Pitest — Mutation testing for Java
