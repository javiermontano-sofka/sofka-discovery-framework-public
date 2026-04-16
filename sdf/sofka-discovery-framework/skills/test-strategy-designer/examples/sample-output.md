# Test Strategy Designer — Sample Output

## Context
A Node.js/TypeScript REST API for an e-commerce platform with PostgreSQL, Redis, and Stripe integration. Team of 5 developers, current coverage at 42%.

## Output

### Test Pyramid Distribution

| Layer | Target % of Tests | Coverage Goal | Framework | Execution Time |
|-------|-------------------|---------------|-----------|---------------|
| Unit | 75% | 85% line coverage | Vitest | < 30s |
| Integration | 18% | Critical paths 100% | Vitest + Testcontainers | < 3min |
| Contract | 5% | All service boundaries | Pact | < 1min |
| E2E | 2% | Top 5 user journeys | Playwright | < 5min |

### Critical Business Flows (Must Have E2E)
1. User registration → email verification → first login.
2. Product search → add to cart → checkout → payment → confirmation.
3. Order placement → inventory deduction → shipping notification.
4. Refund request → payment reversal → inventory restoration.
5. Admin product CRUD → catalog update → search index refresh.

### Contract Testing Strategy
- **Stripe API**: Record-replay with Pact stubs. Consumer-driven contracts for webhook payloads.
- **Internal Auth Service**: Pact broker with CI verification on both consumer and provider.
- **Email Service**: Contract on the event schema published to the message queue.

### Mutation Testing
- **Target Modules**: `src/domain/pricing/`, `src/domain/inventory/`, `src/services/payment/`.
- **Tool**: Stryker Mutator.
- **Threshold**: Mutation score >= 80% for domain modules.
- **CI Gate**: Block merge if mutation score drops below threshold.

### Test Data Strategy
- **Factories**: `@faker-js/faker` + custom builders in `tests/factories/`.
- **Database**: Testcontainers PostgreSQL with per-test transactions (rollback after each test).
- **Stripe**: Stripe test mode API keys + recorded fixtures for offline testing.

### CI Pipeline Integration
```
Stage 1 (parallel): Lint + Type Check + Unit Tests     → 45s
Stage 2 (parallel): Integration Tests + Contract Tests  → 4min
Stage 3 (sequential): E2E Tests                         → 5min
Stage 4 (weekly): Mutation Testing                       → 15min
```

### Quality Gates
- Unit coverage must not decrease (ratchet).
- Zero flaky tests (quarantine and fix within 48h).
- All Pact contracts verified before merge.
- E2E tests pass on staging before production deploy.
