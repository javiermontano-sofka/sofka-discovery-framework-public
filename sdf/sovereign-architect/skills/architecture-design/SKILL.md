---
name: architecture-design
author: JM Labs (Javier Montaño)
description: >
  Architecture proposals with trade-off analysis, alternatives matrix, and decision rationale.
  Trigger: design architecture, propose solution, evaluate alternatives, create ADR.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# Architecture Design

Evidence-based architecture proposals with explicit trade-offs and alternatives.

## Guiding Principle

> *Architecture is the art of trade-offs, not the application of best practices. Every choice has a cost — make it visible.*

## Procedure

### Step 1 — Constraint Mapping

Before designing, map the constraints:

| Constraint Type | Examples |
|----------------|---------|
| **Technical** | Existing stack, data formats, API contracts, performance SLAs |
| **Organizational** | Team size, skill distribution, deployment cadence |
| **Business** | Timeline, budget, compliance requirements |
| **Operational** | Uptime requirements, monitoring capability, incident response |

### Step 2 — Option Generation

Generate at least 3 viable options:

1. **Conservative**: Minimum change, lowest risk, closest to current architecture
2. **Recommended**: Best balance of quality, effort, and risk
3. **Ambitious**: Highest quality outcome, higher effort/risk

### Step 3 — Trade-off Analysis

For each option, evaluate:

| Dimension | Score (1-5) | Notes |
|-----------|-------------|-------|
| Complexity | | How hard to implement and maintain |
| Risk | | What could go wrong |
| Time to implement | | Calendar time to production |
| Scalability | | How well it handles growth |
| Maintainability | | How easy to modify in 6 months |
| Team fit | | Does the team have the skills? |

### Step 4 — Decision Record

Document the decision as an ADR:
- Context (why this decision is needed)
- Decision (what was chosen)
- Consequences (positive, negative, neutral)
- Alternatives considered (with rejection rationale)

### Step 5 — Architecture Artifacts

Generate as needed:
- Component diagram (Mermaid)
- Data flow diagram
- API contract sketch
- Database schema changes
- Infrastructure changes

## Quality Criteria

- At least 3 options evaluated
- Every option has explicit trade-offs
- Decision rationale references specific constraints
- Artifacts are specific to the system, not generic patterns

## Anti-Patterns

- Proposing architecture without understanding constraints
- "Best practice" as sole justification
- Single-option proposals disguised as analysis
- Over-engineering for hypothetical future requirements
