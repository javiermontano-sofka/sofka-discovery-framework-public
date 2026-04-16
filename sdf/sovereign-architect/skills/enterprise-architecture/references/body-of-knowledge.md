# Enterprise Architecture — Body of Knowledge

## Core Concepts
- **Business Capability Mapping**: Hierarchical decomposition of what the organization does (not how), from L0 strategic capabilities down to L3 operational functions
- **Domain-Driven Design (Strategic)**: Bounded contexts, context maps, and domain relationships as the foundation for system boundaries
- **Technology Radar**: Quadrant-based assessment framework (Techniques, Tools, Platforms, Languages) with rings (Adopt, Trial, Assess, Hold)
- **TOGAF ADM**: Architecture Development Method for iterating through vision, business, information systems, and technology architectures
- **Wardley Mapping**: Value chain visualization plotting components by visibility to user and evolutionary stage (genesis → commodity)
- **Architecture Decision Records (ADRs)**: Lightweight documentation of significant architectural decisions with context, decision, and consequences
- **Team Topologies Alignment**: Mapping architecture boundaries to stream-aligned, enabling, complicated-subsystem, and platform teams

## Patterns
- **Strangler Fig**: Incrementally replace legacy systems by routing traffic to new implementations
- **Cell-Based Architecture**: Partition the enterprise into independent cells with clear contracts
- **Platform Engineering**: Internal developer platforms that abstract infrastructure complexity
- **Domain Gateway**: Single entry point per domain that encapsulates internal complexity
- **Evolutionary Architecture**: Fitness functions that guide architectural change over time

## Tools & Frameworks
- **ArchiMate**: Visual modeling language for enterprise architecture
- **Structurizr / C4 Model**: Lightweight architecture diagramming (Context, Container, Component, Code)
- **Backstage**: Developer portal for service catalog and tech documentation
- **LeanIX**: Enterprise architecture management platform
- **Mermaid**: Diagram-as-code for architecture visualization in Markdown

## References
- Gregor Hohpe — *The Software Architect Elevator* (2020)
- Simon Wardley — *Wardley Maps* (2019)
- Matthew Skelton & Manuel Pais — *Team Topologies* (2019)
- Neal Ford, Rebecca Parsons, Patrick Kua — *Building Evolutionary Architectures* (2017)
