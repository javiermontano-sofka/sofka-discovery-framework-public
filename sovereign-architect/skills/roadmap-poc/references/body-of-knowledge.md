# Roadmap PoC — Body of Knowledge

## Core Concepts

1. **Hypothesis-Driven Development**: Framing technical uncertainty as testable hypotheses with measurable outcomes, borrowed from lean startup methodology applied to engineering.
2. **Time-Boxing**: Fixed-duration sprints that force prioritization and prevent scope creep. A PoC sprint should never exceed 2 weeks.
3. **Go/No-Go Gate**: A decision point where accumulated evidence is evaluated against pre-defined criteria to determine whether to proceed, pivot, or stop.
4. **Minimum Viable Experiment**: The smallest possible implementation that can validate or invalidate a hypothesis. Not a prototype — a measurement instrument.
5. **Sunk Cost Awareness**: The discipline to stop a PoC when evidence shows failure, regardless of investment already made. Gates enforce this discipline.
6. **Risk-Adjusted Timeline**: A schedule that accounts for the probability of delays, rework, and pivot decisions, not just the optimistic path.

## Patterns

1. **Walking Skeleton**: A minimal end-to-end implementation that exercises all architectural layers. The first PoC sprint should produce a walking skeleton.
2. **Spike Solution**: A throwaway implementation designed solely to answer a technical question. Results inform decisions but code is not carried forward.
3. **Tracer Bullet**: An end-to-end thin slice through all layers that becomes the foundation for incremental development. Unlike spikes, tracer bullets are kept.
4. **Incremental Gate Investment**: Each gate only commits resources to the next phase, not the entire roadmap. Total commitment grows only with validated confidence.

## Tools

1. **Mermaid Gantt Charts**: Sprint timeline visualization with gates and dependencies.
2. **OKR Framework**: Objectives and Key Results for structuring PoC success criteria.
3. **Risk Matrix (Probability x Impact)**: Prioritization tool for PoC risk register.
4. **Burndown Charts**: Sprint progress tracking for time-boxed PoC execution.

## References

1. Ries, E. — *The Lean Startup* (Crown, 2011) — Hypothesis-driven validation.
2. Hunt, A. & Thomas, D. — *The Pragmatic Programmer* (Addison-Wesley, 1999) — Tracer bullets and prototypes.
3. Humble, J. & Farley, D. — *Continuous Delivery* (Addison-Wesley, 2010) — Walking skeletons.
