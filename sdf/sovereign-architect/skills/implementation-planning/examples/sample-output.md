# Implementation Planning — Sample Output

## Context
Planning the migration of a REST API from Express.js to Fastify to improve throughput, while maintaining backward compatibility for 3 consuming clients during transition.

## Output

### Phase Decomposition

```
Phase 1: Foundation (3 days)
  └─→ Phase 2: Parallel Running (4 days)
       └─→ Phase 3: Client Migration (5 days, per-client)
            └─→ Phase 4: Cleanup (2 days)
```

---

### Phase 1: Foundation

**Objective**: Stand up Fastify alongside Express without affecting production traffic.

**Entry criteria**: All existing tests pass, current Express app baseline performance recorded.

**Create:**
- `src/server-fastify.ts` — Fastify bootstrap with equivalent middleware chain
- `src/adapters/express-to-fastify.ts` — Request/response adapter for shared route handlers
- `tests/integration/fastify-parity.test.ts` — Parity test suite comparing Express vs. Fastify responses

**Modify:**
- `src/config/index.ts` — Add `SERVER_ENGINE` feature flag (default: `express`)
- `docker-compose.yml` — Add Fastify service on port 3001 for parallel testing
- `package.json` — Add `fastify`, `@fastify/cors`, `@fastify/helmet` dependencies

**Checkpoint:**
- `npm test` exits 0
- Fastify server starts and responds on port 3001
- Parity tests confirm identical responses for all 15 endpoints

**Rollback:** Delete `src/server-fastify.ts` and adapter. Remove Fastify dependencies. Revert config. Total rollback time: 5 minutes.

---

### Phase 2: Parallel Running

**Objective**: Route shadow traffic to Fastify and compare responses.

**Entry criteria**: Phase 1 checkpoint passed. Fastify parity tests green.

**Create:**
- `src/middleware/shadow-traffic.ts` — Duplicate incoming requests to Fastify, log response diffs
- `scripts/compare-responses.ts` — Analyze shadow traffic logs for discrepancies

**Modify:**
- `src/server.ts` — Mount shadow traffic middleware when `SHADOW_TRAFFIC=true`
- `monitoring/dashboards/migration.json` — Grafana dashboard comparing Express vs. Fastify latency and error rates

**Checkpoint:**
- Shadow traffic running for 48 hours with <0.1% response divergence
- Fastify p99 latency within 20% of Express (expected to be lower)
- Zero errors unique to Fastify

**Rollback:** Set `SHADOW_TRAFFIC=false`. No client impact — shadow traffic is fire-and-forget. Rollback time: 1 config change, <1 minute.

---

### Phase 3: Client Migration

**Objective**: Migrate clients one-by-one to Fastify endpoint.

**Entry criteria**: Phase 2 shadow traffic shows <0.01% divergence over 48 hours.

**Modify:**
- Client A DNS/config: Point to Fastify endpoint (canary 10% → 50% → 100%)
- Client B DNS/config: Same progression after Client A stable for 24 hours
- Client C DNS/config: Same progression after Client B stable for 24 hours

**Checkpoint (per client):**
- Error rate does not increase vs. baseline
- Latency within SLA (p99 < 200ms)
- Client team confirms no behavioral changes

**Rollback:** Revert client DNS/config to Express endpoint. Rollback time: <2 minutes per client. Blast radius: Only the client being migrated.

---

### Phase 4: Cleanup

**Objective**: Remove Express and dual-running infrastructure.

**Entry criteria**: All 3 clients on Fastify for 1 week with zero incidents.

**Delete:**
- `src/server-express.ts` — Legacy Express server
- `src/adapters/express-to-fastify.ts` — No longer needed
- `src/middleware/shadow-traffic.ts` — Migration complete

**Modify:**
- `package.json` — Remove `express`, `cors`, `helmet` dependencies
- `src/config/index.ts` — Remove `SERVER_ENGINE` flag
- `docker-compose.yml` — Remove Express service definition

**Checkpoint:**
- `npm test` exits 0
- Build size reduced (Express deps removed)
- Single server on port 3000

**Rollback:** `git revert` the cleanup commit. Re-deploy with Express. Rollback time: ~10 minutes.

---

### Acceptance Criteria

- All 15 endpoints respond identically on Fastify as on Express `[HECHO: parity tests]`
- p99 latency improved or unchanged `[HECHO: monitoring dashboard]`
- Zero downtime during migration `[HECHO: parallel running + canary]`
- Express fully removed from dependencies `[HECHO: package.json audit]`
