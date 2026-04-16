# API Surface Analyzer — Sample Output

## Context
Analyzing REST API surface of an Express.js backend.

## Output

### Endpoint Catalog (excerpt)

| Method | Path | Auth | Handler | Request Body | Response |
|--------|------|------|---------|-------------|----------|
| GET | `/api/v1/users` | Bearer JWT | `users.list` | — | `User[]` `[HECHO]` |
| POST | `/api/v1/users` | Bearer JWT + Admin | `users.create` | `CreateUserDTO` | `User` `[HECHO]` |
| GET | `/api/v1/users/:id` | Bearer JWT | `users.getById` | — | `User` `[HECHO]` |
| PUT | `/api/v1/orders/:id` | Bearer JWT | `orders.update` | `any` | `any` `[HECHO]` |
| DELETE | `/api/v1/products/:id` | **None** | `products.delete` | — | `204` `[HECHO]` |

### Consistency Issues

1. **Naming inconsistency**: `/api/v1/users` (plural) vs. `/api/v1/order` (singular) `[HECHO]`
2. **Untyped endpoint**: `PUT /api/v1/orders/:id` accepts `any` — no schema validation `[HECHO]`
3. **Missing auth**: `DELETE /api/v1/products/:id` has no authentication middleware `[HECHO]`
4. **Error format drift**: 3 endpoints return `{ error: string }`, 7 return `{ message: string, code: number }` `[HECHO]`

### Design Score: 62/100
- Consistency: 55 (naming and error format drift)
- Completeness: 70 (most endpoints typed)
- Documentation: 50 (OpenAPI spec is 3 months stale)
- Security: 75 (1 unprotected destructive endpoint)
