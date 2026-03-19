# Context Optimization — Sample Output

## Context
Planning context loading for an architecture review of a microservices platform with 8 services, shared libraries, and infrastructure code.

## Output

### Context Budget Allocation

| Category | Budget % | Estimated Tokens | Contents |
|----------|---------|-----------------|----------|
| System Context | 15% | ~30K | CLAUDE.md, skill definitions, session rules |
| Task Context | 50% | ~100K | Architecture files, code samples, configs |
| Working Memory | 25% | ~50K | Conversation history, intermediate analysis |
| Reserve | 10% | ~20K | Buffer for unexpected deep-dives |
| **Total** | **100%** | **~200K** | |

### Loading Strategy (Phased)

**Phase 1 — Orientation (first 5 minutes)**
Load index-level files only:
- `README.md` (project overview)
- `docker-compose.yml` (service inventory)
- `package.json` / `go.mod` (dependency overview)
- Directory listing of each service's `src/` folder

Estimated tokens: ~8K. Provides: service names, tech stack, dependency map.

**Phase 2 — Architecture Scan (next 15 minutes)**
For each service, load:
- Entry point file (e.g., `main.go`, `index.ts`)
- API route definitions
- Database migration index

Do NOT load: test files, node_modules, generated code, verbose configs.

Estimated tokens: ~25K. Provides: API surface, service boundaries, data models.

**Phase 3 — Deep Dive (on demand)**
Load specific files only when analyzing a particular concern:
- Security: auth middleware, CORS config, secret management
- Performance: database queries, caching layer, connection pools
- Resilience: retry logic, circuit breakers, health checks

Estimated tokens per deep-dive: ~5-10K. Prune after analysis is captured.

### Session State Template

```json
{
  "session_id": "arch-review-2026-03-17",
  "phase": "Phase 2 — Architecture Scan",
  "services_reviewed": ["auth-service", "api-gateway"],
  "services_pending": ["payment-service", "notification-service", "..."],
  "key_findings": [
    {"service": "auth-service", "finding": "No rate limiting on login endpoint", "evidence": "[CODIGO]"},
    {"service": "api-gateway", "finding": "CORS allows all origins in production", "evidence": "[CODIGO]"}
  ],
  "files_loaded": ["auth-service/src/routes.ts", "api-gateway/src/middleware/cors.ts"],
  "context_used_estimate": "45K tokens",
  "next_action": "Review payment-service API surface and database schema"
}
```

### Handoff Summary (End of Session)

> **Session 1 Summary**: Reviewed 2 of 8 services (auth-service, api-gateway). Found 2 critical security issues: missing rate limiting and overly permissive CORS. Architecture follows a standard API gateway + microservices pattern with RabbitMQ for async communication. PostgreSQL is shared across 3 services (anti-pattern flagged). Next session should start with payment-service and focus on data isolation concerns.

### Context Optimization Rules Applied
- Loaded directory listings before file contents (index-first).
- Pruned docker-compose.yml after extracting service names (context expiry).
- Used table format for findings instead of narrative (information density).
- Reserved 10% budget for unexpected deep-dives during review.
