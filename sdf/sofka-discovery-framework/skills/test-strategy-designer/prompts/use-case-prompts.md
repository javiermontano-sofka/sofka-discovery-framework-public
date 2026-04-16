# Test Strategy Designer — Use Case Prompts

## Prompt 1: Greenfield Microservice
> We are building a new order processing microservice in Go that communicates with 4 other services via gRPC and publishes events to Kafka. Design a complete test strategy including the test pyramid, contract testing approach for gRPC interfaces, integration test setup for Kafka, and mutation testing targets. The team has 3 backend engineers with moderate testing experience.

## Prompt 2: Legacy Monolith with Low Coverage
> Our 5-year-old Django monolith has 18% test coverage, mostly concentrated in utility functions. We need to increase confidence before a major refactor. Design a pragmatic test strategy that prioritizes the highest-risk areas, establishes coverage ratcheting, and introduces integration tests for the 10 most critical API endpoints. Budget: 2 sprint capacity.

## Prompt 3: Frontend Component Library
> We maintain a shared React component library used by 6 product teams. Design a test strategy covering unit tests for component logic, visual regression testing, accessibility compliance, and consumer-driven contract tests to prevent breaking changes for downstream consumers.
