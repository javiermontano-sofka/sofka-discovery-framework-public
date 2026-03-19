# Microservices Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Microservices architecture decomposes a system into independently deployable services, each owning its data and communicating over the network. This document covers decomposition strategies, communication patterns, data management, and operational concerns that arise when an architect evaluates or designs a microservices system.

## Decomposition Strategies

### By Business Capability

Align services to what the business does: billing, inventory, shipping, user management. Each service encapsulates a business function end-to-end (UI logic, business rules, data). Works well when business domains are stable and well-understood. Risk: services become too coarse if capabilities are poorly defined.

### By Subdomain (DDD)

Use Domain-Driven Design bounded contexts as service boundaries. Core domains get dedicated services with rich models; supporting domains can be simpler CRUD services; generic domains (auth, notifications) become shared services. Requires investment in domain modeling workshops. Produces the most maintainable boundaries long-term.

### By Use Case / User Journey

Split along user journeys: checkout flow, onboarding flow, reporting flow. Each service handles one flow end-to-end. Risk: cross-cutting concerns (user profile, permissions) end up duplicated. Works for event-driven systems where flows are naturally independent.

### Strangler Fig Migration

Incrementally extract services from a monolith by intercepting calls at the edge (API gateway, reverse proxy). New functionality goes to new services; existing functionality migrates gradually. The monolith shrinks over time until it can be retired. Critical success factor: a robust routing layer that can split traffic by feature.

## Bounded Contexts and Aggregates

A bounded context defines where a model applies. The same concept (e.g., "Customer") has different representations in different contexts (billing vs. shipping). Translation happens at context boundaries via anti-corruption layers, published language, or shared kernel.

Aggregates are consistency boundaries within a context. One aggregate = one transactional unit. Cross-aggregate operations require eventual consistency (sagas, domain events). Common mistake: making aggregates too large, which creates contention. Rule of thumb: an aggregate should be loadable in a single database transaction.

### Context Mapping Patterns

| Pattern | When to Use |
|---------|------------|
| **Shared Kernel** | Two teams co-own a small model (risky — requires coordination) |
| **Customer-Supplier** | Upstream team serves downstream; downstream influences upstream priorities |
| **Conformist** | Downstream adopts upstream model as-is (no negotiation power) |
| **Anti-Corruption Layer** | Translate between incompatible models at the boundary |
| **Open Host Service** | Publish a well-defined protocol for multiple consumers |
| **Published Language** | Shared schema language (Protobuf, Avro, JSON Schema) |
| **Separate Ways** | No integration — teams operate independently |

## Communication Patterns

### Synchronous

| Pattern | Protocol | Trade-off |
|---------|----------|-----------|
| **REST** | HTTP/JSON | Universal, cacheable, but creates temporal coupling |
| **gRPC** | HTTP/2 + Protobuf | High performance, strong contracts, but harder to debug |
| **GraphQL** | HTTP/JSON | Flexible queries, but complexity in federated scenarios |

### Asynchronous

| Pattern | Mechanism | Trade-off |
|---------|-----------|-----------|
| **Event Notification** | Thin event → consumer fetches data | Loose coupling, but requires callback to producer |
| **Event-Carried State Transfer** | Fat event with all data | No callbacks, but larger payloads and schema evolution |
| **Command Message** | Direct instruction to a service | Clear intent, but creates coupling to consumer's API |
| **Request-Reply (async)** | Correlation ID over message broker | Decoupled, but complex error handling |

### Broker Technologies

| Broker | Strength | When to Choose |
|--------|----------|---------------|
| **Apache Kafka** | Log-based, replay, high throughput | Event sourcing, analytics, high-volume streams |
| **RabbitMQ** | Flexible routing, mature, AMQP | Task queues, RPC, complex routing rules |
| **Amazon SQS/SNS** | Managed, scalable, cheap | AWS-native, simple pub/sub + queue patterns |
| **NATS** | Ultra-low latency, lightweight | Real-time systems, edge computing |
| **Redis Streams** | In-memory, consumer groups | Low-latency event processing, already using Redis |

## Saga Pattern

Manages distributed transactions across services without 2PC (two-phase commit).

### Choreography

Each service listens for events and reacts. No central coordinator. Simple for 2-3 step flows. Becomes hard to reason about with many participants. Compensating transactions must be designed for each step.

```
OrderService → OrderCreated
PaymentService listens → PaymentProcessed
InventoryService listens → InventoryReserved
ShippingService listens → ShipmentScheduled
```

### Orchestration

A central saga orchestrator tells each participant what to do. Easier to understand, debug, and modify. The orchestrator becomes a single point of complexity (but not failure if designed well). Better for flows with many steps or conditional logic.

```
SagaOrchestrator:
  1. Tell PaymentService: charge
  2. Tell InventoryService: reserve
  3. Tell ShippingService: schedule
  On failure at step N: compensate steps N-1...1
```

### Choosing Between Them

| Factor | Choreography | Orchestration |
|--------|-------------|---------------|
| Steps in flow | 2-3 | 4+ |
| Conditional logic | Minimal | Complex |
| Visibility | Low (distributed) | High (centralized) |
| Coupling | Loose | Moderate (to orchestrator) |
| Testing | Hard (integration) | Easier (unit test orchestrator) |

## Service Mesh

A dedicated infrastructure layer for service-to-service communication. Handles retries, circuit breaking, mTLS, observability without application code changes.

### Sidecar Pattern

Each service instance gets a proxy sidecar (e.g., Envoy) that intercepts all network traffic. The application speaks to localhost; the sidecar handles routing, TLS, retries, and telemetry.

| Mesh | Control Plane | Data Plane | Complexity |
|------|--------------|------------|-----------|
| **Istio** | istiod | Envoy | High — powerful but operationally heavy |
| **Linkerd** | Rust control plane | Linkerd-proxy | Medium — simpler, lighter, Kubernetes-native |
| **Consul Connect** | Consul | Envoy | Medium — multi-platform, service discovery included |
| **AWS App Mesh** | AWS managed | Envoy | Low — AWS-native, limited customization |

### When to Use a Service Mesh

- 10+ services communicating over the network
- Need mTLS without modifying application code
- Need consistent retry/timeout/circuit-breaker policies
- Need distributed tracing without SDK instrumentation
- NOT justified for <5 services (overhead exceeds benefit)

## Data Patterns

### Database per Service

Each service owns its database. No shared databases. Cross-service queries require API calls or event-driven projections. This is the fundamental constraint that enables independent deployment.

### API Composition

A composer service calls multiple services and joins the results. Simple but creates temporal coupling. Works for read-heavy, latency-tolerant queries.

### CQRS with Projections

Services publish events; a dedicated read service builds denormalized projections optimized for queries. Decouples read and write scaling. Trade-off: eventual consistency and projection rebuild complexity.

## Anti-Patterns

| Anti-Pattern | Problem | Fix |
|-------------|---------|-----|
| **Distributed Monolith** | Services coupled via shared DB or synchronous chains | Enforce database-per-service, use async communication |
| **Chatty Services** | Excessive inter-service calls per request | Coarsen service boundaries or use event-carried state |
| **Shared Libraries Coupling** | Common library updates force all services to redeploy | Keep shared libraries thin; version independently |
| **Mega Service** | One service does too much (>3 bounded contexts) | Decompose along bounded context lines |
| **Nano Service** | Service too small to justify operational overhead | Merge into a modular monolith boundary |

## Decision Framework

| Factor | Microservices Justified | Stay Monolithic |
|--------|------------------------|-----------------|
| Team count | 5+ teams, need autonomy | 1-3 teams |
| Domain clarity | Bounded contexts well-understood | Domains still evolving |
| Deployment frequency | Different services release at different cadences | Uniform release cadence |
| Scaling needs | Different components have different scaling profiles | Uniform scaling |
| Tech diversity | Teams need different languages/frameworks | Uniform tech stack |
| Operational maturity | CI/CD, monitoring, alerting mature | Operational capabilities limited |

---

*Sovereign Architect — Decompose by evidence, not by enthusiasm.*
*JM Labs · Javier Montano.*
