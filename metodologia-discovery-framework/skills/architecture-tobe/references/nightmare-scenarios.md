# Nightmare Scenarios: Detailed Monitoring & Acceptance Criteria

## 1. Ghost Transaction (Data Loss)

**Problem**: Payment commits in Payment Service but fails in downstream system. Money disappears from one system, not another.

**Trigger Conditions**:
- Payment Service crashes post-commit but before publishing event to message bus
- ACL adapter sends payment to legacy, response is lost (network timeout)
- Saga compensation fails (unable to reverse partial transaction)
- Probability: Medium (distributed system inherent risk)

**Mitigations (Defense in Depth)**:
- **Saga Pattern (Orchestration)**: Compensating transactions rollback failures atomically
- **Outbox Pattern**: Write transaction + event in same DB transaction (atomic)
- **Idempotency Keys**: Every payment POST includes UUID key. Retries produce same result
- **Reconciliation Service**: Daily batch validation: sum(service_a.transactions) = sum(service_b.transactions)
- **Dead Letter Queue**: Failed Saga steps captured for manual review
- **Immutable Audit Log**: All transaction events in append-only table

**Monitoring & Early Detection**:
```
Alert: TRANSACTION_CONSISTENCY_DRIFT
  Condition: SUM(service_a.transactions) != SUM(service_b.transactions)
  Threshold: Alert if difference >$0 for 30+ seconds
  Action: Page on-call engineer; reconciliation service investigates
  Recovery: Determine root cause; trigger compensation manually if needed
```

**Acceptance Criteria (Go/No-Go)**:
- [ ] Reconciliation service runs daily; alerts configured
- [ ] Saga compensation tested for top 10 failure scenarios (chaos test)
- [ ] Idempotency keys validated on all payment endpoints
- [ ] Outbox pattern implemented and tested
- [ ] Audit log verified for completeness

---

## 2. Schema Drift (Data Corruption)

**Problem**: Legacy schema changes unannounced. Modern services unaware. Data inconsistency cascades.

**Trigger Conditions**:
- Legacy team adds optional field without notifying integration team
- Data type changes (e.g., date format) without versioning
- ACL parser assumes fixed-width field, but legacy changes field size
- Probability: High (legacy systems change frequently, docs lag reality)

**Mitigations**:
- **Consumer-Driven Contracts (CDC)**: Contract tests fail if legacy schema deviates
- **Schema Registry**: Centralized versioning (Confluent or custom). Messages include schema ID
- **Data Fingerprinting**: Hash critical fields at ACL layer. Monitor mismatches
- **Validation Layer in ACL**: All data validated before translation. Rejects malformed records
- **Schema versioning in ACL**: Version map of legacy schema changes

**Monitoring**:
```
Alert: SCHEMA_VALIDATION_FAILURE
  Condition: ACL rejects >5 records/minute due to schema mismatch
  Threshold: 5 rejections/minute
  Action: Alert on-call; investigate legacy schema change
  Recovery: Update ACL schema mapping; backfill affected records

Alert: DATA_FINGERPRINT_MISMATCH
  Condition: Hash of translated data != expected hash
  Threshold: Any mismatch
  Action: Compare before/after data; determine root cause
  Recovery: Rollback affected batch; reconciliation corrects
```

**Acceptance Criteria**:
- [ ] Consumer-driven contracts for all legacy integration points
- [ ] Schema Registry operational; all messages include schema version
- [ ] ACL validation rejects invalid data; DLQ captures rejections
- [ ] Data fingerprinting on critical fields
- [ ] Contract tests fail if legacy schema changes

---

## 3. Auth Service Unavailable (Complete Outage)

**Problem**: OAuth2 provider down. API Gateway cannot validate tokens. All requests rejected. Platform offline.

**Trigger Conditions**:
- Auth Service database fails (no replica available)
- Network partition isolates Auth Service from API Gateway
- Auth Service deployed with bug (cascading restart loop)
- External identity provider becomes unreachable
- Probability: Low; Impact: Critical

**Mitigations**:
- **Token Caching + Grace Period**: API Gateway caches valid tokens. If down, allow tokens up to 5 min past expiry (security tradeoff documented in ADR)
- **Auth Service Redundancy**: Multi-replica (N+2), cross-AZ. Synchronous replication (RTO <1 min)
- **Circuit Breaker**: Latency >5s → fall back to cached credentials. Does NOT fail open (reject if no cache)
- **Emergency Mode**: Admin override token (pre-issued, audit-logged, time-limited 1 hour)
- **Identity Provider Redundancy**: Secondary LDAP/AD with sync mechanism

**Monitoring**:
```
Alert: AUTH_SERVICE_LATENCY_SPIKE
  Condition: P99 >3 seconds, sustained 10+ seconds
  Action: Page on-call; check database/network health
  Recovery: Promote read replica; restart; failover to secondary region

Alert: TOKEN_CACHE_HIT_RATE_HIGH
  Condition: Cache hits >50% for 2+ minutes
  Action: Alert on-call; investigate Auth Service
  Recovery: Enable Emergency Mode if necessary; restore ASAP

Alert: IDENTITY_PROVIDER_UNREACHABLE
  Condition: 3+ connection timeouts in 30 seconds
  Action: Switch to secondary provider; alert team
  Recovery: Restore primary; resync secondary
```

**Acceptance Criteria**:
- [ ] Token caching at API Gateway (5-min grace period)
- [ ] Auth Service multi-replica operational
- [ ] Circuit breaker tested (5s threshold)
- [ ] Emergency Mode procedure documented; tokens pre-generated
- [ ] Identity Provider failover tested
- [ ] Chaos test: Auth crash → platform stays up (degraded)

---

## 4. Cascade Failure (Ripple Effect)

**Problem**: One service crashes. Message bus backs up. Next service queue fills. Memory exhausted. Services cascade down.

**Trigger Conditions**:
- Service OOM crash, stops consuming messages
- Database connection pool exhausted (connection leaks)
- Slow endpoint causes timeouts; retry storms → resource exhaustion
- Error rate spikes to 100%; caller timeouts propagate
- Probability: Medium; Impact: High (multiple services down)

**Mitigations**:
- **Circuit Breaker**: 5 consecutive errors in 30s → circuit opens → fail fast (500ms) instead of timeout (30s)
- **Bulkhead Pattern**: Isolated thread pools per dependency (e.g., 10 threads for message bus, 10 for DB, 10 for downstream service)
- **Rate Limiting + Backpressure**: Service mesh enforces limits (e.g., 100 req/sec per client). Excess queued or rejected (429)
- **Service Mesh Resilience**: Automatic retries (3x, exponential backoff: 1s, 2s, 4s). Max <10s. Then fail fast
- **Consumer Lag Monitoring**: If lag >10K messages, alert. Consumer slow or crashed

**Monitoring**:
```
Alert: CIRCUIT_BREAKER_OPEN
  Condition: Any service circuit breaker opens
  Action: Alert on-call; check service health
  Recovery: Restart service; monitor; reopen circuit manually if stable

Alert: CONSUMER_LAG_HIGH
  Condition: Consumer group lag >10K messages for 5+ minutes
  Action: Alert on-call; check consumer (CPU, memory, network)
  Recovery: Restart consumer; scale up replicas

Alert: THREAD_POOL_EXHAUSTION
  Condition: Thread pool usage >90% for 30+ seconds
  Action: Check dependent service health
  Recovery: Scale up; check slow dependencies; clear stuck threads

Alert: REQUEST_LATENCY_SPIKE
  Condition: P99 >1 second (baseline <100ms) for 10+ seconds
  Action: Investigate slow service
  Recovery: Profile; identify bottleneck; scale or optimize
```

**Acceptance Criteria**:
- [ ] Circuit breakers on all inter-service calls
- [ ] Bulkhead pattern tested (isolated thread pools)
- [ ] Rate limiting at API Gateway
- [ ] Service mesh retry policy configured
- [ ] Consumer lag monitoring operational
- [ ] Chaos test: crash one service → others degrade gracefully

---

## 5. Legacy System Corruption

**Problem**: Buggy ACL adapter sends malformed data to legacy system. Database corrupted or producing wrong results.

**Trigger Conditions**:
- ACL logic bug (off-by-one in field offset for fixed-width records)
- Wrong data type sent (string where legacy expects integer)
- Partial transaction (network disconnect mid-transmission)
- Buffer overflow (exceeds maximum record size)
- Probability: Low; Impact: Critical (legacy data corrupted, hard recovery)

**Mitigations**:
- **Pre-flight Validation**: ACL validates outbound data against legacy schema before sending. Rejects malformed records
- **Dry-Run Mode**: Process real data without writing. Compare output to expected format. Only promote to production if match
- **Rollback Capability**: Automated database snapshots (hourly). Restore to pre-corruption point. RTO <1 hour, RPO <1 hour
- **Change Control**: All ACL changes require peer review + integration tests + dry-run before production
- **Data Validation Service**: Post-transfer read-back verification. Alert on mismatch

**Monitoring**:
```
Alert: ACL_VALIDATION_FAILURE
  Condition: >10 records fail pre-flight validation per minute
  Action: Quarantine ACL adapter (no more writes)
  Recovery: Fix root cause; dry-run test; redeploy

Alert: DATA_VALIDATION_MISMATCH
  Condition: Post-transfer sent != received
  Threshold: Any mismatch
  Action: Trigger rollback procedure
  Recovery: Restore from snapshot; replay verified transactions

Alert: ACL_ADAPTER_CRASH
  Condition: Non-zero exit code
  Action: Page on-call immediately
  Recovery: Check for in-flight writes; rollback if yes; restart if no
```

**Acceptance Criteria**:
- [ ] Pre-flight validation in ACL (all outbound data validated)
- [ ] Dry-run mode operational; output matches expectations
- [ ] Rollback procedure documented and tested
- [ ] Change control enforced (review, integration tests, dry-run)
- [ ] Post-transfer data validation service
- [ ] Chaos test: inject bad data → pre-flight catches it (no corruption)
