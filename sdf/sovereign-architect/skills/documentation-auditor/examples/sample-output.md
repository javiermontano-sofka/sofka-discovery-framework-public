# Documentation Auditor — Sample Output

## Context
Auditing documentation for a Go microservices project.

## Output

### Documentation Inventory

| Category | Files | Last Updated | Status |
|----------|-------|-------------|--------|
| README (root) | 1 | 45 days ago | Outdated `[HECHO]` |
| API docs (Swagger) | 3 | Auto-generated | Current `[HECHO]` |
| Architecture (ADRs) | 8 | 180 days ago | Stale `[HECHO]` |
| Runbooks | 2 | 320 days ago | Critical staleness `[HECHO]` |
| Setup guide | 1 | 90 days ago | Inaccurate `[HECHO]` |

### Accuracy Issues
- Setup guide references `docker-compose up` but project migrated to `docker compose` (v2) `[HECHO]`
- README lists 4 environment variables but `.env.example` has 11 `[HECHO]`
- Architecture diagram shows 3 services but codebase has 5 `[HECHO]`

### Documentation Score: 41/100
- Freshness: 35 (3 of 5 categories stale)
- Accuracy: 40 (setup guide and README have errors)
- Coverage: 45 (no docs for 2 services, no deployment guide)
- Discoverability: 45 (no search, flat file structure)

### Priority Backlog
1. Fix setup guide inaccuracies (blocks new developers)
2. Update README with correct env vars and service list
3. Write runbooks for the 2 new services
4. Archive or update stale ADRs
