---
name: solution-roadmap
author: JM Labs (Javier Montaño)
description: >
  Creates phased execution roadmaps with investment horizons, risk-adjusted timelines,
  and dependency management. Trigger: "roadmap", "execution plan", "phased delivery", "timeline".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Solution Roadmap

Produces phased execution roadmaps that sequence technical initiatives across
investment horizons, balancing value delivery speed against risk exposure and
resource constraints.

## Guiding Principle

> *"A roadmap is not a promise. It is a hypothesis about the best sequence to deliver value, updated as evidence accumulates."*

## Procedure

### Step 1 — Initiative Decomposition

1. Break the solution into discrete, deliverable initiatives with clear boundaries.
2. Classify each initiative by value type: foundation, enablement, or direct value.
3. Map dependencies between initiatives (hard, soft, preferential).
4. Estimate effort ranges (optimistic, likely, pessimistic) for each initiative.

### Step 2 — Phase Construction

1. Group initiatives into phases based on dependencies and value delivery logic.
2. Ensure each phase delivers demonstrable value (no pure infrastructure phases).
3. Define phase entry criteria, deliverables, and exit criteria.
4. Place risk-reducing initiatives early to fail fast on high-uncertainty items.

### Step 3 — Investment Horizon Mapping

1. Map phases to investment horizons: H1 (0-6 months), H2 (6-12 months), H3 (12+ months).
2. Calculate cumulative investment and projected value at each horizon boundary.
3. Identify decision points where the roadmap should be re-evaluated.
4. Document what must be true for each horizon to proceed.

### Step 4 — Risk-Adjusted Timeline

1. Apply risk factors to effort estimates based on uncertainty and complexity.
2. Build in contingency buffers proportional to risk exposure per phase.
3. Identify the critical path and its sensitivity to delays.
4. Produce the final timeline with confidence intervals.

## Quality Criteria

- Every phase delivers demonstrable value, not just technical prerequisites.
- Dependencies are explicit with hard/soft classification.
- Investment horizons include decision points and re-evaluation triggers.
- Timeline includes confidence intervals, not single-point estimates.

## Anti-Patterns

- Creating a roadmap without dependency analysis, leading to blocked phases.
- Front-loading all foundational work without early value delivery.
- Presenting optimistic estimates without risk adjustment or confidence ranges.
- Treating the roadmap as immutable instead of a living hypothesis.
