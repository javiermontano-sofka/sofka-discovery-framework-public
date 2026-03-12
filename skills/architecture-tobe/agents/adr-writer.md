# ADR Writer Agent

## Purpose

For each significant architectural decision, generates an ADR (Architecture Decision Record) following standard format: Context, Decision, Consequences (positive/negative/trade-offs), Alternatives Considered, Validation, Monitoring. Minimum 6 ADRs per architecture, each referencing Phase 1 findings and Phase 3 scenario trade-offs.

## Input Requirements

**From Architect Agent**:
- C4 L2 diagram (identifies major architectural decisions)
- Pattern selection rationale (communication, consistency, security, deployment, storage)
- Service catalog (which services and technologies)

**From Phase 1**:
- Regulatory constraints (compliance requirements)
- Current pain points (what TO-BE must improve)
- Team skill levels (informs feasibility)

**From Phase 3**:
- Selected scenario (Conservative/Moderate/Aggressive) constraints
- Cost budget and timeline (informs technology choices)

## Required ADRs (Minimum 6)

### ADR-001: Service Communication Pattern

**Context**:
- Microservices need to communicate (service A calls service B)
- Options: Synchronous (REST, gRPC), Asynchronous (Kafka), Hybrid
- Each has latency, consistency, coupling trade-offs

**Decision**:
- Synchronous (REST) for user-facing paths (API Gateway → Auth Service → Account Service)
- Asynchronous (Kafka) for non-blocking side effects (Payment Service publishes "PaymentCompleted" → Notification Service emails user)
- Hybrid: Sync for critical data, async for audit/notifications

**Alternatives Considered**:
- Pure synchronous (all service calls REST): Pro = simple, immediate feedback. Con = cascading timeouts, tight coupling, unavailability ripples.
- Pure asynchronous (all Kafka): Pro = resilient, loosely coupled. Con = debugging hard, eventual consistency complexity.
- gRPC instead of REST: Pro = better performance (binary protocol). Con = requires gRPC clients everywhere (language dependency), debugging harder (not human-readable).

**Why Chosen**:
- Sync for critical paths balances consistency needs with simplicity
- Async for side effects decouples services, improves resilience
- Hybrid leverages strengths of both

**Consequences**:
- ✅ Resilient system (async paths don't fail user experience)
- ✅ Simple to understand (sync = blocking, async = eventual)
- ✅ Debugging easier than pure async (some calls are synchronous, trace clearer)
- ❌ Complexity: team must understand async patterns (events, eventual consistency)
- ❌ Monitoring harder: async failures delayed (must monitor Kafka lag, dead letter queues)
- ⚠️ Testing complexity increases (need to test both sync and async flows)

**Trade-off Summary**:
- We gain: Resilience + clear data flow (sync for critical paths)
- We lose: Simplicity (hybrid is more complex than pure sync)
- We assume: Team comfortable with event-driven patterns by Phase 4

**Monitoring**:
- Kafka consumer lag per topic (alert if >10K messages)
- API latency percentiles (P99 <100ms target)
- Circuit breaker open rate (alert if >5 per minute)

---

### ADR-002: Consistency Model (Saga vs Distributed Transactions)

**Context**:
- Distributed transactions (2PC, XA) guarantee strong consistency but risk availability (blocking locks)
- Saga pattern achieves eventual consistency via compensating transactions (better resilience but harder to understand)
- Banking domain requires high consistency but cannot afford 2PC latency/availability cost

**Decision**:
- Saga pattern for distributed transactions (Orchestration for complex flows, Choreography for simple)
- Orchestrator service (Transaction Orchestrator) coordinates multi-step transactions
- Each service handles compensating transaction (reverse operation if saga fails)
- Outbox pattern ensures events are published exactly-once (no message loss)

**Alternatives Considered**:
- Distributed Transactions (2PC): Pro = strong consistency guaranteed. Con = blocking (availability ↓), latency (P99 >1s), vendor lock-in (all systems must support XA).
- Choreography (event-driven saga without orchestrator): Pro = no single coordinator. Con = harder to debug ("dancing in the dark"), harder to test, timing issues.

**Why Chosen**:
- Saga avoids 2PC's availability penalty (no distributed locks)
- Orchestration (vs Choreography) is more testable and debuggable
- Phase 3 scenario supports Saga complexity (team can learn it)

**Consequences**:
- ✅ No distributed locks (better availability, lower latency)
- ✅ Audit trail clear (orchestrator logs all steps)
- ✅ Rollback explicit (compensation defined per step)
- ❌ Developer complexity: must implement compensating transactions for each step
- ❌ Testing complexity: must test failure scenarios (saga failure recovery)
- ❌ "Hanging saga" risk: if compensating transaction fails, transaction stuck (requires manual recovery procedure)
- ⚠️ Monitoring overhead: must watch for sagas in progress, stuck sagas, compensation failures

**Trade-off Summary**:
- We gain: Availability + lower latency (Saga vs 2PC)
- We lose: Simplicity (more code for compensation)
- We assume: Outbox pattern implemented correctly (no message loss)

**Validation**:
- [ ] Outbox pattern tested: service crashes mid-transaction → events still published (via outbox retry)
- [ ] Compensation tested: simulate failure at each saga step → verify compensation runs
- [ ] Hanging saga procedure documented and tested (manual recovery steps)

**Monitoring**:
- Saga completion time (P99 <500ms target)
- Compensation execution rate (alert if >1 per minute, indicates failures)
- Stuck sagas (sagas in-progress >10min, alert for manual intervention)

---

### ADR-003: Security Model (Zero Trust Architecture)

**Context**:
- Microservices behind NAT; traditional perimeter security insufficient
- Each service needs cryptographic identity + mutual authentication
- Regulatory compliance (banking) requires audit trail of all access

**Decision**:
- Zero Trust Architecture: verify EVERY request (no implicit trust)
- OAuth2/OIDC for user authentication (external clients)
- mTLS (mutual TLS) for service-to-service (each service holds X.509 certificate)
- Role-Based Access Control (RBAC) at API Gateway (coarse) + per-service (fine-grained)
- Immutable audit log captures all authentication events (who, when, outcome)

**Alternatives Considered**:
- Perimeter security (firewall + VPN): Pro = simple, traditional. Con = internal attackers undetected, not compliant with modern zero-trust standards.
- API Keys: Pro = simple to implement. Con = shared secret (hard rotation), no encryption, network sniffing risk, no audit trail.
- TLS only (no mutual auth): Pro = simpler than mTLS. Con = one-way auth (service verifies server, but server doesn't verify service origin).

**Why Chosen**:
- Zero Trust aligns with compliance requirements (banking audit standards expect cryptographic proof)
- mTLS provides service identity (proves service A is really service A, not attacker spoofing)
- RBAC + audit trail support fine-grained permission checks + compliance audits

**Consequences**:
- ✅ Regulatory compliance: audit trail proves access control (required for PCI-DSS, SOC 2)
- ✅ Internal security: lateral movement by attacker blocked (can't call other services without valid certificate)
- ✅ Automatic encryption: mTLS encrypts all inter-service traffic (no plaintext)
- ❌ Operational complexity: certificate management (generation, rotation, revocation) overhead
- ❌ Performance: mTLS handshake adds latency (~10ms per new connection; mitigated by connection pooling)
- ❌ Debugging harder: encrypted traffic (need TLS termination proxy or Wireshark with private keys to inspect)
- ⚠️ Service Mesh required (Istio) for automatic mTLS injection (Linkerd alternative exists, simpler but less feature-rich)

**Trade-off Summary**:
- We gain: Security + audit trail (compliance requirement)
- We lose: Simplicity + performance (mitigated by connection reuse)
- We assume: Service Mesh (Istio) can handle certificate rotation (fully automated)

**Validation**:
- [ ] Service identity certificates generated and distributed
- [ ] mTLS handshake tested (services can authenticate each other)
- [ ] Certificate rotation tested (automatic without service restart)
- [ ] Audit log captures all auth attempts (success + failure)
- [ ] Penetration test: attempt lateral movement as attacker → verify blocked

**Monitoring**:
- mTLS handshake failures (alert if >0 per hour)
- Certificate expiration (alert 30 days before expiry)
- Audit log volume (normal baseline, alert on 10x spike = possible attack)
- Unauthorized access attempts (alert on repeated 403 from same client)

---

### ADR-004: Data Consistency & Audit (Event Sourcing vs CRUD)

**Context**:
- Regulatory compliance requires immutable audit trail (who changed what, when)
- CRUD (Create-Read-Update-Delete) model overwrites history (audit trail requires separate logging)
- Event Sourcing captures ALL mutations as immutable events (audit trail automatic)
- Banking transactions MUST be auditable for regulatory audits

**Decision**:
- Event Sourcing for accounts, payments, and core transactions (immutable event store)
- CQRS (Command Query Responsibility Segregation) for read model (separate database for analytics queries)
- Event store in PostgreSQL append-only table (immutable; indexed for time-based queries)
- Read projections in separate PostgreSQL database (optimized for queries, non-authoritative)

**Alternatives Considered**:
- CRUD + audit logging: Pro = familiar pattern. Con = audit logging separate (can diverge from actual data), error-prone (easy to forget logging), performance overhead (two writes).
- Snapshot-only (no full event history): Pro = smaller storage. Con = can't replay history, debugging hard, no audit trail beyond snapshots.
- NoSQL event store (MongoDB): Pro = flexible schema. Con = less mature than relational, harder to query events.

**Why Chosen**:
- Event Sourcing is authoritative source of truth (no separate audit log to sync)
- Immutable events prevent accidental data modification (compliance confidence)
- CQRS enables analytics queries without impacting transaction processing
- PostgreSQL is proven, familiar to team, supports time-travel queries

**Consequences**:
- ✅ Perfect audit trail: all mutations captured (who, what, when, why in event metadata)
- ✅ Time-travel debugging: replay events to any point in time (troubleshoot past issues)
- ✅ Event-driven integration: events naturally feed to analytics, other services
- ✅ No dual-write consistency problem: single write (event), read projections follow
- ❌ Storage overhead: storing events + snapshots + read projections (3× storage initially)
- ❌ Developer complexity: must think in terms of events (paradigm shift from CRUD)
- ❌ Testing complexity: must test event replay, projections consistency
- ⚠️ Eventual consistency: read projections lag events by seconds (analytics not real-time)

**Trade-off Summary**:
- We gain: Audit trail + time-travel debugging (compliance + supportability)
- We lose: Storage + complexity (mitigated by compression, archival)
- We assume: Team trained on event sourcing before Phase 5 development

**Validation**:
- [ ] Event store tested: write event → read projection updated (with lag <5s)
- [ ] Event replay tested: replay all events → state matches current projection
- [ ] Snapshot tested: long event history → snapshot + deltas = same as full replay
- [ ] Read projection consistency tested: ensure projection lag doesn't violate business rules

**Monitoring**:
- Event store size (alert if growing >10GB/month)
- Projection lag (alert if >10 seconds behind latest event)
- Snapshot freshness (alert if >1 month old)
- Event publish latency (P99 <100ms target)

---

### ADR-005: Deployment Strategy (Kubernetes + Service Mesh vs Simpler)

**Context**:
- Microservices need container orchestration (auto-scaling, self-healing, rolling deployments)
- Kubernetes is industry standard but operationally complex
- Istio service mesh provides observability, resilience, security but adds ~30% infrastructure overhead
- Phase 3 scenario supports K8s complexity if team is ready

**Decision**:
- Kubernetes for container orchestration (production-grade, auto-scaling, self-healing)
- Istio service mesh for mTLS, distributed tracing, resilience patterns (circuit breaker, retry)
- GitOps (ArgoCD) for declarative deployments (Git as source of truth)
- Multi-region failover (active-active or active-passive depending on cost budget)

**Alternatives Considered**:
- Traditional VMs (Terraform + Ansible): Pro = simpler to understand, less overhead. Con = no auto-scaling, manual deployments, lower resource efficiency.
- Docker Swarm: Pro = simpler than K8s, built-in orchestration. Con = less mature, smaller community, fewer integrations.
- Serverless/FaaS (Lambda): Pro = zero ops, pay-per-invocation. Con = cold start latency, vendor lock-in, stateful services harder.

**Why Chosen**:
- Kubernetes widely adopted (easier hiring, community support)
- Istio enables observability (distributed tracing, metrics, logging) at infrastructure level (not per-service code)
- GitOps (ArgoCD) provides deployment automation + audit trail (who deployed what, when)
- Phase 3 budget and team size support K8s complexity

**Consequences**:
- ✅ Auto-scaling: handle traffic spikes automatically (cost-efficient)
- ✅ Self-healing: pod crashes → kubelet restarts automatically
- ✅ Distributed tracing: Istio/Jaeger captures all service calls (no code changes needed)
- ✅ GitOps: deployments declarative (Git diff → review before applying)
- ❌ Operational complexity: K8s has steep learning curve, requires dedicated SRE
- ❌ Infrastructure overhead: Istio sidecars consume 50MB+ per service (cluster size increases)
- ❌ Debugging harder: Istio encrypts inter-service traffic (need TLS termination to inspect)
- ⚠️ Cost: K8s infrastructure + managed services (EKS, GKE, AKS) can be expensive

**Trade-off Summary**:
- We gain: Auto-scaling + observability (competitive advantage for fast-growing system)
- We lose: Simplicity + operations overhead (mitigated by managed K8s services)
- We assume: Team or contractor available to operate K8s (SRE hire or outsourced)

**Validation**:
- [ ] K8s cluster provisioned and tested (create pod → pod runs)
- [ ] Auto-scaling tested: increase load → cluster scales up; decrease load → scales down
- [ ] Rolling deployment tested: update image → zero downtime deployment
- [ ] Istio mTLS tested: service-to-service traffic encrypted
- [ ] GitOps tested: Git commit → ArgoCD syncs → service updated

**Monitoring**:
- Cluster resource utilization (CPU, memory per node, alert if >80%)
- Pod restart rate (alert if >1 restart per hour per pod = indicates crash loop)
- Deployment success rate (alert if rollback rate >1%)
- Istio/Envoy sidecar health (alert if proxy down)

---

### ADR-006: Data Storage Model (PostgreSQL + Redis + Elasticsearch)

**Context**:
- Different access patterns require different storage engines
- Single database (monolith) creates coupling and scalability bottleneck
- Microservices own their data (polyglot persistence)
- Phase 3 scenario supports operational complexity of multiple databases

**Decision**:
- PostgreSQL for transactional data (OLTP, ACID, relational)
- Redis for caching + session state (sub-millisecond latency, TTL support)
- Elasticsearch for audit logs + full-text search (inverted index, powerful queries)
- S3/Blob storage for large files (objects, documents, backups)
- Each service owns its PostgreSQL schema (no cross-service table access)

**Alternatives Considered**:
- Single database (PostgreSQL only): Pro = simple, no polyglot complexity. Con = can't optimize for each access pattern, scaling bottleneck, tight coupling.
- MongoDB for all (NoSQL): Pro = flexible schema, horizontal scaling. Con = consistency guarantees weaker, transactions added in recent versions, operational overhead similar to relational.
- In-memory database (Redis only): Pro = ultra-fast. Con = not suitable for authoritative storage (crash = data loss), cost per GB higher.

**Why Chosen**:
- Polyglot persistence optimizes each access pattern (transactional, caching, search independently)
- PostgreSQL proven for transactional workloads (banking standard)
- Redis industry-standard for caching (sub-ms latency, TTL, distributed locking)
- Elasticsearch de facto standard for search + audit logs (mature, feature-rich)

**Consequences**:
- ✅ Performance: each tool optimized for its use case (P99 latency ↓)
- ✅ Scalability: separate scaling paths (PostgreSQL scale differently than Redis)
- ✅ Cost efficiency: don't pay for features not needed (Redis is cheap compared to PostgreSQL scale-out)
- ❌ Operational complexity: team must operate 3+ database types (backup, patching, monitoring)
- ❌ Data consistency challenges: no ACID transactions across databases (rely on Saga pattern)
- ❌ Team skill requirements: must hire/train PostgreSQL, Redis, Elasticsearch experts
- ⚠️ Data sync: Elasticsearch index must be rebuilt from event stream if corrupted (not authoritative)

**Trade-off Summary**:
- We gain: Performance + cost efficiency (optimized per access pattern)
- We lose: Operational simplicity (team burden increases)
- We assume: Team hires or trains database specialists for each engine

**Validation**:
- [ ] PostgreSQL performance tested: write throughput >1K tps, latency P99 <10ms
- [ ] Redis performance tested: cache hit ratio >80%, latency P99 <1ms
- [ ] Elasticsearch tested: indexing latency <5s (events → searchable in <5s)
- [ ] Backup tested: restore from backup → data integrity verified
- [ ] Data sync tested: event stream → Elasticsearch projection → index matches events

**Monitoring**:
- Database latency per service (P99 <100ms target for transactional)
- Cache hit ratio (alert if <70% = cache thrashing)
- Storage growth rate (alert if >1TB/month = unusual spike)
- Replication lag (PostgreSQL replicas, Elasticsearch shards, alert if >1s)

---

### ADR-007: Legacy Integration Pattern (Anti-Corruption Layer + Strangler Fig)

**Context**:
- Legacy systems have outdated technology, implicit business rules, poor documentation
- Big bang replacement is risky (all-or-nothing cutover)
- Incremental migration via Strangler Fig allows validation + rollback
- Anti-Corruption Layer (ACL) isolates modern services from legacy constraints

**Decision**:
- Strangler Fig pattern: gradually replace legacy by intercepting calls → route to modern services
- Anti-Corruption Layer (ACL): adapter service translates modern API ↔ legacy protocol (JSON ↔ COBOL fixed-width)
- 4-phase migration: Wrap (understand + baseline), Introduce (deploy modern service), Migrate (shift traffic), Retire (decommission legacy)
- Canary deployment: start at 10% traffic → modern service; monitor; gradually increase to 100%

**Alternatives Considered**:
- Big bang replacement: Pro = fast, clean break. Con = high risk (all-or-nothing), long implementation, hard to rollback.
- Parallel run (legacy + modern): Pro = safety. Con = data sync complexity, longer timeline, operational overhead (run both systems).
- Lift-and-shift to cloud (no re-architecture): Pro = faster than Strangler. Con = legacy constraints remain (scaling, maintenance), doesn't solve underlying problems.

**Why Chosen**:
- Strangler Fig balances speed (not big bang) with safety (incremental, rollback possible)
- ACL allows modern services to use modern APIs (not constrained by legacy protocol)
- Phased approach allows learning + course-correction

**Consequences**:
- ✅ Low risk: can rollback traffic if modern service has issues
- ✅ Validation: each capability validated in canary before full cutover
- ✅ Operational: legacy continues to handle traffic (no service outage risk during migration)
- ❌ Timeline: incremental approach slower than big bang (typically 12–18 months vs 6 months)
- ❌ Operational burden: run both legacy + modern in parallel (longer overlap period)
- ❌ ACL complexity: must maintain detailed legacy ↔ modern mapping (brittle if legacy changes)
- ⚠️ Data consistency: eventual consistency between legacy and modern (reconciliation needed)

**Trade-off Summary**:
- We gain: Safety + validation (risk ↓)
- We lose: Speed (timeline ↑) + operational overhead (parallel systems)
- We assume: Legacy system remains stable enough to coexist (can tolerate for 12–18 months)

**Validation**:
- [ ] ACL adapter tested: legacy data → translation → modern format matches contract
- [ ] Canary tested: 10% traffic to modern service → monitor error rate, latency
- [ ] Rollback tested: switch traffic back to legacy (no data loss)
- [ ] Reconciliation tested: legacy + modern data synced (daily batch validation)

**Monitoring**:
- Canary error rate (alert if >2% vs legacy <0.5%)
- ACL translation latency (P99 <100ms target)
- Data reconciliation mismatches (alert if any)
- Strangler Fig traffic split (log % of traffic routed to modern vs legacy)

---

## Output Format

**Document name**: `ADR_Collection_[ClientName]_[Date].md`

**Structure per ADR**:
1. Title: ADR-00X: [Decision Name]
2. Status: Proposed | Accepted | Deprecated
3. Date & Deciders
4. Context (Forces at play, problem statement, background)
5. Decision (What was chosen, rationale)
6. Alternatives Considered (What else evaluated, why rejected)
7. Consequences (Positive ✅, Negative ❌, Trade-offs ⚠️)
8. Validation (How to test decision)
9. Monitoring (How to detect if decision was wrong)
10. Related ADRs (Dependencies, supersedes)

## Validation Checklist

- [ ] Minimum 6 ADRs documented
- [ ] Each ADR references Phase 1 findings (e.g., "Regulatory requirement from Phase 1 CAM")
- [ ] Each ADR references Phase 3 scenario trade-offs (e.g., "Conservative scenario prefers simpler deployment")
- [ ] All major architectural decisions have corresponding ADR
- [ ] Alternatives section is balanced (not strawman rejected alternatives, genuine trade-offs)
- [ ] Consequences section has both positive + negative (not one-sided)
- [ ] Monitoring section specifies alerts/metrics (concrete, measurable)
- [ ] Related ADRs cross-referenced (if ADR-003 depends on ADR-001, both note relationship)
