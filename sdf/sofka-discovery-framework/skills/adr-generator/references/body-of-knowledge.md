# ADR Generator — Body of Knowledge

## Core Concepts
- **Architecture Decision Record (ADR)**: A short text file documenting a single architectural decision, its context, and consequences.
- **MADR Template**: Markdown Any Decision Record — a lightweight, structured template widely adopted in open-source and enterprise projects.
- **Decision Drivers**: The quality attributes, constraints, and business goals that force an architectural choice.
- **Supersession Chain**: ADRs can supersede previous records, creating an auditable evolution of architectural thinking.
- **Immutability Principle**: Accepted ADRs should not be modified; new ADRs supersede old ones to preserve the decision timeline.
- **Lightweight Governance**: ADRs enable decentralized decision-making with centralized visibility.
- **Context vs. Decision Coupling**: The context section must be detailed enough for someone unfamiliar with the project to understand why the decision was necessary.

## Patterns & Practices
- **Sequential Numbering**: ADRs are numbered sequentially (ADR-0001, ADR-0002) for easy reference and ordering.
- **Status Lifecycle**: Proposed → Accepted → (Deprecated | Superseded). Never delete; always transition.
- **Decision Log Index**: Maintain a single index file (`decisions/README.md`) listing all ADRs with status and one-line summary.
- **Retroactive Recording**: When documenting past decisions, mark them explicitly as retroactive and note the approximate original decision date.
- **Peer Review**: ADRs benefit from the same review process as code — pull requests with at least one reviewer.
- **Thin ADRs over No ADRs**: A brief, imperfect ADR is better than no record. Encourage low-ceremony adoption.

## Tools & Technologies
- **adr-tools** (Nygard CLI): Shell scripts to create, list, and link ADRs from the command line.
- **Log4brains**: A documentation tool that renders ADRs as a searchable knowledge base.
- **MADR GitHub Template**: Standardized template repository for kickstarting ADR adoption.
- **Structurizr**: Architecture-as-code tool that can reference ADRs within workspace definitions.
- **ADR Manager VS Code Extension**: Editor integration for creating and navigating ADRs.

## References
- Michael Nygard, "Documenting Architecture Decisions" (blog post, 2011).
- MADR Project — https://adr.github.io/madr/
- Joel Parker Henderson, "Architecture Decision Record" — https://github.com/joelparkerhenderson/architecture-decision-record
- ThoughtWorks Technology Radar — ADRs as an "Adopt" technique.
