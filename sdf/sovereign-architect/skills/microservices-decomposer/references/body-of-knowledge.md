# Microservices Decomposer — Body of Knowledge

## Core Concepts
- **Bounded Context**: A DDD concept defining a boundary within which a particular domain model is defined and applicable.
- **Ubiquitous Language**: The shared vocabulary within a bounded context; when the same word means different things, you have found a boundary.
- **Context Map**: A visualization of the relationships between bounded contexts, showing upstream/downstream dependencies and integration patterns.
- **Aggregate**: A cluster of domain objects treated as a single unit for data changes; aggregates define transactional boundaries.
- **Domain Event**: A record of something that happened in the domain, used for inter-service communication.
- **Conway's Law**: Organizations design systems that mirror their communication structure; microservice boundaries should align with team boundaries.
- **Saga Pattern**: A sequence of local transactions coordinated by events or orchestration, providing eventual consistency across services.
- **Anti-Corruption Layer (ACL)**: A translation layer that prevents one bounded context's model from polluting another.

## Patterns & Practices
- **Event Storming**: A collaborative workshop technique for exploring complex business domains through domain events, commands, and aggregates.
- **Decompose by Business Capability**: Align services with what the business does (payments, shipping, inventory) rather than how it is technically structured.
- **Decompose by Subdomain**: Identify core, supporting, and generic subdomains; invest most in core, buy/outsource generic.
- **Database per Service**: Each microservice owns its data store, eliminating shared-database coupling.
- **Shared Nothing Architecture**: Services share no state, no database, and no process space.
- **Service Mesh**: Infrastructure layer handling service-to-service communication, observability, and security (Istio, Linkerd).

## Tools & Technologies
- **Miro / EventStorming.com**: Collaborative tools for running Event Storming workshops.
- **Context Mapper**: DSL and tooling for defining and visualizing Context Maps from DDD.
- **Structurizr**: Architecture-as-code for documenting service boundaries and dependencies.
- **Service Weaver (Google)**: Framework for writing microservices as modular monoliths and deploying them as distributed services.
- **Dapr**: Distributed Application Runtime providing building blocks for microservice communication, state, and pub/sub.

## References
- Evans, E., "Domain-Driven Design: Tackling Complexity in the Heart of Software" (Addison-Wesley, 2003).
- Vernon, V., "Implementing Domain-Driven Design" (Addison-Wesley, 2013).
- Newman, S., "Building Microservices" (O'Reilly, 2nd edition, 2021).
- Brandolini, A., "Introducing EventStorming" (Leanpub, 2021).
