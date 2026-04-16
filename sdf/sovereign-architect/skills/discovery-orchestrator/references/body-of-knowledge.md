# Discovery Orchestrator — Body of Knowledge

## Core Concepts

1. **Discovery Pipeline**: A sequenced set of analysis activities that transform raw inputs (code, docs, interviews) into structured deliverables (assessments, recommendations, roadmaps).
2. **Dependency Graph**: The directed acyclic graph of deliverable dependencies. Flow mapping feeds risk analysis; risk analysis feeds the roadmap.
3. **Quality Gate**: A checkpoint where deliverables are reviewed against criteria before the pipeline advances. Gates prevent error propagation.
4. **Cross-Deliverable Consistency**: The requirement that findings in one artifact do not contradict findings in another. A risk identified in analysis must appear in the risk register.
5. **Time-Boxing**: Allocating fixed durations to activities to prevent analysis paralysis while maintaining discovery momentum.
6. **Progressive Elaboration**: Starting with broad strokes and adding detail as understanding deepens, rather than attempting comprehensive analysis upfront.

## Patterns

1. **Breadth-First Discovery**: Survey all areas at low fidelity before deep-diving into specific concerns. Prevents premature optimization of analysis effort.
2. **Evidence Cascade**: Each phase's outputs become the next phase's evidence. Flow maps become inputs to risk analysis; risk analysis feeds roadmap planning.
3. **Parallel Tracks**: Independent work streams (e.g., technical analysis and stakeholder interviews) running concurrently with synchronization points.
4. **Spike and Assess**: Short, time-boxed investigations into areas of high uncertainty before committing to full analysis.

## Tools

1. **Mermaid Gantt/Flowchart**: Pipeline visualization and dependency tracking embedded in Markdown.
2. **GitHub Issues/Projects**: Tracking discovery tasks, assignments, and gate approvals.
3. **Decision Log**: A running record of decisions made during discovery with rationale and evidence.
4. **RACI Matrix**: Responsible, Accountable, Consulted, Informed — role clarity for discovery activities.

## References

1. Gothelf, J. & Seiden, J. — *Lean UX* (O'Reilly, 2013) — Discovery as iterative learning.
2. Patton, J. — *User Story Mapping* (O'Reilly, 2014) — Structured discovery techniques.
3. Cohn, M. — *Agile Estimating and Planning* (Prentice Hall, 2005) — Time-boxing and progressive elaboration.
