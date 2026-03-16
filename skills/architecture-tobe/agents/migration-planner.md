# Migration Planner Agent

## Purpose

Plans 4-phase Strangler Fig migration from approved C4 L2 architecture + legacy system inventory. Per phase: scope, duration, risk, rollback strategy, success criteria. Identifies "seams" in legacy system where modern services can intercept traffic. Generates migration risk matrix and canary/shadow testing strategy per phase.

## Input Requirements

**From Architect Agent**:
- C4 L2 architecture (which services will replace which legacy functions)
- Service boundaries (DDD domains mapped to services)
- Data ownership model (which data owned by which service)

**From Phase 1**:
- Legacy system inventory (technologies, integration points, maintenance burden)
- Current performance metrics (latency, throughput, uptime)
- Data volumes (how much data to migrate)
- Team composition and skill gaps

**From Phase 3**:
- Selected scenario (Conservative/Moderate/Aggressive) → informs migration velocity
- Timeline constraints
- Budget constraints

## 4-Phase Migration Plan

### Phase 1: Assessment & Wrapping (Months 1–2)

**Goal**: Understand legacy systems in detail; establish baseline; begin isolation with adapters.

**Scope Activities**:
1. **Legacy System Documentation**: Deep technical archaeology
   - Interview legacy team (tribal knowledge capture)
   - Reverse-engineer data schemas (current version of truth)
   - Document all integration points (what systems call legacy, what legacy calls)
   - Identify all implicit business rules (e.g., "if amount > $10K, requires manager approval")
   - Map current performance baselines (latency, throughput, availability)

2. **Seam Identification**: Find intercept points for Strangler Fig
   - Map all inbound API calls to legacy (customers, partners, internal systems)
   - Identify which calls can be routed to modern services first
   - Example: "Account Query" can be routed to new Account Service; "Payment Processing" stays on legacy (will be migrated later)
   - Document call volumes + latency (helps prioritize what to migrate first)

3. **DLL Sidecar Pattern** (if legacy is COM/DLL-based):
   - Wrap legacy COM/DLL in process bridge
   - Expose wrapped legacy via REST API or message queue
   - Allows modern services to call legacy without COM dependencies
   - Benefit: loosens coupling; easier to test modern services in isolation

4. **ACL Adapter Skeleton**: Begin translating modern API ↔ legacy protocol
   - For each integration point identified, create ACL adapter
   - Map JSON (modern) ↔ fixed-width (legacy) ↔ SOAP ↔ EDI
   - Don't implement full logic yet (Phase 2); just establish translation skeleton
   - Example: Account API (modern) → Account ACL → COBOL copybook (legacy)

5. **Monitoring Baseline**: Establish current-state health metrics
   - Legacy latency distribution (P50, P99)
   - Legacy error rates (transaction failures, timeouts)
   - Legacy data consistency gaps (known issues, workarounds)
   - Team oncall frequency (how often legacy team paged)

**Deliverables**:
- Legacy documentation (20–30 page technical report)
- Seam identification map (diagram showing intercept points)
- DLL Sidecar running (if applicable)
- ACL adapter structure (code skeleton, not fully functional)
- Monitoring dashboard (baseline metrics visible)

**Duration**: 2 months (assuming 2–3 engineers)

**Risk Assessment**:
- **Understand-wrong risk** (Low): Documentation wrong, missed integration points
  - Mitigation: Cross-functional review (legacy team + modern architects); shadow interviews with multiple team members
- **Sidecar stability risk** (Low): Wrapper crashes, legacy calls fail
  - Mitigation: Wrap one function at a time; test thoroughly before exposing to production
- **Monitoring blind spot** (Low): Baseline metrics incomplete
  - Mitigation: Compare metrics to legacy team's expectations (culture shock = missed data)

**Go/No-Go Criteria**:
- [ ] Documentation completeness: all integration points mapped
- [ ] Seams identified and validated (legacy team agrees)
- [ ] DLL Sidecar tested (wraps legacy successfully, responds to test calls)
- [ ] ACL adapter structure in place (ready for Phase 2 logic)
- [ ] Monitoring dashboard operational (baseline metrics collected for 1 week)

**Rollback Strategy**: Nothing deployed to production yet (no rollback needed). If documentation is wrong, revise and continue.

---

### Phase 2: Modern Service Introduction & Canary (Months 3–5)

**Goal**: Deploy first modern microservice; validate with canary traffic; establish Strangler Fig routing.

**Scope Activities**:
1. **MVP Microservice Deployment** (typically Auth Service):
   - Implement Auth Service (OAuth2, RBAC, session management)
   - Deploy to production (Kubernetes, initial 0% traffic)
   - Database: PostgreSQL, schema for users/roles/sessions
   - Replicas: N+1 (at least 2 instances for HA)

2. **Strangler Fig Routing**:
   - API Gateway updated to route subset of traffic to Auth Service
   - Initial canary: 1% traffic to new service
   - Remaining 99% continues to legacy (LDAP)
   - Decision logic: by feature flag, user cohort, or random sampling

3. **Parallel Processing + Result Comparison**:
   - ALL auth requests processed by BOTH legacy + modern (if possible)
   - Results compared (should be identical)
   - Discrepancies logged to audit trail (enables debugging without impacting users)
   - Example: Auth request → process on Auth Service AND legacy LDAP → compare tokens → log if different

4. **Shadow Mode Validation**:
   - Shadow mode: modern service processes request but doesn't apply results
   - User sees legacy response (safe)
   - Modern response logged (modern team debugs)
   - Duration: run in shadow mode for 1–2 weeks before canary

5. **Canary Deployment**:
   - Gradually increase traffic to Auth Service (1% → 5% → 10% → 25%)
   - Monitor error rate, latency, data consistency
   - Each step: wait 24 hours, review metrics, decide to proceed or rollback
   - Success criteria: error rate same or lower than legacy, latency acceptable

6. **Legacy Fallback**:
   - If Auth Service error rate >2% (baseline), auto-fallback to legacy
   - Circuit breaker on API Gateway (fail to legacy if modern service down)
   - Zero impact to users (transparent fallback)

**Deliverables**:
- Auth Service in production (0% traffic initially, canary to 10%+)
- Strangler Fig routing rules in place
- Parallel processing + result comparison logs
- Monitoring dashboard (Auth Service latency, error rate, canary traffic %)
- Shadow mode validation report (any discrepancies found/resolved)

**Duration**: 3 months (2 sprint cycles: MVP build + hardening + canary)

**Risk Assessment**:
- **Canary causes production outage** (Low): Modern service bug crashes customers
  - Mitigation: Start at 1%, monitor closely, auto-fallback if error rate >2%
  - Rollback: flip traffic back to legacy (instantaneous, tested regularly)
- **Data sync discrepancy** (Medium): Modern service has different user list than legacy
  - Mitigation: Parallel processing catches discrepancies; shadow mode proves it before cutover
  - Resolution: ACL adapter or legacy data clean-up
- **Latency regression** (Low): Auth Service slower than legacy
  - Mitigation: Performance testing in staging before canary; optimize based on canary metrics
  - Threshold: P99 latency must not exceed legacy + 20%

**Go/No-Go Criteria**:
- [ ] Auth Service deployed and running
- [ ] Shadow mode validation: all requests produced same result as legacy (zero discrepancies)
- [ ] Canary progressed to 10% without issues
- [ ] Fallback tested: toggle traffic back to legacy without user impact
- [ ] Monitoring confirmed: Auth Service latency + error rates acceptable

**Rollback Strategy**: If canary metrics degrade (error rate >2%), immediate fallback to legacy (1–2 minute decision window). All traffic reverts to legacy; Auth Service crash doesn't impact users.

---

### Phase 3: Capability Migration & Stabilization (Months 6–12)

**Goal**: Migrate remaining business capabilities; stabilize all services; achieve full feature parity with legacy.

**Scope Activities**:
1. **Service Deployment Wave**:
   - Wave 1 (Month 6): Account Service (account management, balance queries)
   - Wave 2 (Month 8): Payment Service (payment processing, transactions)
   - Wave 3 (Month 10): Notification Service (email, SMS, in-app alerts)
   - Each service: deploy to staging → canary 10% → scale to 50% → scale to 100%

2. **Saga Orchestration**:
   - Transaction Orchestrator deployed (coordinates multi-step transactions)
   - Saga pattern implemented: debit account → process payment → send notification
   - Compensation logic tested: if payment fails, reverse debit
   - Outbox pattern ensures no message loss (events guaranteed to publish)

3. **Event Streaming** (Kafka):
   - Kafka cluster deployed
   - All services publish events (PaymentProcessed, AccountDebited, etc.)
   - Event consumers: reconciliation service, analytics, notification service
   - Event retention: 30 days (allows replay, debugging)

4. **Data Migration**:
   - Phase-by-phase: migrate accounts in cohorts (1% → 5% → 25% → 100%)
   - ACL adapter validates all migrated data (schema matches legacy)
   - Reconciliation service compares pre-migration and post-migration data (audit)
   - Example: migrate 1% of accounts (A–D names) to modern Account Service → validate 1 week → migrate next 5%

5. **Parallel Run**:
   - Legacy and modern systems run in parallel (overlap period)
   - All writes go to both systems (legacy + modern)
   - Reads from modern (source of truth)
   - Reconciliation nightly: legacy and modern data synced
   - Duration: 2–4 weeks to ensure no data loss

6. **Reconciliation Service**:
   - Daily batch: sum(modern.transactions) = sum(legacy.transactions)
   - Any mismatch: alert, investigate, manual correction
   - Purpose: catch bugs in data migration before cutover

**Deliverables**:
- Account Service deployed and canary to 100%
- Payment Service deployed and canary to 100%
- Notification Service deployed (monitoring alerts now via new service)
- Saga Orchestrator operational (tested with failure scenarios)
- Kafka event streaming operational
- 50%+ of accounts/transactions migrated to modern system
- Reconciliation service running daily (zero open mismatches)

**Duration**: 6 months (3 months per service, parallel activities)

**Risk Assessment**:
- **Data loss during migration** (Medium): Account migrated to modern, then discrepancy discovered, data unrecoverable
  - Mitigation: ACL validation before migration; reconciliation catches issues; rollback plan (restore from backup, re-migrate)
  - Acceptance: zero tolerance for undetected data loss
- **Saga compensation failure** (Medium): Payment processed, account debit fails, payment not reversed
  - Mitigation: Compensation logic tested exhaustively; manual recovery procedure for stuck sagas
  - Monitoring: stuck saga alert (saga in-progress >10min)
- **Reconciliation lag** (Low): Discrepancy detected 1 week after migration (hard to trace root cause)
  - Mitigation: Reconciliation runs nightly (not weekly); alert within 24 hours
  - Debugging: event replay helps identify exact point of divergence

**Go/No-Go Criteria**:
- [ ] All 3 core services deployed and handling 100% of traffic (or 50%+ canary success)
- [ ] Saga pattern tested: all failure scenarios (component failure, network timeout) → compensation works
- [ ] Data migration: 50%+ of data migrated with zero detected discrepancies
- [ ] Parallel run: 2 weeks of dual-write without data sync issues
- [ ] Reconciliation: zero open mismatches for 1 week
- [ ] Incident response tested: simulate service crash → team responds within SLA

**Rollback Strategy**: If critical issue found, canary rollback (revert traffic to legacy) OR full rollback (restore from point-in-time backup, re-migrate). Rollback tested monthly during this phase.

---

### Phase 4: Legacy Sunset & Optimization (Months 13+)

**Goal**: Retire legacy systems or transition to read-only; archive historical data; optimize costs; capture learnings.

**Scope Activities**:
1. **Legacy Transition to Read-Only** (or Decommissioning):
   - Stop writing to legacy (all writes go to modern system)
   - Legacy serves reads only (historical queries, compliance searches)
   - ACL still routes legacy read queries (backward compatibility for any legacy-dependent systems)
   - OR: fully decommission legacy if no longer needed (retire infrastructure)

2. **Historical Data Archival**:
   - Export all legacy transaction history to data lake (S3)
   - Searchable via Elasticsearch (regulatory queries, audits)
   - Retain in PostgreSQL for performance (hot data)
   - Archive cold data (>6 months old) to S3 (cheaper than hot storage)

3. **Legacy Infrastructure Decommissioning**:
   - Shut down legacy mainframe/systems
   - Cancel licensing, maintenance contracts
   - Recover infrastructure costs (contribute to ROI)
   - Document lessons learned (what worked, what didn't)

4. **Performance & Cost Optimization**:
   - Modern system has been running for 3+ months (real usage data)
   - Identify optimization opportunities: unused features, bottlenecks, over-provisioned resources
   - Implement optimizations: caching improvements, database tuning, right-sizing K8s nodes
   - Expected OpEx reduction: 20–40% vs legacy (due to efficiency gains, license consolidation)

5. **Knowledge Transfer & Runbooks**:
   - Document incident response procedures (top 10 failure scenarios)
   - Runbooks for common operations (restart service, data reconciliation, failover)
   - Train ops team (workshops, on-call shadowing)

6. **Post-Implementation Review**:
   - Retrospective: Did we hit cost, timeline, capability targets from Phase 3?
   - What went well, what was hard
   - Document improvements for next modernization project
   - Celebrate team achievements

**Deliverables**:
- Legacy system transitioned to read-only (or fully decommissioned)
- Historical data archived to data lake (searchable, compliant with retention policies)
- Modern system handling 100% of new transactions
- Cost optimization complete (target 30% OpEx reduction vs legacy)
- Runbooks documented and team trained
- Post-implementation review completed

**Duration**: 3+ months (continuous optimization; some items ongoing)

**Risk Assessment**:
- **Legacy still needed** (Low): Months later, someone discovers legacy system still required (compliance requirement missed)
  - Mitigation: ACL maintains legacy in read-only mode (safety net)
  - Acceptance: read-only legacy can run indefinitely (no maintenance burden)
- **OpEx reduction doesn't materialize** (Low): Hoped for 30% savings, realize only 15%
  - Mitigation: Modern system operational complexity higher than expected (requires more ops staff)
  - Resolution: more aggressive optimization, or accept higher ops cost as trade-off for capability/reliability gains

**Go/No-Go Criteria**:
- [ ] Legacy transitioned to read-only (all writes fail over to modern system)
- [ ] Historical data searchable via Elasticsearch (compliance queries work)
- [ ] Modern system processing 100% of new transactions (legacy only handles legacy reads)
- [ ] Team trained on runbooks; on-call confident handling incidents
- [ ] Cost analysis completed; OpEx reduction captured (or documented why lower than expected)
- [ ] Post-implementation review completed; lessons learned documented

**Rollback Strategy**: Read-only legacy can remain indefinitely (low risk, low cost). If modern system critical issue discovered after legacy decommissioned, recover from backups and replay transactions.

---

## Migration Risk Matrix

| Phase | Risk | Mitigation | Confidence | Residual Risk |
|-------|------|-----------|-----------|---------------|
| 1 | Understand legacy wrong | Cross-team documentation review | High | Low |
| 1 | Sidecar crashes legacy | Test one function at a time | High | Low |
| 2 | Canary breaks production | Start 1%, auto-fallback if >2% error | High | Low |
| 2 | Data sync discrepancy | Parallel processing catches issues | Medium | Medium |
| 3 | Data loss during migration | ACL validation, reconciliation service | Medium | Low |
| 3 | Saga compensation fails | Exhaustive testing, manual recovery procedure | Medium | Medium |
| 4 | Legacy still needed | Read-only mode maintains safety net | High | Low |

---

## Canary & Shadow Mode Testing Strategy

### Shadow Mode (Phase 2: Week 1–2)
- Process ALL auth requests through BOTH legacy + modern
- Compare results (should be identical)
- If discrepancy: log, investigate, do NOT impact user
- Duration: run shadow mode 1–2 weeks before canary
- Success: zero discrepancies (or all explained and fixed)

### Canary Deployment (Phase 2: Week 3+)
```
Canary progression:
├─ Day 1: 1% traffic to modern service
│  └─ Monitor: error rate, latency, 500 errors
│  └─ Success criteria: error rate ≤ legacy + 0.5%, latency ≤ legacy + 50ms
│  └─ Decision: proceed to 5% or rollback
├─ Day 2–3: 5% traffic (hold, monitor)
│  └─ Same success criteria
├─ Day 4–5: 10% traffic (hold, monitor)
│  └─ Same success criteria
├─ Day 6–7: 25% traffic (hold, monitor)
│  └─ Same success criteria
└─ Day 8+: 100% (gradual ramp, no hold period)
```

### Monitoring Metrics per Phase
**Phase 2 (Auth Service canary)**:
- Error rate (%) — target: within 0.5% of legacy baseline
- P50, P99 latency (ms) — target: within 50ms of legacy
- Fallback rate (%) — target: <1% (only for actual errors)
- Session success rate (%) — target: ≥99.9%

**Phase 3 (Payment Service canary)**:
- Transaction success rate (%) — target: ≥99.95%
- Saga completion time (ms) — target: P99 <500ms
- Payment delay (seconds) — target: <30s (eventual consistency acceptable)
- Reconciliation mismatch rate (%) — target: 0%

---

## Output Format

**Document name**: `Migration_Plan_[ClientName]_[Date].md`

**Sections**:
1. Executive Summary (timeline, phases, key milestones)
2. Phase 1–4 detailed plans (as above)
3. Risk matrix (table)
4. Canary testing strategy + metrics
5. Rollback playbook (who decides, how long, steps)
6. Dependency map (which service depends on which legacy system)
7. Staffing plan (who does what, hiring needs)
8. Communication plan (how to keep stakeholders updated)

## Validation Checklist

- [ ] All 4 phases detailed (scope, deliverables, duration, go/no-go criteria)
- [ ] Risk matrix covers high-impact scenarios (data loss, outages, security)
- [ ] Canary progression realistic (not too aggressive, not too slow)
- [ ] Rollback strategy documented per phase (who decides, what happens)
- [ ] Legacy dependencies mapped (what systems depend on legacy output)
- [ ] Staffing plan clear (need X engineers, Y ops, Z QA per phase)
- [ ] Success metrics concrete (error rate <X%, latency <Y ms, data consistency 99.99%)
