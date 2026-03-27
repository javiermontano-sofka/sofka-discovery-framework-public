# Tech Debt Quantifier — Sample Output

## Context
Quantifying technical debt in a 3-year-old Ruby on Rails application.

## Output

### Debt Summary

| Category | Items | Est. Principal | Weekly Interest |
|----------|-------|---------------|----------------|
| Architecture | 3 | 45 dev-days | 8h/week `[INFERENCIA]` |
| Code | 12 | 18 dev-days | 12h/week `[INFERENCIA]` |
| Test | 5 | 10 dev-days | 4h/week `[INFERENCIA]` |
| Documentation | 4 | 5 dev-days | 2h/week `[INFERENCIA]` |
| Infrastructure | 3 | 15 dev-days | 3h/week `[INFERENCIA]` |
| Dependencies | 6 | 8 dev-days | 2h/week `[INFERENCIA]` |
| **Total** | **33** | **101 dev-days** | **31h/week** |

### Top 5 by Interest Rate

| Rank | Item | Interest | Principal | Rate |
|------|------|----------|-----------|------|
| 1 | God object `OrderService` (1200 LOC) | 6h/week | 8 days | 0.75 `[HECHO]` |
| 2 | Missing database indexes on 4 tables | 4h/week | 0.5 days | 8.0 `[HECHO]` |
| 3 | No test coverage on payment module | 3h/week | 5 days | 0.6 `[HECHO]` |
| 4 | Rails 6.1 → 7.1 migration pending | 3h/week | 10 days | 0.3 `[HECHO]` |
| 5 | Duplicated validation logic (3 copies) | 2h/week | 1 day | 2.0 `[HECHO]` |

### Quick Wins (< 1 day)
- Add missing database indexes: 0.5 days, saves 4h/week `[HECHO]`
- Remove duplicated validation: 1 day, saves 2h/week `[HECHO]`
- Fix 23 TODO/FIXME items in hot paths: 0.5 days `[HECHO]`
