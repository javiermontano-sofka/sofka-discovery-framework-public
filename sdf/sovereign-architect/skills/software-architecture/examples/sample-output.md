# Software Architecture — Sample Output

## Context
A Node.js/TypeScript application with 120+ source files, no clear module boundaries, and growing test fragility. Team requests a structural analysis.

## Output: Module Dependency Analysis

### Dependency Metrics

| Module | Files | Ca (in) | Ce (out) | Instability | Assessment |
|--------|-------|---------|----------|-------------|------------|
| `src/domain/` | 18 | 34 | 2 | 0.06 | Stable core (good) |
| `src/api/` | 22 | 3 | 28 | 0.90 | Unstable (expected for adapter) |
| `src/services/` | 31 | 25 | 19 | 0.43 | Mixed stability (concerning) |
| `src/utils/` | 15 | 41 | 8 | 0.16 | Utility grab-bag (review) |
| `src/data/` | 12 | 18 | 14 | 0.44 | Mixed (should be stable) |

### Circular Dependencies Detected
1. `services/order-service` <-> `services/payment-service` (via shared state)
2. `data/user-repo` <-> `domain/user-entity` (entity imports repo for lazy loading)
3. `utils/logger` <-> `services/audit-service` (audit logs through logger)

### Top 5 Structural Hotspots

| # | File | Issue | Recommendation |
|---|------|-------|---------------|
| 1 | `services/order-service.ts` | 340 LOC, 12 dependencies | Extract payment orchestration into saga |
| 2 | `utils/helpers.ts` | 28 exports, God utility | Split by domain concern |
| 3 | `data/database.ts` | Direct SQL in 8 services | Introduce repository interfaces |
| 4 | `api/middleware/auth.ts` | Business logic in middleware | Extract to domain service |
| 5 | `services/notification-service.ts` | 6 external API calls inline | Introduce adapter ports |

## Output: ADR-001

```markdown
# ADR-001: Extract Payment Orchestration into Saga Pattern

## Status: Proposed

## Context
The OrderService directly calls PaymentService, InventoryService, and
ShippingService in a synchronous chain. This creates tight coupling,
circular dependencies, and makes partial failure handling fragile.

## Decision
Implement an Order Saga using orchestration pattern with a dedicated
OrderSagaCoordinator that manages the multi-step transaction.

## Alternatives Considered
1. **Choreography**: Services react to events. Rejected: harder to debug,
   no central visibility into transaction state.
2. **Distributed transaction (2PC)**: Rejected: complexity and availability
   trade-off not justified for this use case.

## Consequences
- (+) Eliminates circular dependency between order and payment
- (+) Explicit compensation logic for each step
- (+) Transaction state visible in saga log
- (-) New component to maintain (SagaCoordinator)
- (-) Slightly higher latency due to orchestration overhead
```
