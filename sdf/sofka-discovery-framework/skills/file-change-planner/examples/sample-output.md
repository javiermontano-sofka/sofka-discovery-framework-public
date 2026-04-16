# File Change Planner — Sample Output

## Context
Adding a rate-limiting middleware to an Express.js API that currently has 12 route files, a shared middleware directory, Redis for caching, and Jest for testing.

## Output

### Change Manifest

| # | File Path | Action | Reason | Risk | Order | Owner |
|---|-----------|--------|--------|------|-------|-------|
| 1 | `package.json` | MODIFY | Add `express-rate-limit` and `rate-limit-redis` dependencies | LOW | 1 | Platform |
| 2 | `src/middleware/rate-limiter.ts` | CREATE | Central rate-limiting middleware with Redis store | MED | 2 | Platform |
| 3 | `src/middleware/index.ts` | MODIFY | Export new rate-limiter middleware | LOW | 3 | Platform |
| 4 | `src/config/rate-limits.ts` | CREATE | Per-route rate limit configuration (window, max, key strategy) | LOW | 2 | Platform |
| 5 | `src/app.ts` | MODIFY | Register global rate-limiter middleware before routes | MED | 4 | Platform |
| 6 | `src/routes/auth.routes.ts` | MODIFY | Apply stricter rate limit to login/register endpoints | MED | 5 | Auth |
| 7 | `src/routes/api.routes.ts` | MODIFY | Apply standard rate limit to API endpoints | LOW | 5 | API |
| 8 | `tests/middleware/rate-limiter.test.ts` | CREATE | Unit tests for rate-limiter middleware | LOW | 3 | Platform |
| 9 | `tests/integration/rate-limit.test.ts` | CREATE | Integration tests verifying Redis-backed limiting | MED | 6 | Platform |
| 10 | `docker-compose.yml` | MODIFY | Ensure Redis service is available in test environment | LOW | 1 | DevOps |
| 11 | `docs/api/rate-limiting.md` | CREATE | Document rate limit headers, quotas, and retry guidance | LOW | 7 | Docs |
| 12 | `.env.example` | MODIFY | Add `RATE_LIMIT_WINDOW_MS` and `RATE_LIMIT_MAX` variables | LOW | 1 | Platform |

### Blast Radius
**MEDIUM (12 files)** — Changes span middleware, routes, config, tests, infra, and docs layers but remain within a single service boundary.

### Execution Order
```
Phase 1 (parallel): package.json, docker-compose.yml, .env.example
Phase 2 (parallel): rate-limiter.ts, rate-limits.ts config, unit tests
Phase 3 (sequential): middleware/index.ts → app.ts → route files
Phase 4: Integration tests
Phase 5: Documentation
```

### Rollback Notes
- Revert `app.ts` middleware registration to disable rate limiting instantly.
- Redis rate-limit keys auto-expire; no data cleanup needed.
- Dependencies can remain installed without side effects if middleware is not registered.

### Evidence Tags
- Files 1-7: `[CODIGO]` — confirmed via codebase grep.
- Files 8-12: `[INFERENCIA]` — deduced from project conventions.
