# Architecture TO-BE: Reference Patterns & Templates

Complete template library for C4 L2 diagrams with layer annotations, ADR templates with examples, migration phase cards, nightmare scenario cards, and comprehensive decision frameworks. Max 2× original length; every section justifies inclusion with concrete examples.

---

## Part 1: C4 Level 2 Container Diagram ASCII Template with Annotations

```
╔════════════════════════════════════════════════════════════════════════════╗
║                      ARQUITECTURA TO-BE NIVEL 2                            ║
╠════════════════════════════════════════════════════════════════════════════╣
║                                                                            ║
║  ┌─────────────────────────────────────────────────────────────────────┐  ║
║  │ CONSUMER LAYER (Presentation & Integration Points)                  │  ║
║  │ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐                 │  ║
║  │ │ Web Channel  │ │ Mobile App   │ │ Partner APIs │                 │  ║
║  │ └──────┬───────┘ └──────┬───────┘ └──────┬───────┘                 │  ║
║  └────────┼─────────────────┼─────────────────┼──────────────────────┘  ║
║           │                 │                 │                          ║
║  ┌────────┼─────────────────┼─────────────────┼──────────────────────┐  ║
║  │ API GATEWAY LAYER (Unified Entry Point)                            │  ║
║  │ ┌─────────────────────────────────────────────────────────────┐    │  ║
║  │ │ Primary: Auth • Rate Limiting • Request Routing             │    │  ║
║  │ │ Secondary: Logging • Monitoring • Request Validation        │    │  ║
║  │ │ Protocols: HTTP/2, gRPC, WebSocket                          │    │  ║
║  │ └─────────────────────────────────────────────────────────────┘    │  ║
║  └────────┼─────────────────────────────────────────────────────────┘  ║
║           │                                                              ║
║  ┌────────┼──────────────────────────────────────────────────────────┐  ║
║  │ MICROSERVICES MESH LAYER (Business Capabilities)                  │  ║
║  │ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐               │  ║
║  │ │ Auth Service │ │ Account Svc  │ │ Transaction  │               │  ║
║  │ │ (OAuth2,RBAC)│ │ (Accounts)   │ │ Orchestrator │               │  ║
║  │ └──────┬───────┘ └──────┬───────┘ └──────┬───────┘               │  ║
║  │ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐               │  ║
║  │ │ Payment Svc  │ │ Audit Svc    │ │ Notification │               │  ║
║  │ │ (Payments)   │ │ (Event Log)  │ │ Service      │               │  ║
║  │ └──────┬───────┘ └──────┬───────┘ └──────┬───────┘               │  ║
║  │                                                                     │  ║
║  │ Communication: Service Mesh (Istio): mTLS • Circuit Breaking      │  ║
║  │ Message Bus: Kafka/RabbitMQ (Event Streaming, Sagas)              │  ║
║  └────────┼──────────────────────────────────────────────────────────┘  ║
║           │                                                              ║
║  ┌────────┼──────────────────────────────────────────────────────────┐  ║
║  │ ANTI-CORRUPTION LAYER (Legacy Integration Boundary)              │  ║
║  │ ┌──────────────────────────────────────────────────────────────┐  │  ║
║  │ │ ACL Adapters: JSON ↔ Legacy Protocols (SOAP, COBOL, EDI)     │  │  ║
║  │ │ DLL Sidecar Pattern: Wrap legacy COM/DLL in safe container   │  │  ║
║  │ │ Data Translation: Normalize legacy schemas to domain models  │  │  ║
║  │ └──────────────────────────────────────────────────────────────┘  │  ║
║  └────────┼──────────────────────────────────────────────────────────┘  ║
║           │                                                              ║
║  ┌────────┼──────────────────────────────────────────────────────────┐  ║
║  │ LEGACY SYSTEM LAYER (Gradual Replacement via Strangler Fig)      │  ║
║  │ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐               │  ║
║  │ │ Core Banking │ │  Mainframe   │ │ CRM System   │               │  ║
║  │ │ System       │ │ (COBOL/PLI)  │ │              │               │  ║
║  │ └──────────────┘ └──────────────┘ └──────────────┘               │  ║
║  └────────────────────────────────────────────────────────────────────┘  ║
║           │                                                              ║
║  ┌────────┼──────────────────────────────────────────────────────────┐  ║
║  │ DATA LAYER (Polyglot Persistence)                                │  ║
║  │ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐               │  ║
║  │ │ PostgreSQL   │ │ Redis        │ │ Elasticsearch│              │  ║
║  │ │ (ACID OLTP)  │ │ (Cache)      │ │ (Audit Log) │              │  ║
║  │ └──────────────┘ └──────────────┘ └──────────────┘               │  ║
║  └────────────────────────────────────────────────────────────────────┘  ║
║           │                                                              ║
║  ┌────────┼──────────────────────────────────────────────────────────┐  ║
║  │ INFRASTRUCTURE & OBSERVABILITY                                    │  ║
║  │ Kubernetes • Service Mesh (Istio) • ELK (Logging) • Jaeger        │  ║
║  │ (Tracing) • Prometheus (Metrics) • GitOps (ArgoCD)                │  ║
║  └────────────────────────────────────────────────────────────────────┘  ║
║                                                                            ║
╚════════════════════════════════════════════════════════════════════════════╝

Layer-by-Layer Descriptions:

CONSUMER LAYER:
  - Responsibility: User experience, device-specific logic
  - Does NOT handle: Business logic, security decisions
  - Examples: React SPA, mobile app, third-party integrations

API GATEWAY:
  - Responsibility: Auth (OAuth2/OIDC), rate limiting, routing, logging
  - Does NOT handle: Business logic, fine-grained authorization
  - Protocols: HTTP/2 (REST), gRPC, WebSocket (real-time)

MICROSERVICES MESH:
  - Responsibility: Domain-driven business logic (DDD)
  - Communication: Service-to-service via mTLS (encrypted)
  - Data Ownership: Each service owns its database (no shared tables)
  - Patterns: Saga, CQRS, Event Sourcing, Circuit Breaker

ANTI-CORRUPTION LAYER:
  - Responsibility: Translate modern contracts ↔ legacy protocols
  - Isolation: Complete boundary isolating legacy constraints
  - Implementation: Adapter service + optional DLL sidecar

LEGACY LAYER:
  - Status: Transitioned to read-only or scheduled for retirement
  - Integration: Via ACL only (no direct microservice access)
  - Pattern: Strangler fig (incremental replacement)

DATA LAYER:
  - Persistence: PostgreSQL (OLTP, ACID), Redis (cache), Elasticsearch (search)
  - Ownership: Microservices own their data (polyglot)
  - Event Store: PostgreSQL append-only table for event sourcing

INFRASTRUCTURE:
  - Container Orchestration: Kubernetes (autoscaling, self-healing)
  - Service Mesh: Istio (mTLS, observability, resilience)
  - Observability: ELK + Jaeger + Prometheus (logs, traces, metrics)
  - Deployment: GitOps (ArgoCD) for declarative infrastructure-as-code
```

---

## Part 2: Architecture Decision Record (ADR) Template with Example

```markdown
# ADR-XXX: [Decision Title]

**Status**: [Proposed | Accepted | Deprecated | Superseded by ADR-YYY]
**Date**: [YYYY-MM-DD]
**Deciders**: [Team/Person Names]

## Context

Describe the issue motivating this decision:
- What is the current situation and constraints?
- What problem are we trying to solve?
- Why is this decision necessary now?

**Background**: [Historical context or related decisions]

**Assumptions**:
- [Assumption 1: description]
- [Assumption 2: description]

## Decision

**Chosen Approach**: [Clear, concise statement of the decision]

**Rationale**: [Why this approach over alternatives]

**Implementation Strategy**:
```
[Pseudocode, architecture sketch, or high-level implementation steps]
```

## Consequences

### Positive Consequences ✅
- [Benefit 1]: [description and impact]
- [Benefit 2]: [description and impact]

### Negative Consequences ❌
- [Risk 1]: [description and mitigation strategy]
- [Risk 2]: [description and mitigation strategy]

### Trade-offs ⚖️
- We gain: [benefit]
- We lose: [cost]
- We assume: [key assumption]

## Alternatives Considered

### Alternative 1: [Name]
- **Description**: [brief description]
- **Pros**: [advantages]
- **Cons**: [disadvantages]
- **Why rejected**: [reason not chosen]

### Alternative 2: [Name]
- **Description**: [brief description]
- **Pros**: [advantages]
- **Cons**: [disadvantages]
- **Why rejected**: [reason not chosen]

## Validation & Proof of Concept

How will we validate this decision?
- [ ] Spike/prototype completed
- [ ] Performance testing results acceptable
- [ ] Team consensus achieved
- [ ] Regulatory approval obtained

## Monitoring (How to detect if decision was wrong)

How will we measure if this decision was correct?
- **Metric 1**: [target value and measurement] — alert if [threshold]
- **Metric 2**: [target value and measurement] — alert if [threshold]
- **Red flag**: [condition that indicates decision failed]

Example (for Saga pattern ADR):
- **Metric**: Saga completion time P99 — target <500ms
- **Metric**: Stuck sagas in-progress >10min — alert if any
- **Red flag**: Compensation failure rate >1%

## Related Decisions

- Depends on: [ADR-XXX, ADR-YYY]
- Supersedes: [ADR-ZZZ]
- Related to: [ADR-AAA]

## Review Schedule

- Next review date: [DATE]
- Review triggers: [Events requiring re-evaluation]

## Notes

[Any additional context or references]
```

### ADR Example: Saga vs Distributed Transactions

```markdown
# ADR-002: Saga Pattern for Distributed Transactions

**Status**: Accepted
**Date**: 2026-03-01
**Deciders**: Architecture Team, CTO

## Context

Banking transactions require multi-step coordination:
1. Payment Service: charge customer
2. Account Service: debit account
3. Notification Service: send email

Traditional approach: 2-Phase Commit (2PC) with distributed locks.
Problem: 2PC blocks (locks table rows), impacts availability (CAP theorem), slow (latency >1s).

Phase 3 scenario (Moderate) includes eventual consistency for non-critical flows.

## Decision

Use Saga pattern with Orchestration for complex transaction flows:
1. Transaction Orchestrator receives payment request
2. Orchestrator calls Payment Service (charges customer)
3. On success, calls Account Service (debits account)
4. On success, calls Notification Service (emails user)
5. If any step fails, Orchestrator invokes compensating transactions (reverse charge, credit account, cancel email)

## Consequences

✅ No distributed locks (availability preserved)
✅ Compensating transactions explicit and testable
✅ Audit trail clear (orchestrator logs all steps)

❌ Developer complexity: must implement compensation for each service
❌ Testing complexity: must test failure at each step
❌ "Hanging saga" risk: if compensation fails, transaction stuck (manual recovery needed)

Trade-off: We gain resilience (no availability loss). We lose simplicity (compensation logic required).

## Alternatives Considered

### Alternative 1: 2-Phase Commit
- Pros: Strong consistency (guaranteed atomic)
- Cons: Blocking (locks), slow (P99 latency >1s), tight coupling
- Rejected: Availability impact unacceptable for banking SLA (99.95% uptime requirement)

### Alternative 2: Eventually Consistent (no compensation)
- Pros: Simple
- Cons: No rollback (if account debit fails, payment not reversed = money disappears)
- Rejected: Data loss unacceptable for financial transactions

## Validation

- [ ] Outbox pattern implemented: events guaranteed published even if service crashes
- [ ] Compensation tested: failure at each step → compensation runs correctly
- [ ] Stuck saga procedure: manual recovery steps documented and tested
- [ ] Chaos test: inject failures at each step → saga recovers or alerts for manual intervention

## Monitoring

- **Saga completion time**: P99 <500ms — alert if >1s
- **Compensation rate**: <1 per minute (indicates failures) — alert if >5/minute
- **Stuck sagas**: sagas in-progress >10min — alert immediately
- **Red flag**: Uncompensated transaction (payment charged but account not debited) — alert and page on-call
```

---

## Part 3: Nightmare Scenario Documentation Pattern with Example

```markdown
## Scenario: [Descriptive Name] [Severity Emoji]

**ID**: NIGHTMARE-XXX
**Probability**: [High/Medium/Low]
**Impact Severity**: [Critical/High/Medium/Low]
**Risk Score**: [Probability × Impact]

### Problem Description

**What goes wrong?**
[Clear description of the failure mode]

**Why would this happen?**
- Root cause 1: [description]
- Root cause 2: [description]

**Trigger conditions** (WHEN does nightmare happen):
- Condition A: [when/how likely]
- Condition B: [when/how likely]

Example: "WHEN Payment Service crashes post-commit but before publishing event to Kafka" = data loss.

### Impact Analysis

**Financial Impact**: [Estimated loss amount and timeframe]

Example: "Customer charged $500 but account not debited. If undetected 1 day = $500 loss per affected customer."

**Operational Impact**:
- Service availability: [affected services]
- Data consistency: [what data becomes inconsistent]
- User experience: [user-facing impact]

**Compliance/Regulatory Impact**:
- Violations: [which regulations violated]
- Audit trail damage: [record impact]
- Customer notification: [yes/no, how many]

### Detection & Monitoring

**Early warning signs**:
- Signal 1: [what to monitor]
- Signal 2: [what to monitor]

**Monitoring implementation**:
```yaml
Alert: [Alert name]
  Condition: [What triggers the alert]
  Threshold: [Numeric threshold]
  Action: [What happens when alert fires]
```

### Mitigation Patterns

**Primary Mitigation** (Architecture Pattern):

**Pattern**: [Pattern name: Saga, Circuit Breaker, ACL, etc.]

**Implementation**:
```
[Code, config, or architectural sketch showing mitigation]
```

**How it prevents the scenario**:
[Explanation of how this pattern prevents the failure]

**Effectiveness**: [95% prevention, assumes X conditions hold]

**Secondary Mitigations** (Defense in Depth):
- [Mitigation 1]: [pattern + brief description]
- [Mitigation 2]: [pattern + brief description]

### Recovery Procedure (If Scenario Occurs)

**Immediate Actions (0–5 min)**:
1. [Action]: [description]
2. [Action]: [description]

**Remediation (5–30 min)**:
1. [Action]: [description]
2. [Action]: [description]

**Verification (30+ min)**:
1. [Verify condition]: [how to check]
2. [Verify condition]: [how to check]

**Rollback Plan** (if recovery fails):
- Step 1: [description]
- Step 2: [description]

**Communication**:
- Notify: [who gets notified]
- Timeline: [when to notify]
- Template: [what to tell them]

### Post-Incident

**Root Cause Analysis Template**:
- When did it start?
- What was the root cause?
- Why didn't we detect it sooner?
- How do we prevent recurrence?

**Testing Strategy** (Prevent recurrence):
- Chaos test: [specific test case]
- Load test: [specific scenario]
- Integration test: [specific flow]

### Acceptance Criteria (Go/No-Go)

This scenario is acceptable ONLY if:
- [ ] Mitigation pattern implemented correctly
- [ ] Monitoring alerts configured and validated
- [ ] Recovery procedure documented and tested
- [ ] Team trained on incident response
- [ ] Chaos testing passes (simulate, verify recovery)
```

### Nightmare Scenario Example: Ghost Transaction 👻

```markdown
## Scenario: Ghost Transaction (Silent Data Loss) 👻

**ID**: NIGHTMARE-001
**Probability**: Low
**Impact Severity**: Critical (data loss unrecoverable)
**Risk Score**: Low × Critical = Medium-High priority

### Problem Description

**What goes wrong?**
Payment Service commits charge (writes to PostgreSQL) then crashes before publishing "PaymentProcessed" event to Kafka. Account Service never learns of the payment. Customer charged but account not debited = money disappears.

**Why would this happen?**
- Out-of-memory crash in Payment Service mid-transaction
- Connection timeout to Kafka (transient network partition)
- Orchestrator crash before publishing saga completion event

**Trigger conditions**:
- WHEN: Payment Service hits memory limit (large payload)
- WHEN: Kafka broker temporarily unavailable (network latency spike)
- WHEN: Transaction Orchestrator crashes (process restart)

### Impact Analysis

**Financial Impact**:
- Per incident: $1–1000 per affected customer (depending on transaction size)
- If undetected >1 day: 100+ customers affected = $100K+ loss
- Reputational: customers lose trust in payment system

**Operational Impact**:
- Data consistency: payment ≠ account debit (two sources of truth diverge)
- Regulatory impact: PCI-DSS requires audit trail (incident exposes control failure)
- Team impact: manual reconciliation required (error-prone, time-consuming)

### Detection & Monitoring

**Early warning signs**:
- Signal 1: Kafka consumer lag spikes (events not being published)
- Signal 2: Payment count > Account debit count (reconciliation mismatch)
- Signal 3: Payment Service crash logs (OOM, network timeout)

**Monitoring implementation**:
```yaml
Alert: TRANSACTION_CONSISTENCY_DRIFT
  Condition: SUM(payment_service.transactions) != SUM(account_service.debits)
  Threshold: Alert if difference >$0 for 30+ seconds
  Action: Page on-call engineer; initiate reconciliation investigation

Alert: KAFKA_PUBLISH_FAILURE
  Condition: PaymentService fails to publish event 5+ consecutive times
  Threshold: Any 5 consecutive failures
  Action: Page on-call; check Kafka broker health; restart service if needed
```

### Mitigation Patterns

**Primary Mitigation**: Outbox Pattern

Outbox pattern ensures Payment Service writes charge + event in same database transaction (atomic):
```
BEGIN TRANSACTION
  INSERT INTO accounts (id, balance) VALUES (1, 99500)  -- debit $500
  INSERT INTO outbox (id, event, timestamp) VALUES (UUID, "PaymentProcessed", NOW())
COMMIT

-- Separate background job polls outbox; publishes to Kafka
SELECT * FROM outbox WHERE published=false LIMIT 100
FOR EACH EVENT:
  PUBLISH to Kafka
  UPDATE outbox SET published=true WHERE id=event.id
```

Effectiveness: 99%+ (prevents payment loss; event may be delayed but eventually published).

**Secondary Mitigations** (Defense in Depth):
- Saga compensation: if Account Service doesn't receive event within 10min, compensation queries outbox (finds unpublished event, retries)
- Reconciliation Service: daily batch SUM(payments) = SUM(debits); alerts on mismatch
- Idempotency: every payment endpoint includes UUID idempotency key (retries produce same result)
- Dead Letter Queue: failed outbox publishes go to DLQ (manual review, retry)

### Recovery Procedure (If Scenario Occurs)

**Immediate Actions (0–5 min)**:
1. On-call receives alert (transaction drift)
2. SSH into Payment Service, check logs: "Kafka publish failed"
3. Verify Kafka broker status: `kafka-topics --list` (are brokers up?)

**Remediation (5–30 min)**:
1. Query outbox: `SELECT * FROM outbox WHERE published=false LIMIT 10`
2. For each unpublished event, manually publish to Kafka (using Kafka CLI or script)
3. Verify Kafka received: `kafka-console-consumer --topic payments --from-beginning`
4. Confirm Account Service processed: `SELECT * FROM accounts WHERE last_debit_time > NOW() - INTERVAL 10 MINUTE`

**Verification (30+ min)**:
1. Run reconciliation: `SELECT SUM(amount) FROM payment_service.payments - SUM(amount) FROM account_service.debits` (should be $0)
2. If reconciliation succeeds: incident resolved
3. If still mismatch: engage finance team for manual customer credit/debit

**Rollback Plan** (if recovery fails):
- Restore Payment Service from backup (point-in-time before crash)
- Replay outbox entries from disaster recovery log
- Reconciliation Service validates data restored correctly
- If data unrecoverable: customer refund + regulatory notification

**Communication**:
- Notify: Finance team (potential money discrepancy), CTO (critical incident)
- Timeline: Within 1 hour of detection
- Template: "Detected N transactions may not have been properly debited. Investigating cause. Customer impact: TBD."

### Post-Incident

**Root Cause Analysis**:
- Did outbox pattern prevent money loss? If yes, why didn't secondary mitigations catch sooner?
- Why did Kafka publish fail? Network? Broker? Service quota?
- Why didn't reconciliation detect sooner (was it running daily or only weekly)?

**Testing Strategy** (Prevent recurrence):
- Chaos test: Payment Service crash mid-transaction → verify outbox entry saved (recovery works)
- Chaos test: Kafka unavailable → verify outbox retry loop kicks in
- Load test: high transaction volume → verify no race conditions in outbox
- Integration test: simulate 100 payment failures → verify reconciliation catches all

### Acceptance Criteria (Go/No-Go)

- [ ] Outbox pattern implemented and tested (payment + event atomic write)
- [ ] Reconciliation Service runs daily and alerts on mismatch
- [ ] Idempotency keys validated on all payment endpoints
- [ ] Kafka monitoring configured (publish failures detected within 1 minute)
- [ ] Recovery procedure tested (team can recover from backup in <30 min)
- [ ] Chaos test passes: Payment Service crash → outbox prevents money loss
```

**Severity Emoji Reference**:
- 👻 Ghost/Silent failure (data loss without detection)
- 🔄 Cascade/Ripple failure (affects multiple services)
- 🔐 Security breach (unauthorized access, data exposure)
- ❌ Service unavailability (downtime)
- 💥 Data corruption (loss of integrity)
- 🔗 Dependency failure (blocks critical path)

---

## Part 4: Trade-off Matrix Comparison Pattern

```yaml
Trade-off Analysis Framework:

Communication Pattern:
  - Synchronous (REST, gRPC):
      Pros: [Immediate feedback, strong consistency]
      Cons: [Tight coupling, cascading failures]
      Tradeoff: Simplicity vs Resilience

  - Asynchronous (Event-Driven):
      Pros: [Loose coupling, scalability]
      Cons: [Eventual consistency, complexity]
      Tradeoff: Consistency vs Resilience

Consistency Model:
  - Strong Consistency (Distributed Txn):
      Pros: [Guaranteed correctness]
      Cons: [Performance, availability (CAP theorem)]
      Tradeoff: Correctness vs Performance

  - Eventual Consistency (Saga):
      Pros: [High availability, scalability]
      Cons: [Complex compensation, debugging]
      Tradeoff: Simplicity vs Availability

Security Approach:
  - Perimeter Security (Firewall):
      Pros: [Traditional, well-understood]
      Cons: [Internal attacks undetected]
      Tradeoff: Simplicity vs Security

  - Zero Trust (mTLS, OAuth2):
      Pros: [Defense-in-depth, regulatory compliance]
      Cons: [Operational complexity, performance]
      Tradeoff: Simplicity vs Security

Data Storage:
  - Monolithic Database:
      Pros: [ACID, simple joins, single source of truth]
      Cons: [Scalability limits, tight coupling]
      Tradeoff: Consistency vs Scalability

  - Polyglot Persistence:
      Pros: [Optimal tool per problem, scalability]
      Cons: [Data sync challenges, complexity]
      Tradeoff: Consistency vs Scalability

Deployment Model:
  - Traditional VMs:
      Pros: [Familiar, predictable]
      Cons: [Resource inefficiency, slow scaling]
      Tradeoff: Simplicity vs Efficiency

  - Kubernetes:
      Pros: [Auto-scaling, self-healing, declarative]
      Cons: [Operational complexity, learning curve]
      Tradeoff: Simplicity vs Operational Efficiency

Legacy Integration:
  - Big Bang Replacement:
      Pros: [Fast, clean break]
      Cons: [High risk, long implementation]
      Tradeoff: Speed vs Risk

  - Strangler Fig (Phased):
      Pros: [Low risk, validates incrementally]
      Cons: [Longer timeline, parallel systems]
      Tradeoff: Speed vs Risk
```

---

## Part 5: Migration Phase Diagram Pattern

```
Phase 1: Assessment & Wrapping
├─ Legacy System Documentation
├─ DLL Sidecar Wrapper Development
├─ ACL Adapter Creation (per integration point)
└─ Monitoring/Logging Baseline Established
   Duration: 2 months | Risk: Low

     ↓

Phase 2: Modern Service Introduction & Canary
├─ Auth Service Deployment (MVP)
├─ Strangler Fig Implementation (10% traffic canary)
├─ Legacy Authentication as Fallback
├─ Shadow Mode Validation (process all, compare results)
└─ Parallel Processing Logs
   Duration: 3 months | Risk: Medium

     ↓

Phase 3: Capability Migration & Stabilization
├─ Account Service Deployment
├─ Transaction Service Deployment
├─ Saga Pattern Implementation
├─ Event Streaming Deployment (Kafka)
├─ Reconciliation Service (daily validation)
└─ Data Migration (phase-by-phase)
   Duration: 6 months | Risk: Medium

     ↓

Phase 4: Legacy Sunset & Optimization
├─ Stop Writing to Legacy (read-only mode)
├─ Historical Data Archival (data lake)
├─ ACL Maintenance (compliance queries only)
├─ Legacy Infrastructure Decommissioning
└─ Performance Optimization & Cost Reduction
   Duration: 3 months | Risk: Low

Total Project Timeline: 14 months
Go/No-Go Gates: After each phase
Rollback Capability: Maintained through Phase 3
```

---

## Part 6: Security Architecture Diagram Pattern

```
┌────────────────────────────────────────────────────────────────┐
│                     ZERO TRUST SECURITY MODEL                  │
├────────────────────────────────────────────────────────────────┤
│                                                                │
│  ┌──────────────────────────────────────────────────────────┐ │
│  │ EXTERNAL CLIENT (Web, Mobile, Partner)                   │ │
│  └─────────────────┬──────────────────────────────────────┘ │
│                    │ HTTPS (TLS 1.3 only)                     │
│  ┌────────────────┼──────────────────────────────────────┐ │
│  │ API GATEWAY (Layer 1 Authentication)                   │ │
│  │ ├─ OAuth2/OIDC Token Validation                        │ │
│  │ ├─ Signature Verification (RS256)                      │ │
│  │ ├─ Token Expiry Check                                  │ │
│  │ ├─ Scope Validation (bearer token scopes)              │ │
│  │ └─ Rate Limiting (prevent brute force)                 │ │
│  └─────────────────┬──────────────────────────────────────┘ │
│                    │ mTLS (mutual TLS)                       │
│  ┌────────────────┼──────────────────────────────────────┐ │
│  │ SERVICE MESH (Istio) – Layer 2 Service Identity         │ │
│  │ ├─ Automatic mTLS Injection (sidecar proxies)          │ │
│  │ ├─ X.509 Certificate Rotation (automated)              │ │
│  │ ├─ Service-to-Service Encryption (all traffic)         │ │
│  │ ├─ Mutual Authentication (both client & server)        │ │
│  │ └─ Authorization Policies (DENY by default)            │ │
│  └─────────────────┬──────────────────────────────────────┘ │
│                    │ gRPC or REST (encrypted by mTLS)        │
│  ┌────────────────┼──────────────────────────────────────┐ │
│  │ MICROSERVICES (Layer 3 Fine-Grained RBAC)              │ │
│  │ ├─ Extract user context from JWT claims               │ │
│  │ ├─ Load roles from AuthService (cached in Redis)      │ │
│  │ ├─ Fine-grained permission checks (RBAC)              │ │
│  │ ├─ Audit log all access attempts                       │ │
│  │ └─ Deny unauthorized access (return 403)               │ │
│  └─────────────────┬──────────────────────────────────────┘ │
│                    │ ACID Transaction (in-process)           │
│  ┌────────────────┼──────────────────────────────────────┐ │
│  │ DATABASE (Layer 4 Data-at-Rest Encryption)             │ │
│  │ ├─ PostgreSQL Encryption (pgcrypto or at-disk)        │ │
│  │ ├─ Redis Encryption (in-transit + at-rest)            │ │
│  │ ├─ Elasticsearch Encryption (X-Pack)                   │ │
│  │ ├─ Immutable Audit Log (append-only)                   │ │
│  │ └─ Secrets Management (HashiCorp Vault)                │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                                │
│  KEY PRINCIPLES:                                              │
│  • Never trust the network (encrypt everything)              │
│  • Verify every request (OAuth2 + mTLS)                      │
│  • Audit all access (immutable logs)                         │
│  • Defense-in-depth (multiple layers)                        │
│  • Least privilege (DENY by default)                         │
│                                                                │
└────────────────────────────────────────────────────────────────┘
```

---

## Part 7: Component Dependency Diagram Pattern

```
AUTH SERVICE
├─ Dependencies:
│  ├─ Identity Provider (LDAP/AD) – via ACL
│  ├─ Redis (session cache, TTL 5 min)
│  ├─ PostgreSQL (user roles, audit log)
│  └─ Notification Service (welcome emails)
├─ Dependents:
│  ├─ API Gateway (token validation)
│  ├─ Account Service (identity context)
│  └─ Payment Service (user verification)
└─ Resilience:
   ├─ Circuit Breaker: Identity Provider (5s timeout)
   ├─ Cache: Roles (Redis, 5 min TTL)
   └─ Fallback: Cached identity data if Identity Provider down

TRANSACTION ORCHESTRATOR
├─ Dependencies:
│  ├─ Account Service (debit/credit)
│  ├─ Payment Service (payment processing)
│  ├─ Notification Service (SMS alerts)
│  └─ Kafka (event streaming)
├─ Dependents:
│  ├─ Account Service (receives saga steps)
│  ├─ Payment Service (receives saga steps)
│  └─ Notification Service (receives events)
└─ Resilience:
   ├─ Saga Orchestration (compensating transactions)
   ├─ Outbox Pattern (guaranteed event publication)
   ├─ Idempotency Keys (safe retries)
   └─ Reconciliation Service (daily validation)

ACCOUNT SERVICE
├─ Data Store: PostgreSQL (accounts, balances)
├─ Cache: Redis (frequently accessed accounts)
├─ Dependencies:
│  ├─ Legacy Core Banking (via ACL)
│  └─ Audit Service (emit AccountDebited events)
├─ Dependents:
│  ├─ Transaction Orchestrator
│  └─ Report Service (analytics)
└─ Resilience:
   ├─ Idempotency: All mutations include Idempotency-Key
   ├─ Circuit Breaker: Legacy ACL (5s timeout, fallback to cache)
   └─ Event Sourcing: All state changes captured as events

PAYMENT SERVICE
├─ Data Store: PostgreSQL (transactions, reconciliation)
├─ Dependencies:
│  ├─ Payment Gateway (Stripe, Square, etc.)
│  ├─ Notification Service (payment confirmations)
│  └─ Kafka (payment events)
├─ Dependents:
│  ├─ Transaction Orchestrator
│  ├─ Account Service (receives PaymentCompleted events)
│  └─ Analytics Service (payment metrics)
└─ Resilience:
   ├─ Idempotency: Every payment has Idempotency-Key
   ├─ Retry Logic: Exponential backoff (1s, 2s, 4s, 8s)
   ├─ Circuit Breaker: Payment Gateway (fail fast)
   └─ Dead Letter Queue: Failed payments captured for manual review
```

---

## Part 8: Glossary of Architecture Terms

| Term | Definition | Example |
|------|-----------|---------|
| **Saga Pattern** | Distributed transaction via compensating transactions | Fund transfer: debit A, credit B; if B fails, reverse A |
| **Circuit Breaker** | Fail-fast mechanism preventing cascading failures | Payment Service errors 5× → reject calls for 30s |
| **Anti-Corruption Layer** | Translation boundary isolating legacy systems | REST ↔ SOAP ↔ COBOL converter service |
| **Event Sourcing** | Capture all state changes as immutable events | Account balance = sum of all debit/credit events |
| **CQRS** | Command Query Responsibility Segregation | Writes → event store; reads → optimized projection |
| **Idempotency** | Operation produces same result when called multiple times | Payment with Idempotency-Key "xyz" always returns same result |
| **Zero Trust** | Verify every request; assume no internal network trusted | All service-to-service calls require mTLS certificates |
| **Strangler Fig** | Gradually replace legacy system by intercepting calls | Route 10% → new service, 90% → legacy; gradually shift |
| **Domain-Driven Design** | Organize services around business domains | Payment Service owns all payment logic |
| **RBAC** | Role-Based Access Control | User has "admin" role → can edit users |
| **mTLS** | Mutual TLS – both client and server authenticate | Service A presents cert to Service B; B verifies cert |
| **Outbox Pattern** | Write event + business data atomically, publish async | Update account + write transfer event in same DB transaction |
| **Bulkhead** | Isolate resources so one failure doesn't affect others | Payment calls use separate thread pool from Auth calls |
| **Cache-Aside** | Check cache first; if miss, fetch from DB then cache | Check Redis for roles; miss → query DB → cache |

---

## Part 9: Implementation Checklists

### Pre-Implementation Checklist (Before Project Kickoff)

**Architecture & Design**:
- [ ] All ADRs documented and approved
- [ ] C4 diagrams validated by stakeholders
- [ ] Nightmare scenarios identified and mitigation patterns confirmed
- [ ] Trade-off decisions documented and communicated

**Team Readiness**:
- [ ] Architecture review board established
- [ ] Team members trained on chosen patterns (Saga, CQRS, Event Sourcing, etc.)
- [ ] Code review standards documented
- [ ] On-call rotation established

**Infrastructure**:
- [ ] Kubernetes cluster provisioned (dev, staging, prod)
- [ ] Service mesh (Istio) installed and configured
- [ ] Container registry (Docker) set up
- [ ] GitOps tool (ArgoCD) configured
- [ ] Observability stack (ELK, Jaeger, Prometheus) operational

**Security & Compliance**:
- [ ] SSL/TLS certificates generated and rotated
- [ ] mTLS testing completed (service-to-service encryption verified)
- [ ] Vault setup for secrets management
- [ ] Compliance assessment completed (GDPR, PCI-DSS, etc.)

### Go/No-Go Criteria (Phase Completion)

**Functional**:
- [ ] All features in phase scope implemented and tested
- [ ] Integration tests pass (service-to-service communication verified)
- [ ] End-to-end tests pass (full transaction flows)
- [ ] Performance tests pass (latency targets met)

**Resilience**:
- [ ] Circuit breakers tested and working
- [ ] Fallback paths tested (cache, legacy ACL, etc.)
- [ ] Saga compensation tested (rollback on failure)
- [ ] Load tests pass (auto-scaling verified)

**Security**:
- [ ] Vulnerability scans pass (OWASP Top 10)
- [ ] Penetration testing completed (if applicable)
- [ ] Secrets rotation working
- [ ] Audit logs verified (all events captured)

**Operational**:
- [ ] Runbooks created for top 10 failure scenarios
- [ ] Monitoring and alerting configured
- [ ] Incident response procedures tested
- [ ] Knowledge transfer documentation complete

---
