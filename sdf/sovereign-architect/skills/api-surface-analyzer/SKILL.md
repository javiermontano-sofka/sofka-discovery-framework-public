---
name: api-surface-analyzer
author: JM Labs (Javier Montaño)
description: >
  REST, GraphQL, and gRPC contract analysis including versioning, consistency, and completeness.
  Trigger: "analyze API", "API surface", "endpoint audit", "contract analysis".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# API Surface Analyzer

Discover, catalog, and evaluate all API contracts exposed by the system — REST endpoints, GraphQL schemas, gRPC services — for consistency, completeness, and design quality.

## Guiding Principle

> *"Your API is a promise. Break it, and you break trust with every consumer."*

## Procedure

### Step 1 — Endpoint Discovery
1. Scan for route definitions: Express routers, Django urlpatterns, Spring `@RequestMapping`, FastAPI decorators.
2. Detect OpenAPI/Swagger specs (`openapi.yaml`, `swagger.json`) and compare against actual routes.
3. Find GraphQL schema files (`.graphql`, `.gql`) and resolver implementations.
4. Locate `.proto` files for gRPC service definitions.
5. Catalog each endpoint: method, path, handler, authentication requirement `[HECHO]`.

### Step 2 — Contract Analysis
1. Verify request/response schemas are defined (not `any` or untyped).
2. Check for consistent naming conventions (camelCase vs. snake_case, plural vs. singular).
3. Validate HTTP method semantics: GET is idempotent, POST creates, PUT replaces, PATCH updates.
4. Assess error response consistency: standard error envelope, HTTP status code correctness.
5. Check pagination patterns: cursor-based vs. offset, consistency across list endpoints.

### Step 3 — Versioning & Compatibility
1. Identify versioning strategy: URL path (`/v1/`), header, query parameter, or none.
2. Check for breaking changes between versions if multiple exist.
3. Evaluate deprecation practices: sunset headers, documentation, migration guides.
4. Assess backward compatibility of recent changes `[INFERENCIA]`.

### Step 4 — Surface Report
1. Produce a complete API catalog with authentication, rate limits, and data contracts.
2. Score API design quality: consistency (30%), completeness (25%), documentation (25%), security (20%).
3. Flag undocumented endpoints, missing authentication, and inconsistent patterns.
4. Generate OpenAPI spec if none exists `[SUPUESTO]` for accuracy.

## Quality Criteria
- Every endpoint verified against actual code, not just specs `[HECHO]`
- Spec-vs-reality drift explicitly documented
- Authentication requirements verified per endpoint
- Naming and convention consistency measured objectively

## Anti-Patterns
- Trusting OpenAPI specs without verifying against route handlers
- Ignoring internal/admin endpoints in the analysis
- Only analyzing REST when GraphQL or gRPC are also present
- Treating 200 OK on errors as acceptable (it breaks client error handling)
