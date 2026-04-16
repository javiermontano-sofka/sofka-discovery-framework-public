# Flow Mapping — Body of Knowledge

## Core Concepts

1. **Sequence Diagrams**: Time-ordered interaction models showing message exchange between participants. The foundation for understanding distributed system behavior.
2. **Data Flow Diagrams (DFD)**: Process-centric views showing how data enters, transforms, and exits a system. Levels 0-2 provide progressive detail.
3. **Integration Points**: Boundaries where two systems exchange data. Each point has a protocol, contract, error model, and SLA.
4. **Choreography vs Orchestration**: Distributed flows where participants react to events (choreography) vs centrally coordinated flows (orchestration).
5. **Critical Path Analysis**: Identifying the longest chain of dependent operations that determines end-to-end latency.
6. **Boundary Crossing**: Every time data moves between trust domains, services, or networks. Each crossing introduces latency, failure modes, and transformation risk.

## Patterns

1. **Saga Pattern**: Long-running distributed transactions decomposed into compensatable steps. Essential for mapping flows that span multiple services.
2. **Event Sourcing Flow**: Systems where state is derived from an append-only event log. Flow mapping must trace event producers, consumers, and projections.
3. **Gateway Aggregation**: A single entry point that fans out to multiple downstream services and aggregates responses. Common in API gateway architectures.
4. **Dead Letter Queue (DLQ) Flow**: Messages that fail processing are routed to a DLQ for inspection. Often the most neglected flow in a system.

## Tools

1. **Mermaid.js**: Text-based diagramming embedded in Markdown. Supports sequence, flowchart, and class diagrams.
2. **PlantUML**: UML-focused diagramming with rich sequence diagram support and conditional logic.
3. **Structurizr**: C4-model tooling for architecture diagrams at multiple abstraction levels.
4. **AsyncAPI**: Specification for event-driven architectures, complementing OpenAPI for async flows.

## References

1. Hohpe, G. & Woolf, B. — *Enterprise Integration Patterns* (Addison-Wesley, 2003).
2. Brown, S. — *The C4 Model for Visualising Software Architecture* (c4model.com).
3. Richardson, C. — *Microservices Patterns* (Manning, 2018) — Chapters on Sagas and API composition.
