# CI/CD Analyzer — Sample Output

## Context
Analyzing GitHub Actions pipelines for a monorepo with 3 services.

## Output

### Pipeline Inventory

| Workflow | Trigger | Jobs | Est. Duration | Status |
|----------|---------|------|---------------|--------|
| `ci.yml` | push, PR | 6 | ~12 min | Active `[HECHO]` |
| `deploy-staging.yml` | merge to main | 3 | ~8 min | Active `[HECHO]` |
| `deploy-prod.yml` | manual | 4 | ~15 min | Active `[HECHO]` |
| `nightly-tests.yml` | cron (2am) | 2 | ~45 min | **Failing 3 weeks** `[HECHO]` |

### Reliability Issues
1. **Floating action versions**: `actions/checkout@main` used instead of pinned SHA — supply chain risk `[HECHO]`
2. **No retry logic**: Flaky integration tests fail ~15% of runs with no automatic retry `[INFERENCIA]`
3. **Neglected nightly pipeline**: `nightly-tests.yml` has been red for 21 days with no action `[HECHO]`

### Speed Bottlenecks
- **Critical path**: lint → build → test (sequential) = 12 min; lint and build could run in parallel = ~8 min `[INFERENCIA]`
- **Missing cache**: `node_modules` reinstalled on every run (~2 min waste per job) `[HECHO]`
- **No test sharding**: 800 tests run in single job; splitting to 4 shards would reduce from 6 min to ~2 min `[INFERENCIA]`

### Deployment Maturity: Level 2/4
- Staging: automated on merge (good)
- Production: manual trigger with no approval gate (risk) `[HECHO]`
- Rollback: manual Kubernetes rollback; no automated rollback on health check failure
- Feature flags: not integrated into deployment pipeline
