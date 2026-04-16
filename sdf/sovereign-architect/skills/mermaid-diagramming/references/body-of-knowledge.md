# Mermaid Diagramming — Body of Knowledge

## Core Concepts
- **C4 Model**: A hierarchical approach to software architecture diagrams — Context, Container, Component, Code — each level adding detail.
- **Sequence Diagram**: Shows the interaction between participants over time, ideal for API flows and multi-service choreography.
- **Flowchart**: Represents decision logic and process flows with conditions, branches, and loops.
- **State Diagram**: Models the lifecycle of an entity through its valid states and transitions.
- **Entity Relationship Diagram (ERD)**: Shows data entities and their relationships — one-to-many, many-to-many.
- **Mermaid.js**: A JavaScript-based diagramming library that renders diagrams from text definitions in Markdown.
- **Diagram as Code**: Defining diagrams in text format so they are version-controlled, diffable, and reviewable.

## Patterns & Practices
- **One Concept Per Diagram**: Each diagram should answer one question — "who talks to whom?", "what happens when?", "how does state change?"
- **7 +/- 2 Elements**: Keep diagrams to 5-9 primary elements for cognitive manageability.
- **Consistent Abstraction Level**: Do not mix high-level systems with low-level classes in the same diagram.
- **Boundary Boxes**: Use subgraphs to show trust boundaries, deployment zones, or team ownership.
- **Color Coding**: Use consistent colors for system types — blue for internal, gray for external, red for deprecated.
- **Diagram Registry**: Maintain an index of all architecture diagrams with their scope and last-updated date.

## Tools & Technologies
- **Mermaid.js**: Renders in GitHub, GitLab, Notion, Obsidian, Docusaurus, and most modern Markdown renderers.
- **Structurizr**: C4 model tooling with DSL for generating consistent multi-level diagrams.
- **PlantUML**: Alternative text-based diagramming with broader UML support.
- **Excalidraw**: Hand-drawn style diagrams for informal whiteboarding.
- **draw.io / diagrams.net**: Visual editor with Mermaid import/export.
- **D2**: Modern declarative diagramming language with auto-layout.

## References
- Simon Brown, "The C4 Model for Visualising Software Architecture" — c4model.com.
- Mermaid.js Documentation — mermaid.js.org for syntax reference.
- Martin Fowler, "UML Distilled" — When and how to use different diagram types.
- George Miller, "The Magical Number Seven" — Cognitive limits on diagram complexity.
