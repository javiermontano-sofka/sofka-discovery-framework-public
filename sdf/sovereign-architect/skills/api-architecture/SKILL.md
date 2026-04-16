---
name: api-architecture
author: JM Labs (Javier Montaño)
description: >
  REST, GraphQL, and gRPC API governance, versioning strategy, rate limiting,
  and developer experience design. Trigger: "API architecture", "API design",
  "REST", "GraphQL", "gRPC", "API governance", "developer experience".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# API Architecture

Design and govern APIs across the stack: REST/GraphQL/gRPC protocol selection, versioning strategies, rate limiting, security, documentation, and developer experience optimization.

## Guiding Principle
> *"APIs are the product — every endpoint is a contract, every breaking change is a trust violation, every missing doc is a support ticket."*

## Procedure

### Step 1 — API Style Selection & Design
1. Evaluate API style per use case: REST (CRUD resources), GraphQL (flexible queries), gRPC (high-perf inter-service)
2. Define resource naming conventions and URL structure
3. Design request/response schemas with consistent envelope patterns
4. Specify error response format: error codes, messages, field-level details
5. Implement pagination strategy: cursor-based, offset-based, or keyset

### Step 2 — Versioning & Evolution
1. Select versioning strategy: URI path, header, query parameter, or content negotiation
2. Define backward compatibility rules: additive-only for minor versions
3. Design deprecation process: timeline, communication, sunset headers
4. Implement API changelog generation from spec diffs
5. Establish breaking change review process with consumer notification

### Step 3 — Security & Rate Limiting
1. Design authentication strategy per API tier: API keys, OAuth 2.0, JWT
2. Implement authorization: scopes, RBAC, or ABAC per endpoint
3. Design rate limiting: per-client, per-endpoint, with burst allowance
4. Implement input validation and sanitization at the gateway layer
5. Define CORS, CSP, and security header policies

### Step 4 — Developer Experience & Governance
1. Generate OpenAPI/AsyncAPI specifications from code or design-first
2. Build interactive API documentation with try-it-out capabilities
3. Provide SDK generation for primary consumer languages
4. Design API catalog with discovery, search, and dependency tracking
5. Establish API design review process with style guide enforcement

## Quality Criteria
- All APIs have OpenAPI/AsyncAPI specifications with >90% endpoint coverage
- Rate limiting tested under load with documented behavior at limits
- Breaking changes go through deprecation cycle with >30-day notice
- API documentation includes runnable examples for every endpoint

## Anti-Patterns
- Inconsistent naming conventions across different API surfaces
- Versioning by creating entirely new API copies instead of evolution
- Rate limiting without communicating limits in response headers
- API documentation generated but never tested or maintained
