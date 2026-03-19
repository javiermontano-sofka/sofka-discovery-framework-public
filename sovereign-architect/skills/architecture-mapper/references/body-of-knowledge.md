# Architecture Mapper — Body of Knowledge

## Core Concepts
- **C4 Model**: Four levels of abstraction — System Context, Container, Component, Code — each serving different audiences `[HECHO]`
- **Architectural styles**: Monolithic, microservices, modular monolith, event-driven, serverless, hexagonal, layered, CQRS+ES
- **Coupling types**: Afferent (incoming), efferent (outgoing), temporal, data, stamp, control — each with different refactoring costs
- **Bounded contexts**: DDD concept where distinct domain models are encapsulated within explicit boundaries
- **Architectural fitness functions**: Automated checks that verify architecture properties are maintained over time
- **Conway's Law**: System architecture mirrors organizational communication structure `[HECHO]`

## Patterns & Practices
- **Dependency inversion**: High-level modules should not depend on low-level modules; both should depend on abstractions
- **Strangler fig pattern**: Incrementally replacing legacy components by routing traffic through a facade
- **Anti-corruption layer**: Isolating integration boundaries to prevent external model leakage
- **Event sourcing**: Persisting state changes as an append-only sequence of events
- **Sidecar/ambassador**: Cross-cutting concerns deployed alongside the primary container
- **Backend-for-frontend (BFF)**: Dedicated API layer per frontend client type

## Tools & Technologies
- **Diagramming**: Mermaid, PlantUML, Structurizr, C4-PlantUML
- **Dependency analysis**: Madge (JS), ArchUnit (Java), deptrac (PHP), go-arch-lint
- **Architecture documentation**: arc42, Structurizr DSL, Architecture Decision Records (ADRs)
- **Visualization**: Graphviz, D2, Excalidraw

## References
- Simon Brown — "The C4 Model for Visualising Software Architecture"
- Martin Fowler — "Patterns of Enterprise Application Architecture"
- Eric Evans — "Domain-Driven Design" (bounded contexts)
- Mark Richards & Neal Ford — "Fundamentals of Software Architecture"
