# Test Coverage Analyzer — Sample Output

## Context
Analyzing test coverage for a NestJS microservice.

## Output

### Coverage Summary

| Module | Line % | Branch % | Functions % | Test Count | Density |
|--------|--------|----------|-------------|-----------|---------|
| auth | 92% | 85% | 88% | 34 | 2.8/file `[HECHO]` |
| users | 78% | 62% | 75% | 22 | 1.8/file `[HECHO]` |
| orders | 45% | 30% | 40% | 8 | 0.5/file `[HECHO]` |
| payments | 38% | 22% | 35% | 5 | 0.4/file `[HECHO]` |
| notifications | 12% | 5% | 10% | 2 | 0.2/file `[HECHO]` |

### Critical Gaps (High Complexity + Low Coverage)

| File | Complexity | Coverage | Risk |
|------|-----------|----------|------|
| `payments/services/processor.ts` | 34 | 22% | **Critical** `[HECHO]` |
| `orders/services/fulfillment.ts` | 28 | 18% | **Critical** `[HECHO]` |
| `orders/services/pricing.ts` | 25 | 40% | **High** `[HECHO]` |

### Test Quality Issues
- 6 tests have zero assertions (only check no exception thrown) `[HECHO]`
- 4 snapshot tests last updated 6 months ago without meaningful review `[INFERENCIA]`
- Integration tests missing entirely for payment gateway interactions `[HECHO]`

### Pyramid Balance
- Unit: 58 tests (82%) — adequate
- Integration: 11 tests (16%) — below recommended 15-20%
- E2E: 2 tests (3%) — minimal, but acceptable for microservice
- Contract: 0 tests — **missing** (critical for service-to-service boundaries)
