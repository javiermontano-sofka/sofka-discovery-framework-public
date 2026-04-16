---
name: microservices-decomposer
author: JM Labs (Javier Montaño)
description: >
  Decomposes monoliths into microservices using bounded contexts, DDD, and service boundary analysis.
  Trigger: "decompose microservices", "bounded contexts", "service boundaries", "DDD decomposition", "split monolith".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Microservices Decomposer

Applies Domain-Driven Design techniques to identify bounded contexts and service boundaries, producing a decomposition plan that balances autonomy with coordination cost.

## Guiding Principle

> *"The goal of microservices is not to have small services. It is to have independently deployable units aligned with business capabilities."*

## Procedure

### Step 1 — Domain Discovery
1. Conduct an Event Storming session (or analyze the codebase if no stakeholders are available).
2. Identify domain events, commands, and aggregates.
3. Group related events into candidate bounded contexts.
4. Map the ubiquitous language — note where the same term means different things (linguistic boundary = service boundary).
5. Produce a Context Map showing relationships between bounded contexts.

### Step 2 — Boundary Validation
1. Apply the "two-pizza team" test: can each context be owned by a small team?
2. Check data ownership: each service must own its data without shared databases.
3. Evaluate coupling: if two contexts always change together, they may be one service.
4. Assess communication patterns: synchronous dependencies create temporal coupling.
5. Validate with the business: do these boundaries match organizational structure (Conway's Law)?

### Step 3 — Define Integration Contracts
1. For each boundary crossing, choose a communication pattern:
   - **Synchronous**: REST/gRPC for queries requiring immediate response.
   - **Asynchronous**: Events/messages for commands that can be eventually consistent.
2. Define the anti-corruption layer for each integration point.
3. Specify data consistency strategy: saga, two-phase commit, or eventual consistency.
4. Document the event schema for each published domain event.

### Step 4 — Decomposition Roadmap
1. Prioritize extraction order by: business value, coupling risk, and team readiness.
2. Define the extraction sequence (most independent contexts first).
3. Specify the database splitting strategy for each service.
4. Create a dependency graph showing the extraction order and parallel work streams.
5. Define success metrics: deployment frequency, lead time, failure isolation.

## Quality Criteria
- Each service maps to exactly one bounded context with a single ubiquitous language.
- No shared database exists between services; all data access is through published APIs or events.
- The Context Map clearly shows upstream/downstream relationships and integration patterns.
- Decomposition order minimizes the number of temporary cross-service database queries.

## Anti-Patterns
- Decomposing by technical layer (UI service, business logic service, data service) instead of by domain.
- Creating "nano-services" that are too small to justify independent deployment overhead.
- Shared libraries containing domain logic that couples services at the code level.
- Distributed monolith: microservices that must be deployed together and share a database.
