# Functional Specification — Body of Knowledge

## Core Concepts

1. **Use Case**: A description of how an actor interacts with a system to achieve a goal. Includes preconditions, main flow, alternative flows, and postconditions.
2. **Business Rule**: A constraint or policy that governs system behavior. Rules are independent of UI and persist across implementations.
3. **Acceptance Criteria**: Testable conditions that define when a requirement is satisfied. Given/When/Then format ensures precision.
4. **Traceability Matrix**: A bidirectional mapping from business objectives through requirements to test cases, ensuring coverage and impact analysis.
5. **Complexity Scoring**: A structured assessment of implementation difficulty considering technical uncertainty, integration depth, and domain complexity.
6. **Requirements Taxonomy**: Classification of requirements into functional (what the system does), non-functional (how well it does it), and constraints (boundaries it must respect).

## Patterns

1. **INVEST Criteria**: Independent, Negotiable, Valuable, Estimable, Small, Testable. A quality checklist for well-formed requirements.
2. **Three Amigos**: Collaboration between business, development, and testing perspectives to refine specifications before implementation.
3. **Specification by Example**: Using concrete examples to drive out ambiguity in requirements and produce executable specifications.
4. **MoSCoW Prioritization**: Must have, Should have, Could have, Won't have. A framework for negotiating scope within constraints.

## Tools

1. **Gherkin/Cucumber**: Structured language for writing executable specifications in Given/When/Then format.
2. **PlantUML Use Case Diagrams**: Visual representation of actors, use cases, and their relationships.
3. **DOORS/Jama**: Enterprise requirements management tools with traceability and baseline capabilities.
4. **Notion/Confluence**: Collaborative documentation platforms for living specifications.

## References

1. Cockburn, A. — *Writing Effective Use Cases* (Addison-Wesley, 2000).
2. Robertson, S. & Robertson, J. — *Mastering the Requirements Process* (Addison-Wesley, 2012).
3. Adzic, G. — *Specification by Example* (Manning, 2011).
