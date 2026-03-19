# Friction Detector — Sample Output

## Context
Friction analysis for a 12-developer team working on a React + Node.js application.

## Output

### Friction Scorecard

| # | Category | Score | Key Evidence |
|---|----------|-------|-------------|
| 1 | Build friction | 6/10 | 4-min cold start, no incremental builds `[HECHO]` |
| 2 | Complexity friction | 7/10 | 15 functions >200 LOC, avg cognitive complexity 18 `[HECHO]` |
| 3 | Coupling friction | 5/10 | 3 circular dependencies between modules `[HECHO]` |
| 4 | Naming friction | 4/10 | Mix of camelCase and snake_case across modules `[HECHO]` |
| 5 | Pattern friction | 6/10 | 3 different state management approaches in frontend `[HECHO]` |
| 6 | Abstraction friction | 3/10 | Generally appropriate abstraction levels |
| 7 | Review friction | 8/10 | Avg PR review time: 2.5 days; no review guidelines `[INFERENCIA]` |
| 8 | Testing friction | 7/10 | 8-min test suite, 12% flaky rate `[HECHO]` |
| 9 | Deployment friction | 4/10 | Automated but no canary; 20-min total pipeline `[HECHO]` |
| 10 | Communication friction | 6/10 | No ADRs, tribal knowledge on payment module `[INFERENCIA]` |

### Total Friction Index: 56/100

### Friction Multipliers
1. **Review friction (8/10)** multiplies all other friction — slow reviews block all velocity
2. **Testing friction (7/10)** causes developers to skip tests, increasing complexity and coupling
3. **Pattern friction (6/10)** forces context-switching, increasing cognitive load on every task

### Top 3 Actions
1. Establish PR review SLA (24h) and review checklist — reduces review friction from 8 to 4
2. Fix flaky tests and add test sharding — reduces testing friction from 7 to 3
3. Standardize state management approach — reduces pattern friction from 6 to 2
