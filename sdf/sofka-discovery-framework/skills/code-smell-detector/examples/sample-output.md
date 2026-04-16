# Code Smell Detector — Sample Output

## Context
Scanning a TypeScript/NestJS backend API (~45K LOC) before a planned refactoring sprint to identify the highest-impact code smells.

## Output

### Smell Summary

| Category | Count | Critical | Structural | Cosmetic |
|----------|-------|----------|------------|----------|
| Bloaters | 18 | 3 | 12 | 3 |
| Couplers | 9 | 2 | 5 | 2 |
| Dispensables | 14 | 1 | 4 | 9 |
| Change Preventers | 5 | 2 | 3 | 0 |
| **Total** | **46** | **8** | **24** | **14** |

### Critical Findings

#### 1. God Class: `OrderService` (Bloater + Change Preventer)

- **File**: `src/modules/orders/order.service.ts` — 847 lines `[HECHO]`
- **Methods**: 34 public methods spanning order creation, payment processing, shipping, notifications, and reporting `[HECHO]`
- **Import fan-out**: 22 imports from 14 different modules `[HECHO]`
- **Change frequency**: Modified in 38 of last 50 commits to `src/modules/orders/` `[HECHO]`
- **Smell pattern**: Divergent change — this file changes for at least 5 unrelated reasons
- **Recommended refactoring**: Extract into `OrderCreationService`, `OrderPaymentService`, `OrderFulfillmentService`, `OrderNotificationService`, `OrderReportingService`
- **Estimated effort**: 3-4 days with test migration

#### 2. Shotgun Surgery: `UserDTO` Changes

- **Files affected**: 11 files across 4 modules `[HECHO]`
- **Pattern**: Adding a field to `UserDTO` requires changes in `user.service.ts`, `user.controller.ts`, `order.service.ts`, `notification.service.ts`, `admin.controller.ts`, `user.mapper.ts`, and 5 test files `[HECHO]`
- **Evidence**: Last 3 PRs that added a user field each touched 9+ files `[HECHO: git log --all --oneline -- '**/user*']`
- **Root cause**: No shared mapping layer; each consumer manually destructures the DTO
- **Recommended refactoring**: Introduce AutoMapper or class-transformer with decorator-based field selection

#### 3. Feature Envy: `PaymentController` Reaches Into `OrderService`

- **File**: `src/modules/payments/payment.controller.ts:78-124` `[HECHO]`
- **Pattern**: 47-line method that calls 8 methods on `OrderService` and only 1 on `PaymentService` `[HECHO]`
- **Smell**: The payment controller knows more about order internals than the order module's own controller
- **Recommended refactoring**: Move orchestration logic into `OrderPaymentFacade` or an application-level use case

### Structural Findings (Top 5)

| # | Smell | File | Metric | Threshold | Actual |
|---|-------|------|--------|-----------|--------|
| 4 | Long Method | `src/modules/reports/report-generator.service.ts:buildMonthlyReport` | Lines | 40 | 127 `[HECHO]` |
| 5 | Deep Nesting | `src/modules/shipping/rate-calculator.ts:calculateRate` | Depth | 3 | 6 `[HECHO]` |
| 6 | Long Parameter List | `src/modules/orders/order.service.ts:createOrder` | Params | 4 | 9 `[HECHO]` |
| 7 | Primitive Obsession | `src/modules/orders/` | String statuses | Enum | 14 string literals for order status `[HECHO]` |
| 8 | Duplicate Logic | `src/modules/*/validators/` | Similar blocks | DRY | 4 validators with near-identical date range validation `[HECHO]` |

### Dispensable Findings

- **Dead exports**: 23 exported functions across `src/utils/` never imported elsewhere `[HECHO: grep cross-reference]`
- **TODO/FIXME markers**: 31 instances across codebase, oldest from 11 months ago `[HECHO]`
- **Commented-out code**: 8 blocks of >10 lines of commented code in production files `[HECHO]`

### Refactoring Priority Matrix

| Priority | Finding | Effort | Impact |
|----------|---------|--------|--------|
| P0 | Split OrderService God Class | 3-4 days | Unblocks 5 teams, reduces merge conflicts |
| P0 | Fix UserDTO shotgun surgery | 2 days | Reduces per-field change from 11 files to 2 |
| P1 | Move payment orchestration | 1 day | Clarifies module boundaries |
| P1 | Extract date validation utility | 0.5 day | Eliminates 4 duplicate blocks |
| P2 | Introduce order status enum | 1 day | Prevents typo-based bugs |
