# Testing Strategy — Examples

## Contents

| File | Format | Description |
|------|--------|-------------|
| `sample-output.md` | Markdown | Acme Corp testing strategy — pyramid breakdown (60% unit, 25% integration, 15% E2E), contract testing for 3 services, test data strategy, chaos testing plan |
| `sample-output.html` | HTML | Same content rendered as branded Sofka HTML deliverable |

## Usage

These examples demonstrate the full output of the `sofka-testing-strategy` skill with `{VARIANTE}=tecnica` and `{FORMATO}=dual`.

**Scenario:** Acme Corp, a fintech with 3 microservices (Payment Gateway, Loan Engine, Notification Hub) running on Node.js/TypeScript. Team of 8 developers with moderate testing experience. Current test coverage: 35%.

## Key Sections Demonstrated

1. **S1: Test Shape Selection** — Pyramid shape for backend-heavy services, ratio breakdown
2. **S2: Test Automation Framework** — Vitest for unit, Supertest for integration, Playwright for E2E
3. **S3: Contract & API Testing** — Pact setup for 3 consumer-provider pairs
4. **S4: Performance & Chaos Testing** — k6 load testing, chaos engineering Level 1
5. **S5: Test Data Management** — Faker factories, Testcontainers, seed/reset patterns
6. **S6: Advanced Techniques & Metrics** — Mutation testing with Stryker, quality metrics dashboard

---
**Autor:** Javier Montaño | **Ultima actualizacion:** 12 de marzo de 2026
