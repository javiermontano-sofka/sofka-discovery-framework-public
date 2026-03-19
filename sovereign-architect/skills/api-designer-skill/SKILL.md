---
name: api-designer-skill
author: JM Labs (Javier Montaño)
description: >
  Contract-first API design producing OpenAPI specs, GraphQL schemas, or protobuf definitions with versioning strategy.
  Trigger: "design API", "OpenAPI spec", "GraphQL schema", "protobuf definition", "API contract".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# API Designer

Produces contract-first API designs using OpenAPI 3.1, GraphQL SDL, or Protocol Buffers, with complete resource modeling, error handling conventions, versioning strategy, and consumer documentation.

## Guiding Principle

> *"Design the API for the consumer's mental model, not the producer's database schema."*

## Procedure

### Step 1 — Model the Resource Domain
1. Identify the core resources and their relationships from the domain model.
2. Define resource naming conventions (plural nouns, kebab-case for REST; PascalCase types for GraphQL).
3. Map CRUD operations plus any domain-specific actions (e.g., `approve`, `ship`, `refund`).
4. Specify the API style (REST, GraphQL, gRPC) with justification based on consumer needs.

### Step 2 — Define Contracts
1. For REST: produce an OpenAPI 3.1 specification with paths, request/response schemas, and examples.
2. For GraphQL: produce SDL with types, queries, mutations, subscriptions, and input validation directives.
3. For gRPC: produce `.proto` files with service definitions, message types, and streaming modes.
4. Define pagination strategy (cursor-based preferred for large collections).
5. Specify error response format (RFC 7807 Problem Details for REST, error extensions for GraphQL).

### Step 3 — Versioning & Evolution
1. Select a versioning strategy: URL path (`/v1/`), header (`Accept-Version`), or content negotiation.
2. Define backward-compatibility rules: additive changes only in minor versions.
3. Document the deprecation policy with timeline and consumer notification mechanism.
4. Specify breaking-change criteria and migration support (dual-running, adapter layers).

### Step 4 — Validate & Document
1. Lint the contract with Spectral (OpenAPI), graphql-schema-linter, or buf (protobuf).
2. Generate mock server from the contract for consumer testing.
3. Produce a developer guide with authentication, rate limiting, and quickstart examples.
4. Define contract testing strategy (consumer-driven contracts with Pact or similar).

## Quality Criteria
- Every endpoint has request/response examples and error scenarios documented.
- Pagination, filtering, and sorting follow consistent patterns across all resources.
- Authentication and authorization are specified at the operation level, not assumed.
- The contract passes linting with zero warnings.

## Anti-Patterns
- Exposing database IDs as the primary resource identifier without an abstraction layer.
- Using HTTP verbs incorrectly (POST for reads, GET with side effects).
- Versioning by field (`api_version` in the body) instead of protocol-level versioning.
- Designing RPC-style endpoints (`/getUser`, `/createOrder`) in a REST API.
