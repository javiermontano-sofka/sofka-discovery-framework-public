# Component Designer — Body of Knowledge

## Core Concepts
- **Component**: A deployable, replaceable unit of software with a well-defined interface and encapsulated implementation.
- **Cohesion**: The degree to which elements within a component belong together. High cohesion = single responsibility.
- **Coupling**: The degree of interdependence between components. Low coupling = independent changeability.
- **Interface Segregation**: Components expose focused interfaces rather than monolithic APIs; consumers depend only on what they use.
- **Dependency Inversion**: High-level components define abstractions; low-level components implement them.
- **Stable Dependencies Principle**: Depend in the direction of stability — volatile components should depend on stable ones.
- **Common Closure Principle**: Classes that change together belong in the same component.
- **Acyclic Dependencies Principle**: The component dependency graph must be a directed acyclic graph (DAG).

## Patterns & Practices
- **Hexagonal Architecture (Ports & Adapters)**: Core domain is surrounded by ports (interfaces) and adapters (implementations), enforcing boundary discipline.
- **Clean Architecture Layers**: Entities → Use Cases → Interface Adapters → Frameworks, with dependencies pointing inward.
- **Vertical Slice Architecture**: Organize by feature rather than layer; each slice contains its own handler, validator, and persistence.
- **Anti-Corruption Layer**: A translation boundary that prevents one component's model from leaking into another.
- **Facade Pattern**: Simplify a component's public surface by providing a unified interface to a set of internal interfaces.
- **Consumer-Driven Contracts**: Let consumers define the contract expectations; producers verify compliance via contract tests.

## Tools & Technologies
- **ArchUnit / NetArchTest**: Unit-test-style tools to enforce dependency rules and layer boundaries in Java/.NET.
- **Structurizr**: Architecture-as-code tool for defining and visualizing component models using the C4 model.
- **Mermaid.js**: Lightweight diagramming for component topology within Markdown documentation.
- **NX / Turborepo**: Monorepo tools that enforce module boundaries and dependency constraints in JavaScript/TypeScript projects.
- **Module Federation (Webpack/Vite)**: Runtime composition of independently built frontend components.

## References
- Martin, R., "Clean Architecture" (Prentice Hall, 2017) — Chapters on component principles.
- Cockburn, A., "Hexagonal Architecture" (alistair.cockburn.us, 2005).
- C4 Model — https://c4model.com/
- Parnas, D., "On the Criteria to Be Used in Decomposing Systems into Modules" (Communications of the ACM, 1972).
