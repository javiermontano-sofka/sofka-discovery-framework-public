# Codebase Metrics — Sample Output

## Context
Measuring structural quality of a Django backend with 45 modules.

## Output

### Complexity Hotspots (Top 5)

| Rank | Function | File | Cyclomatic | Cognitive | Churn (30d) |
|------|----------|------|-----------|-----------|-------------|
| 1 | `process_order()` | `orders/services.py:142` | 47 | 62 | 18 commits `[HECHO]` |
| 2 | `calculate_pricing()` | `pricing/engine.py:89` | 38 | 44 | 12 commits `[HECHO]` |
| 3 | `sync_inventory()` | `inventory/tasks.py:201` | 31 | 39 | 8 commits `[HECHO]` |
| 4 | `validate_payment()` | `payments/validators.py:55` | 28 | 35 | 15 commits `[HECHO]` |
| 5 | `generate_report()` | `reports/builders.py:33` | 26 | 30 | 3 commits `[HECHO]` |

### Module Health Scores

| Module | Complexity | Coupling | Size | Test Ratio | Health |
|--------|-----------|----------|------|-----------|--------|
| `auth` | 85 | 90 | 88 | 92 | **89/100** |
| `users` | 78 | 82 | 85 | 88 | **83/100** |
| `orders` | 35 | 45 | 50 | 40 | **42/100** |
| `pricing` | 40 | 55 | 60 | 35 | **47/100** |
| `inventory` | 50 | 48 | 55 | 45 | **49/100** |

### Key Finding
The `orders` module is both the most complex and most frequently changed — it is the highest-priority refactoring target `[INFERENCIA]`.
