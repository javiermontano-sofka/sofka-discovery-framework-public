# Backend Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Backend architecture governs how systems process requests, enforce business rules, manage data flow, and integrate with external services. The API protocol, middleware strategy, authentication approach, and messaging topology collectively determine a system's reliability, scalability, and developer ergonomics. This document provides pattern-level guidance for senior architects designing or evaluating backend systems.

## Core Patterns

### API Protocol Selection: REST vs GraphQL vs gRPC

**REST**: Resource-oriented, HTTP verbs, JSON payloads. Universally understood, excellent tooling (OpenAPI/Swagger), cacheable via HTTP semantics. Best for public APIs, CRUD-dominant services, and teams that value simplicity. Trade-off: over-fetching/under-fetching requires multiple endpoints or query parameters; no built-in schema evolution beyond versioning.

**GraphQL**: Client-driven queries, single endpoint, strong typing via schema. Eliminates over-fetching, enables frontend autonomy. Best for BFF (Backend for Frontend) layers, mobile clients with bandwidth constraints, and complex entity graphs. Trade-off: N+1 query risk (requires DataLoader pattern), caching complexity (no HTTP caching by default), authorization at field level is non-trivial.

**gRPC**: Protocol Buffers over HTTP/2, binary serialization, bidirectional streaming. Lowest latency for service-to-service communication, strong contracts via .proto files, code generation for multiple languages. Best for internal microservice communication, real-time streaming, polyglot environments. Trade-off: not browser-native (requires gRPC-Web or gateway), debugging binary payloads is harder, steeper learning curve.

**Hybrid pattern**: REST or GraphQL at the edge (public/BFF), gRPC internally between services. This is the dominant pattern at scale.

### Middleware & Request Lifecycle

A well-structured middleware pipeline follows a consistent order: request logging, rate limiting, authentication, authorization, input validation, business logic, response transformation, error handling, response logging.

**Express/Koa/Fastify (Node.js)**: Middleware functions chained via `app.use()`. Order matters. Fastify uses plugin-based encapsulation with schema-based validation for performance.

**Spring Boot (Java/Kotlin)**: Filter chain (servlet filters), interceptors (HandlerInterceptor), and AOP (aspects) provide three middleware layers. Filters for cross-cutting HTTP concerns, interceptors for controller-level logic, AOP for business-level cross-cutting.

**ASP.NET Core**: Middleware pipeline configured in `Program.cs`. Built-in middleware for auth, CORS, static files. Custom middleware via `IMiddleware` or convention-based.

**Key principle**: Fail fast. Authentication and validation middleware should reject invalid requests before they reach business logic, reducing attack surface and compute waste.

### Authentication & Authorization Patterns

**OAuth 2.0 + OIDC**: Industry standard for delegated authorization and identity. Authorization Code flow with PKCE for web/mobile. Client Credentials for service-to-service. Token introspection or JWT validation at API gateway.

**JWT (JSON Web Tokens)**: Stateless auth tokens containing claims. Access tokens (short-lived, 5-15 min) + refresh tokens (longer-lived, stored securely). Validate signature and expiration on every request. Trade-off: cannot be revoked without a blocklist or short expiry.

**Session-based auth**: Server-side session store (Redis, database). Cookie-based. Simpler revocation (delete session), but requires sticky sessions or shared session store. Better for traditional web apps, worse for microservices.

**API keys**: Simple, static credentials for service-to-service or developer API access. Always hash stored keys, rotate regularly, scope to specific permissions. Never use API keys as the sole auth mechanism for user-facing endpoints.

**RBAC vs ABAC vs ReBAC**: Role-Based (simple, coarse-grained), Attribute-Based (flexible, policy-driven via OPA/Cedar), Relationship-Based (graph-based, like Google Zanzibar/SpiceDB). Choose based on permission complexity.

### Error Handling Strategy

**Structured error responses**: Consistent format across all endpoints. Include error code (machine-readable), message (human-readable), details (field-level errors), and correlation ID (for tracing). HTTP status codes must be semantically correct — 400 for client errors, 500 for server errors, never 200 with error body.

**Error boundaries**: Domain exceptions map to HTTP status codes at the controller/adapter layer. Domain logic throws domain-specific errors; infrastructure layer translates. Never leak stack traces or internal details to clients in production.

**Retry semantics**: Distinguish retriable (503, 429, network timeout) from non-retriable (400, 401, 404) errors in API documentation. Return `Retry-After` header for rate-limited responses.

### Message Queuing & Async Processing

**RabbitMQ**: AMQP protocol, exchange-based routing (direct, topic, fanout, headers). Best for task queues, work distribution, RPC-style async. Supports message acknowledgment, dead-letter queues, priority queues. Trade-off: single-cluster scalability limits; not designed for event streaming.

**Apache Kafka**: Distributed commit log, partitioned topics, consumer groups. Best for event streaming, event sourcing, high-throughput data pipelines. Guaranteed ordering within partitions. Trade-off: operational complexity, consumer offset management, not ideal for traditional task queues.

**Amazon SQS / SNS**: Managed queue (SQS) and pub/sub (SNS) services. SQS for decoupling producers/consumers with at-least-once delivery. SNS for fan-out. FIFO queues for ordering guarantees. Best for AWS-native architectures. Trade-off: vendor lock-in, 256KB message size limit, no replay capability.

**Pattern selection**: Use RabbitMQ for task distribution and traditional messaging. Use Kafka when you need event replay, stream processing, or high-throughput event pipelines. Use SQS/SNS when already on AWS and operational simplicity matters most.

### Caching Strategy

**Cache-aside (lazy loading)**: Application checks cache, fetches from source on miss, populates cache. Most common pattern. Trade-off: cache miss penalty, potential stale data.

**Write-through**: Application writes to cache and source simultaneously. Ensures cache freshness. Trade-off: write latency increase.

**Write-behind (write-back)**: Application writes to cache, cache asynchronously writes to source. Best write performance. Trade-off: data loss risk if cache fails before flush.

**Cache layers**: L1 (in-process, e.g., Caffeine, node-cache) for hot data, L2 (distributed, e.g., Redis, Memcached) for shared state. CDN for static and semi-static content. HTTP caching (ETags, Cache-Control) for client-side.

## Decision Framework

| Criterion | REST | GraphQL | gRPC |
|-----------|------|---------|------|
| Public API | Best | Good | Poor |
| Mobile client | Good | Best | Good (with proxy) |
| Service-to-service | Good | Overkill | Best |
| Real-time streaming | Poor (SSE/WS) | Subscriptions | Native |
| Caching simplicity | Best (HTTP) | Complex | Manual |
| Schema evolution | Versioning | Additive | Proto evolution |
| Tooling maturity | Highest | High | Medium |

## Anti-Patterns

- **God service**: A single backend service handling all domains. Symptom: 50+ database tables, 200+ endpoints, deployment fear. Decompose by bounded context.
- **Chatty API**: Client makes 10+ API calls to render one screen. Solution: BFF layer, GraphQL, or composite endpoints.
- **Synchronous chain**: Service A calls B calls C calls D synchronously. Latency compounds, one failure cascades. Introduce async messaging for non-critical paths.
- **Cache stampede**: Cache expires, hundreds of concurrent requests hit the database simultaneously. Solution: staggered TTLs, probabilistic early expiration, or cache locking.

## Evidence Signals

- `openapi.yaml` or `swagger.json` indicates REST API with documentation. Check version (OpenAPI 3.x preferred).
- `schema.graphql` or `.gql` files indicate GraphQL. Check for DataLoader usage (N+1 mitigation).
- `.proto` files indicate gRPC. Check for `google.api.http` annotations (REST gateway).
- `docker-compose.yml` with `rabbitmq`, `kafka`, or `redis` services reveals messaging and caching choices.
- Error response consistency: sample 5 error responses — if formats differ, error handling strategy is missing.
- Middleware ordering in entry point files (`app.ts`, `Program.cs`, `Application.java`) reveals security posture.

---
*Sovereign Architect RAG Priming · JM Labs*
