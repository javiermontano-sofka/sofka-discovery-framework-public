# Discovery Handover — Body of Knowledge

## Core Concepts

1. **Architectural Decision Record (ADR)**: A structured document capturing the context, decision, and consequences of a significant architectural choice. The primary knowledge transfer vehicle.
2. **Assumption Register**: A catalog of all assumptions made during discovery, each with a validation status (validated, pending, invalidated) and the impact if the assumption proves wrong.
3. **Work Package**: A discrete unit of implementation work derived from the roadmap, with defined scope, acceptance criteria, prerequisites, and estimated effort.
4. **Knowledge Transfer Session**: A structured meeting where the discovery team walks the implementation team through complex findings, decisions, and areas of uncertainty.
5. **Decision Context**: The circumstances, constraints, and information available at the time a decision was made. Without context, decisions appear arbitrary.
6. **Transition Support Model**: The defined mechanism for the implementation team to seek clarification from the discovery team during the handover period.

## Patterns

1. **ADR as Living Document**: ADRs evolve during implementation. The handover should establish the process for updating ADRs as new information emerges.
2. **Layered Handover**: Start with executive summary, then architecture overview, then detailed work packages. Different audiences consume different layers.
3. **Risk Transfer Protocol**: Explicit handover of risk ownership with documented mitigation strategies and escalation paths.
4. **Assumption Validation Sprint**: A dedicated sprint at implementation start focused solely on validating high-impact assumptions before committing to architecture.

## Tools

1. **ADR Tools (adr-tools, Log4brains)**: CLI tools and web UIs for managing architectural decision records.
2. **Confluence/Notion**: Collaborative documentation platforms for structured handover packages.
3. **Mermaid Diagrams**: Embedded architecture and flow diagrams that travel with the documentation.
4. **JIRA/Linear**: Work package tracking aligned with the roadmap phases.

## References

1. Nygard, M. — *Documenting Architecture Decisions* (Cognitect Blog, 2011).
2. Keeling, M. — *Design It!* (Pragmatic Bookshelf, 2017) — Architecture documentation and handover.
3. Skelton, M. & Pais, M. — *Team Topologies* (IT Revolution, 2019) — Team interaction modes during transitions.
