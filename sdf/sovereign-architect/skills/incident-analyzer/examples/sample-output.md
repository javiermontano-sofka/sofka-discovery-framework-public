# Incident Analyzer — Sample Output

## Context
Post-incident analysis of a 45-minute partial outage where the order processing queue backed up to 12,000 messages after a routine database migration.

## Output

### Incident Timeline

| Time (UTC) | Event | Source | Actor |
|------------|-------|--------|-------|
| 14:00 | Database migration deployed (add index on `orders.status`) | GitHub Actions deploy log `[HECHO]` | CI/CD pipeline |
| 14:00-14:12 | Migration runs, acquires `ACCESS EXCLUSIVE` lock on `orders` table | PostgreSQL lock logs `[HECHO]` | Database |
| 14:03 | Order write queries begin timing out (30s default) | Application error logs `[HECHO]` | System |
| 14:03 | RabbitMQ queue depth begins climbing (consumer cannot ACK) | Grafana dashboard `[HECHO]` | System |
| 14:08 | PagerDuty alert fires: "Queue depth > 5000" | PagerDuty timeline `[HECHO]` | Monitoring |
| 14:15 | On-call engineer acknowledges alert, begins investigation | PagerDuty timeline `[HECHO]` | Engineer A |
| 14:22 | Engineer identifies lock contention via `pg_stat_activity` | Slack thread `[HECHO]` | Engineer A |
| 14:25 | Migration cancelled via `pg_cancel_backend()` | PostgreSQL logs `[HECHO]` | Engineer A |
| 14:27 | Write queries resume, queue begins draining | Application metrics `[HECHO]` | System |
| 14:45 | Queue depth returns to baseline (<100), all-clear declared | Grafana dashboard `[HECHO]` | Engineer A |

### Key Metrics

| Metric | Value |
|--------|-------|
| Time to detect (TTD) | 8 minutes (automated alert) |
| Time to respond (TTR) | 15 minutes (alert to first action) |
| Time to resolve (TTRS) | 25 minutes (alert to migration cancelled) |
| Time to recover (TTRV) | 37 minutes (alert to queue at baseline) |
| Messages queued at peak | ~12,000 |
| Failed orders (customer-visible) | 0 — messages retried successfully `[HECHO]` |

### Contributing Factors

#### 1. Triggering Cause: `ACCESS EXCLUSIVE` Lock During Migration

- **Evidence**: The migration `20240115_add_status_index.sql` uses `CREATE INDEX` without `CONCURRENTLY` `[HECHO]`
- **File**: `migrations/20240115_add_status_index.sql`
- **Impact**: Standard `CREATE INDEX` on a 2M-row table acquires an exclusive lock for the duration of the build (~12 minutes)

#### 2. Enabling Condition: No Migration Review Process

- **Evidence**: No CI check validates migration safety. No `.sqlfluff` or `squawk` config found in the repository `[HECHO]`
- **Impact**: Dangerous migrations can reach production without review for lock implications

#### 3. Enabling Condition: No Query Timeout Shorter Than Lock Duration

- **Evidence**: Database connection pool configured with `statement_timeout: 30000` (30 seconds) `[HECHO]`
- **File**: `src/config/database.ts:18`
- **Impact**: Each blocked query holds a connection for 30 seconds before failing, compounding connection pool exhaustion

#### 4. Detection Gap: No Lock Duration Alert

- **Evidence**: Grafana dashboards monitor query latency and queue depth, but no alert on `pg_stat_activity` for long-running locks `[HECHO]`
- **Impact**: The migration-induced lock ran for 12 minutes before its downstream effect (queue depth) triggered an alert

#### 5. Recovery Friction: No Documented Runbook for Queue Backup

- **Evidence**: No runbook found in `docs/runbooks/` for queue overflow scenarios `[HECHO]`
- **Impact**: Engineer A had to diagnose from first principles rather than following a pre-defined response procedure

### Similar Patterns Found

| Location | Risk | Severity |
|----------|------|----------|
| `migrations/20240102_add_email_unique.sql` | `ADD CONSTRAINT UNIQUE` without concurrent — same lock risk `[HECHO]` | HIGH |
| `src/jobs/data-cleanup.ts:45` | `DELETE FROM orders WHERE created_at < ?` without batching — potential long transaction lock `[HECHO]` | MEDIUM |
| `src/config/database.ts:22` | No `idle_in_transaction_session_timeout` configured — abandoned transactions can hold locks indefinitely `[HECHO]` | MEDIUM |

### Prevention Recommendations

| Factor | Prevention | Type | Effort |
|--------|-----------|------|--------|
| Locking migration | Add `squawk` or `strong_migrations` to CI — reject non-concurrent index creation | Code + CI | S |
| Locking migration | Rewrite migration template to use `CREATE INDEX CONCURRENTLY` by default | Code | S |
| No migration review | Add required PR label `migration-reviewed` for any PR containing SQL migrations | Process | S |
| Long query timeout | Add `lock_timeout: 5000` (5s) to database config — fail fast instead of waiting 30s on locks | Config | S |
| No lock alert | Add Grafana alert on `pg_stat_activity` where `wait_event_type = 'Lock'` and duration > 60s | Monitoring | M |
| No queue runbook | Create runbook: "Queue depth spike" with decision tree for common causes (lock, consumer crash, poison message) | Process | M |
| Bulk delete risk | Refactor `data-cleanup.ts` to batch deletes in chunks of 1000 with 100ms pauses | Code | S |
| Idle transaction risk | Set `idle_in_transaction_session_timeout: 60000` in database config | Config | S |
