# API Surface Analyzer — Body of Knowledge

## Core Concepts
- **API-first design**: Contracts defined before implementation; consumer-driven contract testing validates expectations `[HECHO]`
- **Richardson Maturity Model**: Level 0 (tunneling) → Level 1 (resources) → Level 2 (HTTP verbs) → Level 3 (HATEOAS)
- **GraphQL schema evolution**: Additive changes are safe; field removal and type changes are breaking
- **gRPC contract rules**: Proto3 has specific backward-compatibility rules for field numbering and type evolution
- **Idempotency**: GET, PUT, DELETE should be idempotent; POST is not; PATCH depends on implementation
- **Content negotiation**: Accept/Content-Type headers drive versioning and format flexibility
- **Rate limiting patterns**: Token bucket, sliding window, fixed window — each with different burst characteristics

## Patterns & Practices
- **Consumer-driven contracts**: Pact or Spring Cloud Contract to validate API compatibility from the consumer's perspective
- **API linting**: Spectral, Optic, or custom rules to enforce design guidelines on OpenAPI specs
- **Deprecation protocol**: Sunset header (RFC 8594), deprecation notices in docs, migration period before removal
- **Error envelope standardization**: RFC 7807 (Problem Details) for consistent error responses
- **Pagination strategies**: Cursor-based for real-time data, offset for static datasets, keyset for large tables

## Tools & Technologies
- **Spec formats**: OpenAPI 3.1, AsyncAPI 3.0, GraphQL SDL, Protocol Buffers
- **Linting**: Spectral (OpenAPI), graphql-eslint, buf (protobuf)
- **Testing**: Pact, Dredd, Schemathesis, Postman/Newman
- **Documentation**: Redoc, Swagger UI, GraphQL Playground, gRPC reflection

## References
- OpenAPI Specification 3.1 — Linux Foundation
- Roy Fielding — "Architectural Styles and the Design of Network-Based Software Architectures"
- RFC 7807 — Problem Details for HTTP APIs
- Google API Design Guide — Best practices for API design
