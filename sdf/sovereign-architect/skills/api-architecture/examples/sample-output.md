# API Architecture — Sample Output

## Context
A platform with 12 REST APIs serving mobile, web, and third-party consumers needs an API governance framework and design review.

## Output: API Design Review (excerpt)

| Endpoint | Issue | Severity | Recommendation |
|----------|-------|----------|---------------|
| `GET /getUsers` | Verb in resource name | Medium | Rename to `GET /users` |
| `POST /users/delete` | Wrong HTTP method | High | Use `DELETE /users/{id}` |
| `GET /users?page=5` | Offset pagination | Low | Migrate to cursor-based: `?after=cursor` |
| `POST /orders` | No idempotency key | High | Add `Idempotency-Key` header support |
| Error responses | Inconsistent format | High | Standardize to RFC 7807 Problem Details |
| All endpoints | No rate limit headers | Medium | Add `X-RateLimit-Limit/Remaining/Reset` |

## Output: API Governance Standards

### Naming Conventions
```
Resources:  plural nouns, kebab-case  →  /payment-methods
Actions:    POST sub-resource          →  POST /orders/{id}/cancel
Filters:    query parameters           →  ?status=active&sort=-created_at
Expansion:  ?include=                  →  ?include=items,customer
Fields:     ?fields=                   →  ?fields=id,name,email
```

### Versioning Strategy
```
Method:     URI path prefix (/v1/, /v2/)
Lifecycle:  v1 stable → v2 beta → v2 stable → v1 deprecated → v1 sunset
Deprecation notice:  Minimum 90 days via Sunset header + changelog
Compatibility rule:  Minor versions are additive-only (new fields, endpoints)
Breaking changes:    New major version required, old version maintained
```

### Rate Limiting Design
| Tier | Limit | Burst | Scope | Response at Limit |
|------|-------|-------|-------|------------------|
| Free | 100 req/min | 20 | Per API key | 429 + Retry-After header |
| Standard | 1,000 req/min | 200 | Per API key | 429 + Retry-After header |
| Enterprise | 10,000 req/min | 2,000 | Per API key | 429 + Retry-After header |
| Internal | 50,000 req/min | 5,000 | Per service | Circuit breaker + alert |

### Error Response Standard (RFC 7807)
```json
{
  "type": "https://api.example.com/errors/validation-failed",
  "title": "Validation Failed",
  "status": 422,
  "detail": "The request body contains 2 validation errors",
  "instance": "/orders/abc-123",
  "errors": [
    { "field": "quantity", "message": "must be greater than 0" },
    { "field": "sku", "message": "product not found" }
  ]
}
```
