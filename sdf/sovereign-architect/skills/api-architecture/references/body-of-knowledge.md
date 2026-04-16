# API Architecture — Body of Knowledge

## Core Concepts
- **REST (Representational State Transfer)**: Resource-oriented API style using HTTP methods, status codes, and uniform interface
- **GraphQL**: Query language for APIs allowing clients to request exactly the data they need
- **gRPC**: High-performance RPC framework using Protocol Buffers for inter-service communication
- **API-First Design**: Designing the API contract before implementation, enabling parallel development
- **Developer Experience (DX)**: The overall experience of developers consuming an API: documentation, SDKs, error messages, onboarding
- **API Gateway**: Infrastructure component for routing, authentication, rate limiting, and protocol translation
- **Contract Testing**: Verifying that API implementations conform to their declared contracts

## Patterns
- **Backend for Frontend (BFF)**: Dedicated API layer per client type optimizing data shape
- **API Composition**: Aggregating data from multiple microservice APIs into a single response
- **HATEOAS**: Hypermedia as the Engine of Application State for discoverable REST APIs
- **API Pagination**: Cursor-based (scalable), offset-based (simple), keyset (performant)
- **Idempotency Keys**: Client-provided keys ensuring safe retry of mutating operations

## Tools & Frameworks
- **OpenAPI 3.x (Swagger)**: REST API specification standard with code generation ecosystem
- **AsyncAPI**: Specification for event-driven and message-based APIs
- **Protobuf / gRPC**: Interface definition language and framework for high-performance APIs
- **Stoplight / Redocly**: API design, documentation, and governance platforms
- **Pact / Schemathesis**: Consumer-driven contract testing and property-based API testing

## References
- Arnaud Lauret — *The Design of Web APIs* (2019)
- Google — *API Design Guide* (https://cloud.google.com/apis/design)
- Microsoft — *REST API Guidelines* (https://github.com/microsoft/api-guidelines)
- Phil Sturgeon — *Build APIs You Won't Hate* (2nd ed., 2024)
