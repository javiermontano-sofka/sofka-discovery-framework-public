# ADR Templates & Examples

## ADR Structure

Each ADR follows this template:

```
DECISION: [What we chose]
ALTERNATIVES CONSIDERED:
  1. [Alternative A]: Pros [X, Y], Cons [Z] → Why rejected: [reason]
  2. [Alternative B]: Pros [X, Y], Cons [Z] → Why rejected: [reason]
TRADE-OFF:
  We gain: [benefit of chosen approach]
  We lose: [cost of chosen approach]
  We assume: [key assumption for choice to hold true]
```

---

## ADR-001: Event-Driven Transactions via Saga Pattern

**Context**: Transactions require consistency across services without costly distributed transactions.
**Decision**: Saga (Choreography for simple, Orchestration for complex) + Outbox pattern.
**Consequences**:
- Positive: Eventual consistency, compensating transactions, service independence
- Negative: Increased complexity, "hanging saga" risk, requires event store + idempotency
- Neutral: Monitoring & testing complexity increases

**Trade-off Analysis:**
- Saga (chosen): Pros = eventual consistency, resilience. Cons = complexity, hanging transactions.
- 2PC: Pros = strong consistency. Cons = blocking (availability risk), timeout risk.
- Result: Saga wins latency (non-blocking); 2PC wins correctness (immediate consistency). Choose Saga for microservices resilience.

---

## ADR-002: Anti-Corruption Layer for Legacy Integration

**Context**: Legacy system (e.g., COBOL mainframe, fixed-record schemas) must coexist with modern microservices (JSON, versioned APIs).
**Decision**: Dedicated ACL translation service isolates modern services from legacy constraints.
**Consequences**:
- Positive: Services isolated, easier legacy retirement, clear boundaries
- Negative: Additional latency, requires detailed schema mapping, ACL is critical single point
- Neutral: ACL must be highly available

---

## ADR-003: Zero Trust Architecture with mTLS

**Context**: Microservices behind NAT; traditional perimeter security insufficient.
**Decision**: Every service-to-service call encrypted with mutual TLS; service identity via X.509 certificates.
**Consequences**:
- Positive: Lateral movement eliminated, service identity cryptographically verified, regulatory compliance
- Negative: Certificate management overhead, TLS handshake performance, requires service mesh
- Neutral: Istio/Linkerd operational complexity

**Trade-off Analysis:**
- mTLS (chosen): Pros = cryptographic identity, automatic encryption. Cons = certificate management, TLS overhead.
- API Keys: Pros = simple. Cons = shared secret, no encryption, vulnerable to sniffing.
- Result: mTLS wins security (zero-trust); API Keys win simplicity. Choose mTLS for regulated environments.

---

## ADR-004: PostgreSQL + Event Sourcing for Audit Trail

**Context**: Regulatory compliance requires immutable audit trail; analytics need historical data.
**Decision**: Event Sourcing: all state changes captured as immutable events; CQRS pattern for reads.
**Consequences**:
- Positive: Complete audit trail, time-travel debugging, natural event streaming integration
- Negative: Increased storage, developer complexity, testing overhead
- Neutral: Snapshot strategy needed for large event streams

**Trade-off Analysis:**
- Event Sourcing (chosen): Pros = audit trail, time-travel debugging, event bus. Cons = storage, developer complexity.
- CRUD: Pros = simple, familiar. Cons = audit trail requires separate logging (error-prone).
- Result: Event Sourcing wins compliance (immutable log); CRUD wins simplicity. Choose Event Sourcing for audit-critical systems.

---

## ADR-005: Kubernetes + Istio for Deployment

**Context**: Need dynamic scaling, automated canary deployments, distributed tracing without code changes.
**Decision**: Kubernetes + Istio service mesh + GitOps (ArgoCD) for declarative infrastructure.
**Consequences**:
- Positive: Automatic canary, distributed tracing, automatic mTLS, GitOps automation
- Negative: Operational complexity, sidecar proxy overhead, learning curve
- Neutral: Requires experienced platform engineering team

---

## ADR-006: Redis for Distributed Caching & Session State

**Context**: Auth Service must handle 10K+ concurrent sessions with sub-100ms latency.
**Decision**: Redis for session storage, role cache, distributed locks, rate limiting state.
**Consequences**:
- Positive: Sub-millisecond latency, distributed locking, native TTL support
- Negative: Infrastructure to manage (sentinel/cluster), cache invalidation bugs, data loss on restart
- Neutral: Not suitable for authoritative storage
