# Performance Profiler — Sample Output

## Context
Profiling a Django REST API experiencing slow response times on list endpoints.

## Output

### N+1 Query Findings

| Location | Pattern | Queries/Request | Fix |
|----------|---------|----------------|-----|
| `views/orders.py:34` | `order.customer.name` in serializer loop | ~50 per page `[HECHO]` | Add `select_related('customer')` |
| `views/products.py:67` | `product.categories.all()` in list view | ~30 per page `[HECHO]` | Add `prefetch_related('categories')` |
| `tasks/reports.py:112` | `user.orders.count()` in report generator | ~500 per run `[HECHO]` | Use `annotate(order_count=Count('orders'))` |

### Algorithm Issues

| Location | Issue | Complexity | Fix |
|----------|-------|-----------|-----|
| `utils/matching.py:45` | Nested loop for tag matching | O(n*m) `[HECHO]` | Use set intersection O(n+m) |
| `services/export.py:89` | String concatenation in loop (10k+ items) | O(n^2) `[HECHO]` | Use `''.join()` or StringIO |

### Resource Issues
- **Missing timeout**: HTTP client to payment gateway has no timeout configured `[HECHO]`
- **Unbounded query**: `GET /api/logs` returns all records with no pagination `[HECHO]`
- **No connection pool**: Redis client creates new connection per request `[HECHO]`

### Estimated Impact
Fixing N+1 queries alone would reduce average response time from ~800ms to ~120ms for list endpoints `[INFERENCIA]`.
