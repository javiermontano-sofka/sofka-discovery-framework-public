# Testing Strategy — Sample Output

## Context
A TypeScript microservices application with 60% code coverage, slow CI (25 min), and frequent flaky test failures needs a testing strategy overhaul.

## Output: Current State Analysis

| Metric | Current | Target |
|--------|---------|--------|
| Unit tests | 120 (40%) | 350 (70%) |
| Integration tests | 45 (15%) | 60 (20%) |
| E2E tests | 135 (45%) | 30 (10%) |
| Total execution time | 25 minutes | <10 minutes |
| Flaky rate | 8% | <1% |
| Code coverage | 60% line | 80% line, 70% branch |
| Mutation score | Not measured | >60% on critical modules |

**Diagnosis**: Inverted pyramid (ice cream cone). Heavy E2E reliance causes slow feedback and flakiness. Many E2E tests should be decomposed into unit + integration tests.

## Output: Target Test Architecture

### Layer 1 — Unit Tests (70%)
- **Framework**: Vitest (fast, native ESM, TypeScript)
- **Scope**: Pure business logic, domain models, utilities, validators
- **Test doubles**: In-memory fakes for repositories, mocked external clients
- **Speed target**: Full suite <5 seconds
- **Data**: Factory pattern with `@faker-js/faker`

### Layer 2 — Integration Tests (20%)
- **Framework**: Vitest + Testcontainers
- **Scope**: API endpoints, database queries, message handlers
- **Infrastructure**: Testcontainers for PostgreSQL, Redis, Kafka
- **Speed target**: Full suite <2 minutes (parallelized)
- **Data**: Per-test database seeding with transaction rollback

### Layer 3 — E2E Tests (10%)
- **Framework**: Playwright
- **Scope**: Critical user journeys only (login, purchase, onboarding)
- **Speed target**: Full suite <5 minutes
- **Data**: Dedicated test environment with stable seed data

### Contract Tests
- **Framework**: Pact (consumer-driven)
- **Scope**: All REST APIs between services (8 contracts)
- **Integration**: Pact Broker in CI, can-i-deploy checks before promotion

## Output: Migration Plan

| Phase | Action | Effort | Impact |
|-------|--------|--------|--------|
| Week 1-2 | Quarantine 15 flaky E2E tests | 3 days | Flaky rate: 8% → 2% |
| Week 2-4 | Convert 50 E2E tests to unit + integration | 2 weeks | E2E: 135 → 85, Unit: +80 |
| Week 3-5 | Add Testcontainers for integration tests | 1 week | Remove shared test DB dependency |
| Week 4-6 | Implement Pact contracts for 8 APIs | 2 weeks | Catch integration issues in PR |
| Week 5-8 | Convert remaining E2E to lower layers | 2 weeks | E2E: 85 → 30, CI: 25min → 10min |
| Ongoing | Add mutation testing for critical modules | 2 days setup | Validate test quality, not just coverage |
