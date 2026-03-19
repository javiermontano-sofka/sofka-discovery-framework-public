# Solutions Architecture — Body of Knowledge

## Core Concepts
- **Integration Patterns**: Request-reply, publish-subscribe, event-carried state transfer, API composition, saga orchestration
- **Cross-Cutting Concerns**: Capabilities that span multiple components — security, logging, tracing, configuration, resilience
- **Non-Functional Requirements (NFRs)**: Quality attributes that constrain the solution: performance, scalability, availability, security, maintainability
- **Data Contracts**: Formal agreements on data shape, semantics, versioning, and evolution between producer and consumer
- **Solution Fitness**: The degree to which a solution satisfies both functional and non-functional requirements
- **Boundary Decisions**: Where to draw system/service boundaries based on cohesion, coupling, and team autonomy

## Patterns
- **API Gateway**: Centralized entry point for routing, authentication, rate limiting, and protocol translation
- **Backend for Frontend (BFF)**: Dedicated backend per client type to optimize data shape and reduce over-fetching
- **Saga Pattern**: Distributed transaction management via choreography or orchestration
- **Sidecar / Service Mesh**: Cross-cutting concerns extracted into infrastructure proxies
- **Strangler Fig Migration**: Gradual replacement of legacy components behind a routing facade

## Tools & Frameworks
- **C4 Model (Structurizr)**: Context, Container, Component, Code diagrams for solution visualization
- **AsyncAPI**: Specification for event-driven and message-driven APIs
- **OpenAPI 3.x**: REST API contract specification and code generation
- **PlantUML / Mermaid**: Diagram-as-code for sequence, component, and deployment views
- **Pact / Contract Testing**: Consumer-driven contract verification for integrations

## References
- Mark Richards & Neal Ford — *Fundamentals of Software Architecture* (2020)
- Sam Newman — *Building Microservices* (2nd ed., 2021)
- Gregor Hohpe & Bobby Woolf — *Enterprise Integration Patterns* (2003)
- Chris Richardson — *Microservices Patterns* (2018)
