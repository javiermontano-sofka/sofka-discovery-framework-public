---
name: sofka-api-architecture
description: >
  API design & governance — REST/GraphQL/gRPC, versioning, rate limiting, DX, contract-first.
  Use when the user asks to "design an API", "define API strategy", "implement contract-first",
  "set up API governance", "design API versioning", "improve developer experience",
  or mentions REST, GraphQL, gRPC, AsyncAPI, OpenAPI, API gateway, rate limiting, or API catalog.
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# API Architecture: Design, Governance & Developer Experience

API architecture defines how services expose capabilities to consumers — internal teams, partners, and third parties. The skill covers style selection, contract-first design, versioning strategy, security, developer experience, and lifecycle governance for APIs that scale and evolve gracefully.

## Principio Rector

**Un API sin contrato es una promesa sin garantía.** La especificación es el producto — el código es solo la implementación. Cada API nace de un contrato versionado, se valida contra DX medible, y evoluciona con política de deprecación explícita.

### Filosofía de API Architecture

1. **Contract-first, siempre.** El spec (OpenAPI, Protobuf, SDL) se escribe ANTES del código. Si no hay contrato, no hay API — hay un accidente expuesto al mundo.
2. **Versioning strategy upfront.** La estrategia de versionamiento se define en el diseño, no cuando el primer breaking change rompe producción. Cambiar la estrategia después cuesta 10x.
3. **DX drives adoption.** Developer Experience no es un nice-to-have — es el diferenciador competitivo. Un API con docs pobres es un API abandonado. Las APIs con mejor DX generan 2x más adopción.

## Inputs

The user provides a system or platform name as `$ARGUMENTS`. Parse `$1` as the **system/platform name** used throughout all output artifacts.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para análisis de estilos y contract design, HITL para versioning strategy y governance decisions.
  - **desatendido**: Cero interrupciones. API architecture documentada automáticamente. Supuestos documentados.
  - **supervisado**: Autónomo con checkpoint en style selection y security design.
  - **paso-a-paso**: Confirma cada style decision, contract spec, versioning policy, y DX plan.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 strategy + S2 contracts + S4 security) | `técnica` (full 6 sections, default)

Before generating API architecture, detect the codebase context:

```
!find . -name "*.yaml" -o -name "*.json" -o -name "*.proto" -o -name "*.graphql" -o -name "openapi*" -o -name "swagger*" | head -30
```

Use detected API specs, schemas, and service definitions to tailor style recommendations, versioning approach, and governance structure.

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/api-design-patterns.md
```

---

## When to Use

- Designing APIs for a new platform or service
- Choosing between REST, GraphQL, gRPC, or event-driven APIs
- Establishing contract-first development workflow
- Defining versioning and deprecation strategies
- Implementing API security (OAuth2, rate limiting, abuse prevention)
- Improving developer experience (docs, SDKs, sandboxes)
- Setting up API governance and lifecycle management

## When NOT to Use

- Internal code architecture and module design — use software-architecture
- Event-driven messaging and streaming — use event-architecture
- Infrastructure and platform design — use infrastructure-architecture
- End-to-end solution integration across systems — use solutions-architecture

---

## Delivery Structure: 6 Sections

### S1: API Strategy & Style Selection

Select the right API style for each use case and define the overall API strategy.

**Style Decision Matrix:**

| Criterion | REST | GraphQL | gRPC | AsyncAPI (event) |
|---|---|---|---|---|
| Primary use | CRUD, public APIs | Complex UIs, varied data | Internal high-perf | Real-time, decoupled |
| Tooling breadth | Broadest | Growing (60%+ enterprise by 2027) | Moderate | Emerging |
| Caching | HTTP native | Complex (requires persisted queries) | None built-in | N/A |
| Browser support | Full | Full | Limited (grpc-web) | WebSocket/SSE |
| Streaming | SSE only | Subscriptions | Bidirectional | Native |
| Best for | Broad adoption | Reducing over/under-fetching | Polyglot microservices | Pub/sub, webhooks |

**Richardson Maturity Model** — assess and target REST API maturity:
- **Level 0 (Swamp of POX):** Single URI, single HTTP method (POST), RPC-over-HTTP
- **Level 1 (Resources):** Multiple URIs for individual resources, still one HTTP method
- **Level 2 (HTTP Verbs):** Proper GET/POST/PUT/DELETE + status codes — minimum target for all APIs
- **Level 3 (HATEOAS):** Responses include hypermedia links guiding client next actions — target for public APIs where discoverability matters

**GraphQL Federation** — for organizations with 3+ teams contributing to a shared GraphQL API:
- Supergraph: unified schema composed from multiple subgraph services
- Gateway options: Apollo Router (Rust-based, high-perf), Netflix DGS (JVM), Grafbase (edge)
- Entity references: subgraphs extend types via `@key` directive
- Dedicated infra team owns the Gateway; domain teams own their subgraphs
- Below 3 teams: single-server GraphQL is simpler and sufficient

**API-first vs. Code-first Decision Criteria:**

| Factor | API-first (spec-first) | Code-first |
|---|---|---|
| Consumers | Multiple / external | Single / internal |
| Team size | >3 teams | 1-2 teams |
| Lifecycle | Long-lived, public | Prototype, short-lived |
| DX priority | High (2x revenue correlation) | Low |
| Overhead | Spec authoring, tooling setup | Minimal upfront |
| Risk | None | Spec drift, leaked internals |

**AsyncAPI 3.0** for event-driven API surfaces: When APIs include webhooks, SSE, or WebSocket channels, define them alongside OpenAPI. Supports Kafka, AMQP, MQTT protocol bindings and integrates with the same governance tooling.

### S2: Contract-First Design

Define APIs before implementation — schema as the source of truth.

**Spec tooling by style:**
- **REST:** OpenAPI 3.1 — paths, schemas, responses, examples, security schemes
- **gRPC:** Protocol Buffers — service definitions, message types, streaming RPCs
- **GraphQL:** SDL — types, queries, mutations, subscriptions, input types
- **Events:** AsyncAPI 3.0 — channels, messages, payload schemas, bindings

**Validation & linting:** Spectral (OpenAPI), buf (Protobuf), graphql-inspector (GraphQL)
**Mock servers:** Automated from specs for parallel frontend/backend development
**Code generation:** Server stubs, client SDKs, type definitions from contracts
**Contract testing:** Pact, Dredd, or schema-diff tools to verify implementation matches spec

**Key decisions:**
- Schema strictness: `additionalProperties: false` (strict) vs. open (flexible evolution)
- Example quality: Examples in specs improve DX and enable better mocks
- Contract ownership: API team vs. consuming team maintains the spec

### S3: Versioning & Evolution

Manage API changes without breaking consumers.

**Versioning Strategy Comparison:**

| Strategy | Pros | Cons | Best for |
|---|---|---|---|
| URI path (`/v1/`) | Explicit, easy routing | URL pollution | Public APIs |
| Header (`Accept: vnd.v2+json`) | Clean URLs | Harder to test/share | Partner APIs |
| Query param (`?version=2`) | Simple | Not RESTful | Internal APIs |
| Content negotiation | Different representations | Complex | Evolving resources |

**Lifecycle:** alpha -> beta -> stable -> deprecated -> sunset
**Deprecation policy:** Minimum 6-month notice, `Sunset` header (RFC 8594), migration guide
**Breaking vs. non-breaking:** Additive fields safe; removing/renaming breaks
**Compatibility testing:** Automated schema-diff in PRs detecting consumer impact
**Backward compatibility window:** 6 months (internal), 12 months (partner/public)

### S4: Security & Access Control

Protect APIs from unauthorized access, abuse, and attacks.

**Authentication:** OAuth 2.0 flows (authorization code + PKCE for SPAs/mobile, client credentials for S2S), API keys for identification, JWT for stateless verification
**Authorization:** Scope-based (OAuth), role-based (RBAC), attribute-based (ABAC) for fine-grained
**API gateway security:** WAF integration, IP allowlisting, mutual TLS for service-to-service

**Rate Limiting Algorithms:**

| Algorithm | Behavior | Best for |
|---|---|---|
| Token bucket | Allows bursts up to bucket size, refills at steady rate | General-purpose, bursty traffic |
| Sliding window log | Exact count per rolling window, memory-intensive | Precise enforcement |
| Sliding window counter | Approximation of sliding window, low memory | High-throughput APIs |
| Fixed window | Simple counter per time window, boundary spike risk | Low-complexity needs |
| Leaky bucket | Smooths output to constant rate | Queue-based rate shaping |

**Concrete rate limit tiers:** Free (100 req/min), Standard (1000 req/min), Enterprise (10000 req/min). Always return `429 Too Many Requests` with `Retry-After` header.

**Latency budgets:** Rate limiting infrastructure must add <5ms p99 overhead. Use in-memory stores (Redis) for counter checks; never add a network hop to a remote DB for every request.

### S5: Developer Experience

Make APIs easy to discover, learn, integrate, and debug.

**Documentation:** Interactive docs (Swagger UI, Redoc, GraphiQL, gRPC reflection)
**Getting started:** Auth setup -> first API call -> common workflows in <5 minutes
**SDKs:** Typed clients in JS, Python, Go, Java from OpenAPI/Protobuf specs
**Sandbox:** Isolated test environments with sample data, no production impact
**Error design:** Consistent format — `{ "type": "URI", "title": "string", "status": int, "detail": "string", "instance": "URI" }` (RFC 9457 Problem Details)
**Pagination:** Cursor-based (scalable, default) vs. offset-based (simple). Include `Link` headers.
**Status page:** API availability, latency metrics, incident history

### S6: API Governance & Lifecycle

Manage API portfolio — discovery, review, consistency, and retirement.

**API catalog:** Searchable registry with metadata, ownership, status, consumer count
**Design review:** Pre-implementation contract review by architecture team or API CoP
**Style guide enforcement:** Automated Spectral linting in CI/CD — block merges on violations
**Breaking change detection:** Schema diff in PRs with consumer impact analysis
**Usage analytics:** Endpoint popularity, error rates, latency percentiles, consumer distribution
**Sunset policy:** Deprecation announcement -> migration period -> traffic monitoring -> final removal

**API Health Score (0-100):**
- Design quality (linting pass rate): 25 pts
- Documentation completeness: 20 pts
- Adoption (active consumers): 20 pts
- Reliability (error rate <1%): 20 pts
- Security (auth coverage, no vulnerabilities): 15 pts

**AI-assisted governance (2025+):** Use LLM-based review to auto-check naming conventions, detect anti-patterns, and suggest improvements in PR comments. Supplements human review, does not replace it.

---

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **REST** | Broad tooling, HTTP caching, simplicity | Rigid resource model, over/under-fetching | Public APIs, CRUD, browser clients |
| **GraphQL** | Flexible queries, reduced round-trips | Caching complexity, N+1 risk, query cost | Complex UIs, mobile, varied data needs |
| **gRPC** | Performance, streaming, strong typing | Browser support limited, debugging harder | Internal services, high-throughput, polyglot |
| **Contract-First** | Design quality, parallel dev, mocks | Initial overhead, spec maintenance | Teams >3, public APIs, multi-consumer |
| **Code-First** | Speed, less ceremony | Spec drift, poor DX, breaking changes | Prototypes, single-consumer internal APIs |
| **Strict Versioning** | Stability, clear contracts | Maintenance burden, version proliferation | Public APIs, regulated industries |
| **Additive-Only** | No breaking changes, continuous deploy | Schema grows, deprecated fields linger | High-consumer-count APIs, SaaS platforms |

---

## Assumptions

- APIs serve identifiable consumers (internal teams, partners, or third parties)
- An API gateway or similar infrastructure exists or can be provisioned
- Team has capacity for API design review and documentation maintenance
- Security requirements are defined (authentication, authorization, rate limiting)

## Limits

- Focuses on API design and governance, not internal code architecture
- Does not design event-driven messaging systems
- Does not configure infrastructure (load balancers, gateways)
- GraphQL and gRPC require specialized operational knowledge beyond this scope
- API governance effectiveness depends on organizational adoption, not just tooling

---

## Edge Cases

**Legacy API Modernization:** Existing APIs with no spec. Start by generating spec from code (code-first), design target API, migrate consumers with a facade pattern.

**Internal-Only APIs:** Lower ceremony but still need contracts. Use lighter governance (guidelines, not gates). gRPC with code generation reduces friction.

**Public API Platform:** APIs are the product. DX is competitive advantage. Invest in docs, SDKs, sandboxes. Versioning must be conservative — breaking changes lose customers.

**High-Throughput / Low-Latency:** gRPC with streaming, connection pooling, binary serialization. Bound GraphQL query complexity. Rate limiting must add <5ms latency.

**Multi-Tenant API:** Tenant isolation in API layer (scoping, data filtering). Rate limiting per tenant. Universal API with tenant configuration over tenant-specific APIs.

---

## Validation Gate

Before finalizing delivery, verify:

- [ ] API style selection justified against use cases with decision matrix
- [ ] Contract-first workflow defined with specific linting and mock tooling
- [ ] Versioning strategy handles breaking and non-breaking changes with timelines
- [ ] Security covers authentication, authorization, and rate limiting with algorithm choice
- [ ] Error format is consistent, machine-readable (RFC 9457)
- [ ] Documentation is interactive with getting-started guide
- [ ] Governance process covers design review and breaking change detection in CI
- [ ] Deprecation and sunset policy defined with minimum notice periods
- [ ] API catalog or registry planned with health scoring
- [ ] Developer experience validated from consumer perspective

---

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | ✅ | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `A-01_API_Architecture.html` — Executive summary, API strategy, style selection matrix, contract-first workflow, versioning policy, security design, DX plan, governance lifecycle.

**Secondary:** OpenAPI spec templates, API style guide, review checklist, deprecation policy document, SDK generation configuration.

---
**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026
