# Maintainability Scorer — Sample Output

## Context
Scoring maintainability for a Spring Boot application with 12 modules.

## Output

### Module Maintainability Ranking

| Rank | Module | Complexity | Duplication | Coverage | Modularity | Docs | Naming | **Score** |
|------|--------|-----------|-------------|----------|-----------|------|--------|----------|
| 1 | auth | 85 | 95 | 88 | 90 | 80 | 85 | **87** `[HECHO]` |
| 2 | config | 90 | 90 | 70 | 85 | 75 | 90 | **84** `[HECHO]` |
| 3 | users | 75 | 80 | 82 | 78 | 70 | 80 | **78** `[HECHO]` |
| ... | ... | ... | ... | ... | ... | ... | ... | ... |
| 11 | orders | 30 | 40 | 35 | 25 | 20 | 50 | **33** `[HECHO]` |
| 12 | legacy-import | 20 | 25 | 10 | 15 | 5 | 30 | **18** `[HECHO]` |

### High-Risk Change Zones (Churn x Complexity)

| File | Commits (90d) | Complexity | Coverage | Risk Level |
|------|--------------|-----------|----------|-----------|
| `OrderService.java` | 34 | 52 | 28% | **Critical** `[HECHO]` |
| `PricingEngine.java` | 28 | 41 | 35% | **Critical** `[HECHO]` |
| `ImportController.java` | 22 | 38 | 12% | **High** `[HECHO]` |

### Overall Maintainability: 58/100
- Well-maintained core (auth, config, users): 78-87
- Degraded business logic (orders, pricing): 33-42
- Unmaintainable legacy (legacy-import): 18 — consider rewrite `[INFERENCIA]`
