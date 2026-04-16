# Architecture Design — Body of Knowledge

## Core Concepts
- **Trade-off analysis**: Every architectural decision involves competing quality attributes (latency vs. consistency, simplicity vs. flexibility); making trade-offs explicit prevents hidden technical debt
- **Fitness functions**: Automated checks that validate whether a system's architecture continues to meet its intended quality attributes over time
- **Architectural quantum**: The smallest independently deployable unit with high functional cohesion; defines the granularity of your design decisions
- **Decision reversibility**: Classify decisions as one-way doors (hard to undo, warrant deep analysis) vs. two-way doors (easily reversed, favor speed)
- **Constraint-driven design**: Architecture emerges from constraints (team size, compliance, latency SLAs, existing contracts) — not from pattern catalogs
- **Coupling taxonomy**: Distinguish between afferent coupling (who depends on me), efferent coupling (who I depend on), and temporal coupling (ordering dependencies)
- **Architecture Decision Records (ADRs)**: Lightweight documents that capture context, decision, and consequences — the "why" behind the "what"

## Patterns & Practices
- **C4 model**: Context, Container, Component, Code — four zoom levels that prevent mixing abstraction layers in a single diagram
- **Options matrix**: Evaluate 3+ alternatives against weighted dimensions before committing; eliminates single-option bias
- **Strangler fig migration**: Incrementally replace legacy components by routing traffic through a facade, reducing big-bang risk
- **ATAM (Architecture Tradeoff Analysis Method)**: Structured evaluation of architecture against quality attribute scenarios with explicit sensitivity and trade-off points
- **Domain-Driven Design bounded contexts**: Establish linguistic and data boundaries that map to team ownership and deployment units
- **Hexagonal architecture (Ports & Adapters)**: Decouple business logic from infrastructure by defining ports (interfaces) and adapters (implementations)

## Tools & Technologies
- **Diagramming**: Mermaid, PlantUML, Structurizr (C4-native), Excalidraw for whiteboard-style sketches
- **ADR tooling**: adr-tools CLI, Log4brains for searchable ADR sites, Markdown-based ADR templates
- **Architecture fitness**: ArchUnit (Java), NetArchTest (.NET), dependency-cruiser (JavaScript/TypeScript)
- **API design**: OpenAPI 3.x, AsyncAPI for event-driven, Protocol Buffers for gRPC contracts
- **Modeling**: Event Storming (domain discovery), Context Mapping (bounded context relationships)

## References
- "Fundamentals of Software Architecture" — Mark Richards & Neal Ford (trade-off analysis, fitness functions)
- "Documenting Software Architectures" — Clements et al. (views and beyond approach)
- "Architecture: The Hard Parts" — Ford, Richards, Sadalage, Dehghani (modularity decisions)
- ADR GitHub organization — Collection of ADR templates and tooling (adr.github.io)
