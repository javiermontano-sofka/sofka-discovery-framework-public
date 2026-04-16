---
name: solutions-architecture
author: JM Labs (Javier Montaño)
description: >
  End-to-end integration design, cross-cutting concerns resolution, and system composition
  for complex software solutions. Trigger: "solutions architecture", "integration design",
  "system composition", "cross-cutting concerns".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Solutions Architecture

Design end-to-end solutions that compose multiple systems, resolve cross-cutting concerns (security, observability, resilience), and produce integration blueprints that engineering teams can implement.

## Guiding Principle
> *"A solution architect bridges the gap between business intent and engineering execution — every integration point is a contract, every boundary is a decision."*

## Procedure

### Step 1 — Requirements Decomposition
1. Extract functional requirements and map them to system capabilities
2. Identify non-functional requirements (NFRs): latency, throughput, availability, security
3. Classify requirements by priority using MoSCoW or weighted scoring
4. Map each requirement to one or more system components
5. Identify requirement conflicts and trade-off decisions needed

### Step 2 — Integration Blueprint
1. Identify all system-to-system integration points
2. Select integration patterns per point: synchronous (REST/gRPC), asynchronous (events/queues), batch
3. Define data contracts (schemas, formats, versioning strategy) for each integration
4. Design error handling, retry policies, and circuit breakers per integration
5. Produce a C4 Container diagram showing all integrations and protocols

### Step 3 — Cross-Cutting Concerns Resolution
1. Define authentication/authorization strategy across all components
2. Design observability approach: structured logging, distributed tracing, metrics
3. Specify resilience patterns: timeouts, retries, bulkheads, fallbacks
4. Define data consistency strategy: strong vs. eventual per boundary
5. Document configuration management and secrets handling approach

### Step 4 — Solution Validation
1. Walk through critical user journeys against the solution design
2. Identify single points of failure and mitigation strategies
3. Validate NFR compliance with back-of-envelope calculations
4. Produce a risk register with likelihood, impact, and mitigation per risk
5. Create an ADR for each significant architectural decision made

## Quality Criteria
- Every integration point has a defined contract, error strategy, and SLA
- Cross-cutting concerns are addressed consistently, not per-component
- Solution handles failure modes gracefully with documented fallbacks
- NFRs are validated with quantitative analysis, not assumptions

## Anti-Patterns
- Designing integrations without considering failure modes
- Treating cross-cutting concerns as afterthoughts bolted on later
- Solution diagrams that show happy path only without error flows
- Over-engineering for theoretical scale without evidence of need
