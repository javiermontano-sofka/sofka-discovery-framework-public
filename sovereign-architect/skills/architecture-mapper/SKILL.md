---
name: architecture-mapper
author: JM Labs (Javier Montaño)
description: >
  C4 model diagrams, component relationships, and architectural pattern identification.
  Trigger: "map architecture", "C4 diagram", "component diagram", "system context".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Architecture Mapper

Generate multi-level architectural views (C4 model) from codebase analysis, revealing system context, containers, components, and their relationships.

## Guiding Principle

> *"Architecture is the decisions you wish you could get right early. Visibility is how you verify them."*

## Procedure

### Step 1 — System Context Discovery
1. Identify all external systems the codebase integrates with (APIs, databases, message brokers, third-party services).
2. Grep for HTTP client configurations, connection strings, and SDK initializations.
3. Map user-facing interfaces: web apps, mobile APIs, CLI tools.
4. Document each external boundary with protocol and data flow direction.
5. Produce a C4 Level 1 (System Context) Mermaid diagram.

### Step 2 — Container Identification
1. Identify deployable units: web servers, API services, workers, databases, caches, queues.
2. Map inter-container communication: REST, gRPC, message queues, shared databases.
3. Detect container boundaries from Docker configs, deployment manifests, or module structure.
4. Classify each container by technology and runtime.
5. Produce a C4 Level 2 (Container) Mermaid diagram.

### Step 3 — Component Analysis
1. Within each container, identify major components (modules, packages, bounded contexts).
2. Trace dependency injection, imports, and interface boundaries.
3. Map component responsibilities using naming conventions and code organization.
4. Identify architectural patterns: layered, hexagonal, CQRS, event-driven, microkernel.
5. Produce C4 Level 3 (Component) Mermaid diagrams per container.

### Step 4 — Relationship & Pattern Synthesis
1. Build a dependency graph across all levels.
2. Identify circular dependencies and tight coupling.
3. Classify the dominant architectural style with evidence.
4. Flag architectural drift: where implementation diverges from apparent intent `[INFERENCIA]`.

## Quality Criteria
- Each diagram level follows C4 model conventions
- All relationships backed by code evidence `[HECHO]`
- Architectural pattern classification includes supporting evidence
- External system boundaries clearly identified

## Anti-Patterns
- Drawing diagrams from README descriptions instead of actual code
- Conflating logical architecture with physical deployment
- Missing async/event-driven relationships (only mapping synchronous calls)
- Producing a single flat diagram instead of layered C4 views
