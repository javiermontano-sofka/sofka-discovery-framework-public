# Software Architecture — Body of Knowledge

## Core Concepts
- **Modularity**: Decomposition of software into discrete, cohesive modules with well-defined interfaces
- **Coupling & Cohesion**: Metrics that measure inter-module dependencies (coupling) and intra-module relatedness (cohesion)
- **Architectural Styles**: Layered, hexagonal (ports & adapters), onion, clean, pipe-and-filter, event-driven, microkernel
- **Quality Attributes (ISOs)**: Maintainability, reliability, performance efficiency, security, compatibility, usability — per ISO 25010
- **Architecture Decision Records (ADRs)**: Structured documents capturing context, decision, alternatives, and consequences
- **Fitness Functions**: Automated tests that guard architectural characteristics over time
- **SOLID Principles**: Single responsibility, open-closed, Liskov substitution, interface segregation, dependency inversion

## Patterns
- **Hexagonal Architecture (Ports & Adapters)**: Core domain isolated from infrastructure via port interfaces
- **Clean Architecture**: Dependency rule — source code dependencies point inward toward domain
- **CQRS**: Separate models for command (write) and query (read) operations
- **Repository Pattern**: Abstraction over data access that decouples domain from persistence
- **Strategy / Policy Pattern**: Runtime-swappable algorithms encapsulated behind a common interface

## Tools & Frameworks
- **ArchUnit / ArchLint**: Architecture rule enforcement in unit tests
- **Dependency-Cruiser**: JavaScript/TypeScript dependency analysis and validation
- **SonarQube**: Code quality and architectural metrics analysis
- **Mermaid / PlantUML**: Architecture diagramming as code
- **jDepend / JArchitect**: Java dependency analysis tools

## References
- Robert C. Martin — *Clean Architecture* (2017)
- Mark Richards & Neal Ford — *Fundamentals of Software Architecture* (2020)
- Vaughn Vernon — *Implementing Domain-Driven Design* (2013)
- Michael Nygard — *Documenting Architecture Decisions* (ADR template, 2011)
