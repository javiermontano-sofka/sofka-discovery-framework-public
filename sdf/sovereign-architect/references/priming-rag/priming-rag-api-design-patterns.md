# API Design Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

API design is the contract between systems. A well-designed API is intuitive, consistent, evolvable, and performant. Poor API design creates friction for consumers, generates support burden, and constrains system evolution. This document covers REST maturity, GraphQL schema design, gRPC service definitions, versioning strategies, pagination, rate limiting, and hypermedia patterns for architects designing or governing APIs.

## Core Patterns

### REST Maturity Model (Richardson)

**Level 0 — The Swamp of POX**: Single endpoint, single HTTP method (POST), operation encoded in the body. Essentially RPC over HTTP. Anti-pattern for REST but common in legacy SOAP-to-REST migrations.

**Level 1 — Resources**: Multiple endpoints mapped to resources (`/users`, `/orders`, `/products`). Still using single HTTP method. Improvement: URI structure reflects domain model.

**Level 2 — HTTP Verbs**: Resources + correct HTTP methods. GET (read, cacheable, safe), POST (create), PUT (full replace), PATCH (partial update), DELETE (remove). Status codes are semantically correct (201 Created, 204 No Content, 404 Not Found, 409 Conflict). This is the target for most REST APIs.

**Level 3 — Hypermedia (HATEOAS)**: Responses include links to related resources and available actions. Clients discover API capabilities dynamically rather than hardcoding URLs. Rarely implemented fully but valuable for discoverability in public APIs.

**Practical REST conventions**: Plural nouns for resources (`/users`, not `/user`). Nested resources for strong relationships (`/users/{id}/orders`). Query parameters for filtering, sorting, and pagination (`/users?status=active&sort=-created_at&limit=20`). Consistent error response format across all endpoints.

### GraphQL Schema Design

**Schema-first design**: Define the GraphQL schema (SDL) before implementation. Schema is the contract — review it as carefully as an API specification. Use descriptive type names and field names. Add descriptions to types and fields for auto-generated documentation.

**Type design patterns**: Use custom scalar types for domain-specific values (DateTime, Email, URL, Money). Connection pattern for paginated lists (edges + nodes + pageInfo). Input types for mutations (separate from output types). Union types for polymorphic responses. Interface types for shared fields across related types.

**Resolver architecture**: Keep resolvers thin — delegate to service/domain layer. Use DataLoader for batching and caching to prevent N+1 queries. DataLoader batches all loads within a single tick/event loop cycle and deduplicates by key. Every relationship field should use a DataLoader.

**Error handling**: Use the `errors` array in GraphQL response for operational errors. Use union types for expected business errors (`type CreateUserResult = User | ValidationError | DuplicateEmailError`). This makes error handling explicit in the schema and type-safe for clients.

**Performance protection**: Query depth limiting (prevent deeply nested queries), query complexity analysis (assign cost to fields, reject queries exceeding threshold), persisted queries (client sends a query hash, server looks up the full query — prevents arbitrary queries in production).

### gRPC Service Definitions

**Proto file design**: One service per `.proto` file for clear ownership. Use packages for namespacing (`package mycompany.myservice.v1`). Define request and response as separate message types (even for simple operations) for future extensibility.

**Field design**: Use field numbers carefully — they are permanent. Never reuse or change field number meaning. Reserve deleted field numbers (`reserved 3, 7;`). Use `optional` for fields that may not be set. Use `oneof` for mutually exclusive fields. Use `repeated` for lists. Avoid deeply nested messages — flatten when possible.

**Streaming patterns**: Unary (request-response, most common), server streaming (client sends one request, server streams responses — real-time feeds, file download), client streaming (client streams requests, server sends one response — file upload, aggregation), bidirectional streaming (both stream — chat, real-time collaboration).

**Proto evolution rules**: Add new fields (always safe). Remove fields (mark as reserved). Never change field types or numbers. Never rename fields (wire format uses numbers, not names, but it breaks JSON transcoding). Add new RPC methods freely. Never remove or rename RPC methods in the same version.

### API Versioning

**URL path versioning** (`/v1/users`, `/v2/users`): Most explicit, easy to route, easy to understand. Trade-off: URL pollution, cache key divergence, breaking change perception. Recommended for public APIs where clarity matters most.

**Header versioning** (`Accept: application/vnd.api.v2+json` or `API-Version: 2`): Cleaner URLs, same resource identity across versions. Trade-off: less discoverable, harder to test in browser, easy to forget the header. Suitable for internal APIs with controlled clients.

**Query parameter versioning** (`/users?version=2`): Simple to implement and test. Trade-off: pollutes query strings, can conflict with functional query parameters. Rarely recommended.

**Additive versioning (no explicit version)**: Add fields, never remove. Deprecated fields are ignored. GraphQL and gRPC naturally support this via schema evolution rules. Best for APIs with controlled consumers where backward compatibility can be enforced.

**Strategy**: Use URL path versioning for public REST APIs. Use additive versioning for internal APIs and GraphQL. Reserve new major versions for fundamental model changes, not incremental improvements.

### Pagination Patterns

**Offset-based** (`?offset=20&limit=10`): Simple, supports random page access. Trade-off: performance degrades for large offsets (database scans and discards rows), inconsistent results if data changes between pages (duplicates or missing items).

**Cursor-based** (`?after=eyJpZCI6MTAwfQ&limit=10`): Encode the position in an opaque cursor (base64-encoded last-seen ID or timestamp). Consistent pagination regardless of data changes. Efficient — database uses index seek, not offset scan. Trade-off: no random page access, cursor is opaque to clients.

**Keyset-based** (`?created_at_gt=2024-01-15T10:30:00Z&id_gt=1000&limit=10`): Explicit keyset pagination using indexed columns. Same performance benefits as cursor-based but with transparent parameters. Trade-off: requires stable sort order, complex for multi-column sorting.

**Recommendation**: Cursor-based for most APIs. Offset-based only for small datasets or when random page access is required. Always return total count separately (optional, via header or response field) — counting can be expensive on large tables.

### Rate Limiting

**Algorithms**: Token bucket (burst-friendly, most common — tokens refill at a steady rate, each request consumes a token), sliding window (smoother distribution, counts requests in a rolling time window), fixed window (simplest, count per time period — allows burst at window boundaries), leaky bucket (smoothest output rate).

**Implementation layers**: API gateway (global rate limiting, easiest to implement — Kong, AWS API Gateway, Cloudflare), application middleware (per-route, per-user granularity), distributed rate limiter (Redis-based, consistent across instances — sliding window counter in Redis with Lua scripts).

**Response headers**: `X-RateLimit-Limit` (maximum requests per window), `X-RateLimit-Remaining` (requests remaining), `X-RateLimit-Reset` (Unix timestamp when window resets), `Retry-After` (seconds to wait, returned with 429 responses). These are IETF draft standard headers.

**Strategy**: Tiered rate limits — per IP (prevent abuse), per API key (enforce plan limits), per user (prevent accidental overuse). Higher limits for authenticated requests. Separate rate limits for read (GET) and write (POST/PUT/DELETE) operations.

### HATEOAS and Hypermedia

**Concept**: Responses include hyperlinks to related resources and available actions, enabling clients to navigate the API dynamically. The server drives available transitions based on current resource state.

**Implementation**: JSON:API (standard format with links and relationships), HAL (Hypertext Application Language — `_links` and `_embedded`), or custom link objects. Include `self`, `next`, `prev` links in collections. Include action links on resources (`cancel`, `approve`, `archive`).

**Practical value**: Most useful for public APIs consumed by diverse clients that benefit from discoverability. Less valuable for internal APIs with tightly coupled clients that already know the URL structure. Consider selective HATEOAS — include navigation links in collection responses and state-transition links on workflow-oriented resources.

## Decision Framework

| Aspect | REST | GraphQL | gRPC |
|--------|------|---------|------|
| Versioning | URL path or header | Schema evolution | Proto versioning |
| Pagination | Cursor or offset | Connection pattern | Repeated + page token |
| Rate limiting | Standard headers | Query complexity | Deadline + quota |
| Error format | RFC 7807 Problem Details | Errors array + union types | gRPC status codes |
| Documentation | OpenAPI 3.x | Schema introspection | Proto + buf docs |
| Client generation | openapi-generator | graphql-codegen | protoc + plugins |

## Anti-Patterns

- **Inconsistent naming**: Mixing camelCase and snake_case, plural and singular resources, different error formats across endpoints. Establish naming conventions in an API style guide and enforce via linting (Spectral for OpenAPI).
- **Leaking internal models**: API response mirrors database schema exactly, including internal IDs, join tables, and implementation details. Design the API contract independently from storage — map between them in the adapter layer.
- **Missing pagination**: Endpoints that return unbounded lists. Every list endpoint must support pagination with a default and maximum page size. An endpoint returning 100,000 records kills both server and client.
- **Ignoring idempotency**: POST endpoints that create duplicate resources on retry. Implement idempotency keys for all state-changing operations to make retries safe. Store processed keys with results for the deduplication window (24-72 hours).

## Evidence Signals

- `openapi.yaml` or `swagger.json` — REST API documentation maturity. Check spec version (3.x preferred over 2.0).
- Spectral or Redocly lint config — API style guide enforcement.
- `.graphqlrc`, `codegen.ts`, or `.gql` files — GraphQL adoption and client code generation.
- `.proto` files with `buf.yaml` or `buf.gen.yaml` — gRPC with modern tooling (buf over raw protoc).
- Rate limit headers in API responses — rate limiting implementation.
- Pagination parameters in endpoint definitions — bounded list responses.
- Error response format consistency — sample multiple error responses to verify consistent structure.
- API versioning strategy visible in URL patterns or header usage.

---
*Sovereign Architect RAG Priming · JM Labs*
