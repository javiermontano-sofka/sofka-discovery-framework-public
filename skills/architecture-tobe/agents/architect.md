# Architect Agent

## Purpose

Designs C4 L2 container architecture from approved Phase 3 scenario + Phase 1 constraints + Phase 2 integration map. Selects patterns per concern (communication, consistency, security, deployment), maps DDD domains to service boundaries, outputs C4 L2 ASCII diagram with layer descriptions and pattern selection rationale.

## Input Requirements

**From Phase 3** (Approved Scenario):
- Selected scenario (Conservative/Moderate/Aggressive)
- Estimated team size, timeline, cost constraints
- Technology preferences (cloud-native vs on-prem, monolith vs microservices)

**From Phase 1** (Current-State Discovery):
- AS-IS system inventory (technologies, integrations, compliance constraints)
- Performance requirements (latency, throughput, availability targets)
- Regulatory requirements (data residency, audit trail, encryption)

**From Phase 2** (Integration Mapping):
- DDD bounded contexts (business domains)
- Integration complexity matrix (which systems interact, sync/async)
- Data ownership model (which system owns which data)
- User/system roles and access patterns

## Architecture Design Process

### Step 1: Determine Service Boundaries (DDD-Aligned)

For each DDD bounded context (from Phase 2):

```
IF domain is Core (critical business capability, unique to organization):
  → Dedicated microservice (one team owns end-to-end)
  → Example: Payment Service, Account Management Service

IF domain is Supporting (important but commoditized):
  → Shared service or library module (shared by multiple teams)
  → Example: Notification Service, Audit Service (can be shared)

IF domain is Generic (no differentiation, best-of-breed available):
  → Buy/SaaS or open-source library (don't build)
  → Example: Authentication (use OAuth2 provider), Email (use SendGrid), SMS (use Twilio)
```

### Step 2: Select Communication Patterns per Service Pair

For each inter-service dependency:

```
IF consistency is critical AND latency <100ms acceptable:
  → Synchronous (REST, gRPC)
  → Example: Payment Service → Account Service (debit must be immediate)

IF eventual consistency acceptable AND resilience is priority:
  → Asynchronous (Event-Driven via Kafka)
  → Example: Payment Service → Notification Service (email can arrive 30s later)

IF hybrid needed (some paths sync, some async):
  → API Gateway (sync) + Kafka (async for side effects)
  → Example: API validates payment (sync), publishes audit event (async)
```

### Step 3: Select Consistency Model

```
IF financial transaction AND accuracy is paramount:
  → Saga Pattern (Orchestration for complex flows, Choreography for simple)
  → Data consistency: Eventual (via compensating transactions)
  → Atomic writes at each service boundary (local ACID)

IF analytics/reporting AND joins across services needed:
  → Event Sourcing (all mutations captured as immutable events)
  → CQRS (separate write model from read projections)
  → Data consistency: Eventual (reads lag writes by seconds)

IF hybrid:
  → Saga for transactional paths (payments, transfers)
  → Event Sourcing for audit trail (who did what, when)
  → CQRS for analytics read models (reporting database)
```

### Step 4: Select Security Model

```
IF regulated (banking, healthcare, PCI-DSS):
  → Zero Trust Architecture (mTLS service-to-service, OAuth2 user auth)
  → Data encryption: at-rest (TDE/transparent encryption) + in-transit (TLS)
  → Every request authenticated + authorized (RBAC)

IF compliance audit trails critical:
  → Immutable audit log (append-only PostgreSQL table, searchable via Elasticsearch)
  → Event Sourcing captures all mutations (automatic audit trail)

IF vendor/partner integrations:
  → API Gateway enforces OAuth2/OpenID Connect
  → Rate limiting per partner (prevent abuse)
  → Signed JWTs with RS256 asymmetric crypto (partner verifies signature)
```

### Step 5: Select Deployment Strategy

```
IF cloud-eligible AND ops team experienced:
  → Kubernetes + Service Mesh (Istio)
  → GitOps deployment (ArgoCD)
  → Auto-scaling, self-healing, distributed tracing built-in

IF cloud-eligible BUT ops team inexperienced:
  → Simpler deployment: VMs + container runtime (Docker) + basic monitoring
  → Defer service mesh (Istio) to Phase 5+ (learning curve too steep)

IF on-prem only:
  → VM-based deployment (Terraform + Ansible)
  → Or on-prem Kubernetes (OpenShift)
  → Or containerized but not orchestrated (Docker Swarm)

IF budget constrained:
  → Serverless/FaaS (AWS Lambda, Google Cloud Functions) for stateless functions
  → Reduces operational overhead (no container management)
  → Trade-off: Cold start latency, vendor lock-in
```

### Step 6: Map Data Storage

```
Per service, choose storage aligned with access patterns:

IF transactional (frequent writes, strong consistency required):
  → PostgreSQL (OLTP, ACID, relational)
  → Owned exclusively by one microservice

IF caching (frequently accessed reference data):
  → Redis (in-memory, sub-millisecond latency, TTL support)
  → Cache-aside pattern (check Redis first, miss → fetch from DB → cache)

IF search/analytics (full-text search, aggregations):
  → Elasticsearch (inverted index, powerful queries, eventual consistency)
  → Powered by Kafka events (fed from canonical event stream)

IF audit trail (immutable log, time-travel queries):
  → PostgreSQL append-only table (Event Store)
  → Elasticsearch secondary index for fast search

IF large files (blobs, documents):
  → S3/Cloud Storage (object storage, scalable)
  → PostgreSQL references blob URL (decoupled from relational data)
```

### Step 7: Output C4 L2 ASCII Diagram

Structure layers:

```
┌─────────────────────────────────────────┐
│ CONSUMER LAYER                          │
│ (Web, Mobile, Partner APIs)             │
└────────────────┬────────────────────────┘
                 │
┌────────────────┼────────────────────────┐
│ API GATEWAY LAYER                       │
│ (Auth, Rate Limiting, Routing)          │
└────────────────┼────────────────────────┘
                 │
┌────────────────┼────────────────────────┐
│ MICROSERVICES MESH                      │
│ (Auth Service, Account, Payment, etc.)  │
│ (Service-to-Service: mTLS)              │
│ (Message Bus: Kafka)                    │
└────────────────┼────────────────────────┘
                 │
┌────────────────┼────────────────────────┐
│ ANTI-CORRUPTION LAYER                   │
│ (Legacy Integration Adapters)           │
└────────────────┼────────────────────────┘
                 │
┌────────────────┼────────────────────────┐
│ LEGACY LAYER                            │
│ (Gradual Replacement via Strangler Fig) │
└────────────────┼────────────────────────┘
                 │
┌────────────────┼────────────────────────┐
│ DATA LAYER                              │
│ (PostgreSQL, Redis, Elasticsearch, S3)  │
└────────────────┼────────────────────────┘
                 │
┌────────────────┼────────────────────────┐
│ INFRASTRUCTURE & OBSERVABILITY          │
│ (K8s, Service Mesh, ELK, Jaeger)        │
└─────────────────────────────────────────┘
```

### Step 8: Document Pattern Selection Rationale

For each major decision, document why:

```
DECISION: API Gateway routes to Auth Service first (OAuth2 token validation)
RATIONALE:
  - Centralizes auth logic (single point of policy enforcement)
  - Prevents unauthenticated requests from reaching microservices
  - Easier to update auth rules (one place, not N service copies)
ALTERNATIVE CONSIDERED:
  - Each microservice validates tokens independently
  - Pro: Distributed, no single point of failure
  - Con: Hard to coordinate token rotation, policy changes inconsistent
  - Rejected because: Gateway approach wins for centralized control

DECISION: Kafka for async communication (not RabbitMQ or AWS SQS)
RATIONALE:
  - Kafka retains event history (replay for recovery, analytics)
  - RabbitMQ deletes after consume (no audit trail)
  - SQS has no replay capability (vendor lock-in)
TRADE-OFF: Kafka operational overhead (cluster to manage) vs. audit/replay benefits (critical for banking)

DECISION: PostgreSQL for all microservices (not polyglot: one uses MongoDB, another uses Cassandra)
RATIONALE:
  - Consistent operational model (single platform to monitor, back up, secure)
  - Team familiarity (all DevOps trained on PostgreSQL)
  - Cost efficiency (licensing, scale)
TRADE-OFF: Miss some optimization (could use MongoDB for document storage) but gain simplicity
```

## Output Format

**Document name**: `Architecture_C4_L2_[ClientName]_[Date].md`

**Sections**:
1. **Architecture Overview**: One-paragraph summary of TO-BE approach
2. **Service Inventory**: Table listing all microservices, domains, team assignment, dependencies
3. **C4 L2 Diagram**: ASCII diagram with layer annotations
4. **Layer Descriptions**: Each layer: responsibility, technologies, patterns, trade-offs
5. **Pattern Selection Rationale**: For each major decision (communication, consistency, security, deployment, storage)
6. **Service Catalog**: Detailed card per service (name, domain, data store, dependencies, owner, SLO targets)
7. **Decision Tree References**: Link to ADRs (to be filled by ADR Writer Agent)

## Validation Checklist

- [ ] All DDD bounded contexts from Phase 2 mapped to service or library
- [ ] All inter-service dependencies documented (sync/async choice explicit)
- [ ] Data ownership model clear (no shared databases between services)
- [ ] C4 L2 diagram reviewed by solution architect and CTO
- [ ] Each layer has clear responsibility boundary (no overlapping concerns)
- [ ] Pattern choices aligned with Phase 3 scenario (Conservative/Moderate/Aggressive)
- [ ] All Phase 1 constraints honored (regulatory, compliance, technology mandates)
- [ ] Trade-offs documented and stakeholder-reviewed
