# Diagnostic Engine — Sample Output

## Context
Diagnosing a Node.js/Express API that has been experiencing intermittent 502 errors under moderate load (~200 req/s). The team suspects a memory leak but has no metrics to confirm.

## Output

### Evidence-Classified Findings

#### CRITICAL

1. **Unbounded event listener accumulation** `[HECHO]`
   - File: `src/services/notification-service.ts:47`
   - `EventEmitter.on('message', handler)` called on every request without corresponding `removeListener`
   - Blast radius: Memory growth proportional to request count, eventual OOM kill
   - Evidence: MaxListenersExceededWarning in `logs/app-2024-01-15.log`

2. **No connection pool limits on Redis client** `[HECHO]`
   - File: `src/config/redis.ts:12`
   - `createClient()` called without `maxRetriesPerRequest` or connection pool config
   - Blast radius: Under connection pressure, unlimited retry storms amplify load
   - Evidence: Default ioredis config confirmed in `node_modules/ioredis/built/redis/RedisOptions.js`

#### HIGH

3. **Missing health check endpoint** `[HECHO]`
   - No `/health` or `/readiness` route found in `src/routes/`
   - Load balancer likely using TCP checks only, cannot detect application-level degradation
   - Evidence: `grep -r "health\|readiness\|liveness" src/` returned zero results

4. **Synchronous JSON parsing for large payloads** `[INFERENCIA: based on route handler patterns]`
   - File: `src/routes/import.ts:23`
   - `express.json({ limit: '50mb' })` with no streaming parser
   - Inference chain: 50MB JSON parse blocks event loop → other requests queue → 502 from load balancer timeout
   - Would confirm with: Load test targeting `/api/import` with 10MB+ payloads

#### MEDIUM

5. **No graceful shutdown handler** `[HECHO]`
   - `grep -r "SIGTERM\|SIGINT\|graceful" src/` returned zero results
   - In-flight requests are dropped on deploy, contributing to transient 502s
   - Evidence: No process signal handlers in `src/server.ts`

6. **Console.log used instead of structured logging** `[HECHO]`
   - 47 instances of `console.log` across `src/`
   - No log levels, no correlation IDs, no structured fields
   - Evidence: `grep -rc "console.log" src/ | sort -t: -k2 -rn | head -5`

### Risk Matrix

| Finding | Severity | Likelihood | Priority |
|---------|----------|-----------|----------|
| Event listener leak | CRITICAL | Certain | P0 — Fix immediately |
| Redis connection config | CRITICAL | High under load | P0 — Fix immediately |
| No health check | HIGH | Ongoing | P1 — This week |
| Sync JSON parsing | HIGH | Moderate | P1 — This week |
| No graceful shutdown | MEDIUM | Every deploy | P2 — Next sprint |
| No structured logging | MEDIUM | Ongoing | P2 — Next sprint |

### Gaps Declared

- **No runtime metrics**: No Prometheus/StatsD/OpenTelemetry integration found. Memory and CPU usage claims are `[SUPUESTO]` without APM data
- **No load test baseline**: Cannot confirm performance thresholds. Recommendation: run k6 or Artillery against staging
- **Deployment logs unavailable**: Cannot correlate 502 spikes with deploy events. Need access to CI/CD deployment history
