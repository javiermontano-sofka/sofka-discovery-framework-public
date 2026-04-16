# Rollback Strategy — Sample Output

## Context
Deploying a new authentication flow that replaces session-based auth with JWT tokens across a monolithic Rails application. Involves database migration (new `refresh_tokens` table), code changes (15 controllers), and nginx config updates.

## Output

### Rollback Plan Summary

| Phase | Change | Reversibility | Rollback Time | Owner |
|-------|--------|--------------|---------------|-------|
| 1 | Create `refresh_tokens` table | Fully reversible | 30s | DBA |
| 2 | Deploy JWT middleware (behind feature flag) | Instant via flag | 5s | Backend |
| 3 | Enable JWT for internal users (10%) | Instant via flag | 5s | Backend |
| 4 | Enable JWT for all users (100%) | Instant via flag | 5s | Backend |
| 5 | Remove session-creation code | **PONR** — requires redeploy | 15min | Backend |
| 6 | Drop `sessions` table | **Irreversible** — requires backup restore | 30min+ | DBA |

### Point-of-No-Return
**Phase 5** — After removing session-creation code, rollback requires redeploying the previous version. Before Phase 5, rollback is instantaneous via feature flag.

### Per-Phase Rollback Steps

**Phase 1-4 Rollback (< 1 minute):**
1. Set feature flag `jwt_auth_enabled` to `false` in LaunchDarkly.
2. Verify: `curl -s /health | jq .auth_mode` returns `"session"`.
3. Active JWTs expire naturally (15min TTL). No user disruption.

**Phase 5 Rollback (15 minutes):**
1. Revert merge commit: `git revert <commit-sha>`.
2. Deploy previous version via CI pipeline.
3. Set feature flag to `false`.
4. Verify session creation resumes in logs.

**Phase 6 Rollback (30+ minutes):**
1. Restore `sessions` table from pre-migration backup: `pg_restore --table=sessions backup_20260315.dump`.
2. Redeploy Phase-4 code (session + JWT dual-mode).
3. Set feature flag to `false`.
4. Run data validation: `SELECT count(*) FROM sessions WHERE created_at > NOW() - INTERVAL '1 hour'`.

### Rollback Triggers
- Error rate > 1% on `/api/auth/*` endpoints for 5 consecutive minutes.
- P99 latency > 2s on authentication endpoints.
- Any 500 errors on token refresh endpoint.
- Manual trigger by on-call engineer.

### Evidence Tags
- Phases 1-4: `[CODIGO]` — Feature flag integration confirmed in codebase.
- Phase 5-6: `[INFERENCIA]` — Rollback times estimated from staging benchmarks.
