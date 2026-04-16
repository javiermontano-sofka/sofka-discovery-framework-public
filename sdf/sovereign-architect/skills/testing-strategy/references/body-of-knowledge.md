# Testing Strategy — Body of Knowledge

## Core Concepts
- **Test Pyramid**: Layered testing model (unit → integration → E2E) where lower layers are faster, cheaper, and more numerous
- **Contract Testing**: Verifying that service interfaces meet the expectations of their consumers
- **Mutation Testing**: Introducing small code changes (mutants) to verify that tests detect them
- **Test Doubles**: Mocks, stubs, fakes, and spies used to isolate units under test
- **Shift-Left Testing**: Moving testing activities earlier in the development process for faster feedback
- **Test Data Management**: Strategies for creating, maintaining, and isolating test data
- **Behavior-Driven Development (BDD)**: Specifying behavior in given-when-then format as executable specs

## Patterns
- **Test Containers**: Spinning up real dependencies (databases, queues) in containers for integration tests
- **Factory Pattern for Tests**: Generating test data with sensible defaults and customizable overrides
- **Arrange-Act-Assert (AAA)**: Standard structure for clear, readable test methods
- **Consumer-Driven Contracts**: Consumers define expected behavior, providers verify compliance
- **Test Impact Analysis**: Running only tests affected by code changes based on dependency graphs

## Tools & Frameworks
- **Jest / Vitest / Mocha**: JavaScript/TypeScript unit testing frameworks
- **JUnit 5 / TestNG**: Java unit testing frameworks
- **Pact**: Consumer-driven contract testing for REST and messaging
- **Testcontainers**: Library for spinning up Docker containers in integration tests
- **Playwright / Cypress**: E2E browser automation testing frameworks
- **Stryker / PIT**: Mutation testing frameworks for JavaScript and Java

## References
- Martin Fowler — *Test Pyramid* (2012) and *Microservices Testing* (2014)
- Growing Object-Oriented Software, Guided by Tests — Freeman & Pryce (2009)
- Kent Beck — *Test Driven Development: By Example* (2002)
- Bas Dijkstra — *API Testing and Development with Postman* (2021)
