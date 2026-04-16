# API Designer — Body of Knowledge

## Core Concepts
- **Contract-First Design**: Define the API specification before writing implementation code, enabling parallel consumer and producer development.
- **Resource-Oriented Architecture**: Model APIs around domain resources with standard operations rather than arbitrary RPC endpoints.
- **HATEOAS**: Hypermedia as the Engine of Application State — responses include links to related actions and resources.
- **Idempotency**: Safe retry behavior. GET, PUT, DELETE should be idempotent; POST should use idempotency keys for payment-like operations.
- **Content Negotiation**: Using `Accept` and `Content-Type` headers to support multiple response formats and API versions.
- **Schema Evolution**: The discipline of evolving API contracts without breaking existing consumers (additive changes, optional fields, deprecation).
- **Rate Limiting**: Protecting API availability through request throttling, usually communicated via `X-RateLimit-*` headers or RFC 6585 status codes.

## Patterns & Practices
- **Cursor-Based Pagination**: Use opaque cursor tokens instead of offset/limit for stable pagination over changing datasets.
- **Bulk Operations**: Provide batch endpoints for operations that consumers frequently perform in loops (e.g., `POST /orders/batch`).
- **Sparse Fieldsets**: Allow consumers to request only the fields they need (`?fields=id,name,status`) to reduce payload size.
- **Webhook Subscriptions**: For event-driven integrations, expose a subscription API where consumers register callback URLs.
- **API Gateway Pattern**: Centralize cross-cutting concerns (auth, rate limiting, logging) at the gateway layer.
- **Backend for Frontend (BFF)**: Create tailored API layers for different client types (mobile, web, third-party).

## Tools & Technologies
- **OpenAPI 3.1**: The industry-standard specification for describing RESTful APIs with JSON Schema validation.
- **Spectral**: Linting engine for OpenAPI documents with customizable rulesets.
- **GraphQL SDL + Apollo Studio**: Schema-first GraphQL development with introspection and analytics.
- **Protocol Buffers + buf**: Schema definition and linting for gRPC services.
- **Pact**: Consumer-driven contract testing framework supporting REST and messaging.
- **Stoplight Studio / Swagger Editor**: Visual API design tools with real-time preview.

## References
- Fielding, R., "Architectural Styles and the Design of Network-based Software Architectures" (Doctoral dissertation, 2000).
- RFC 7807 — Problem Details for HTTP APIs.
- Google API Design Guide — https://cloud.google.com/apis/design
- Higginbotham, J., "Principles of Web API Design" (Addison-Wesley, 2021).
