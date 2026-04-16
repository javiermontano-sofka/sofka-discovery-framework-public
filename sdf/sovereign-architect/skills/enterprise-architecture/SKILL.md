---
name: enterprise-architecture
author: JM Labs (Javier Montaño)
description: >
  Capability mapping, domain decomposition, technology radar, and strategic roadmap generation
  for enterprise-scale software systems. Trigger: "enterprise architecture", "capability map",
  "technology radar", "strategic roadmap", "domain decomposition".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Enterprise Architecture

Analyze and design enterprise-level capability maps, decompose business domains into bounded contexts, assess technology landscapes, and produce strategic technology roadmaps aligned with engineering objectives.

## Guiding Principle
> *"Architecture is the set of decisions you wish you could get right early — enterprise architecture is the set of decisions that bind the entire organization."*

## Procedure

### Step 1 — Capability Discovery
1. Inventory existing systems, services, and repositories across the organization
2. Map each system to a business capability using a capability hierarchy (L0 → L3)
3. Identify capability gaps, redundancies, and shadow IT patterns
4. Classify capabilities by maturity: embryonic, emerging, established, declining
5. Produce a capability heatmap showing investment vs. business value

### Step 2 — Domain Decomposition
1. Apply Domain-Driven Design strategic patterns to identify bounded contexts
2. Map data flows and integration points between domains
3. Identify shared kernels, anti-corruption layers, and conformist relationships
4. Score domain coupling using afferent/efferent dependency metrics
5. Recommend domain ownership and team topology alignment

### Step 3 — Technology Radar Construction
1. Catalog all technologies in use (languages, frameworks, databases, platforms)
2. Classify each into rings: Adopt, Trial, Assess, Hold
3. Evaluate each technology against criteria: community health, talent availability, TCO, strategic fit
4. Identify migration paths for "Hold" technologies
5. Produce a visual radar with rationale annotations

### Step 4 — Strategic Roadmap Generation
1. Define architectural target state at 6, 12, and 24-month horizons
2. Sequence initiatives by dependency, risk, and business impact
3. Identify critical path items and parallel workstreams
4. Assign effort estimates (T-shirt sizing) and prerequisite gates
5. Produce a Gantt-style roadmap with milestones and decision points

## Quality Criteria
- Capability map covers at least L0-L2 with no orphan systems
- Technology radar includes rationale for every ring placement
- Roadmap initiatives have explicit dependencies and gates
- Domain decomposition validated against actual data flow patterns

## Anti-Patterns
- Ivory tower architecture disconnected from actual codebases
- Technology radar driven by hype rather than engineering evidence
- Capability maps that mirror org charts instead of business functions
- Roadmaps without feedback loops or reassessment checkpoints
