# Why C4

Simon Brown's C4 model ([c4model.com](https://c4model.com)) proposes **four zoom levels** for software architecture diagrams: Context (L1) → Containers (L2) → Components (L3) → Code (L4). The insight: one diagram can't show everything without lying; four purposeful zooms tell the truth.

## The problem C4 solves

Architecture diagrams default to two failure modes. Either (a) a single "everything" diagram with 60 boxes no one can follow, or (b) a folder of diagrams drawn in Visio over five years with no consistent vocabulary (a "database" on one diagram is a "data store" on another, sized different, coloured different, coupled differently).

C4 is opinionated: at each level, specific things are shown and specific things are hidden. Vocabulary is fixed. Zoom levels relate to each other via a containment invariant — a Component at L3 is always inside some Container at L2.

## Why we use L1-L3 (not L4)

**L1 — System Context.** Shows SDF as a box, external systems around it (Claude Code, NotebookLM MCP, filesystem, Git, CI). Audience: anyone, including non-technical stakeholders. Purpose: "what does this thing touch?"

**L2 — Containers.** Zooms inside SDF: agents, skills, commands, hooks, validators, generators, MCP glue. Audience: contributors. Purpose: "what parts does this plugin have?"

**L3 — Components.** Zooms inside a specific container where useful (e.g. inside the discovery-conductor). Audience: agent authors, orchestration debuggers. Purpose: "how does the orchestrator compose specialists?"

**L4 — Code.** Omitted. Why: code at this project's scale is small, readable directly, and turns over fast — an L4 diagram rots before it informs. The tree structure (ADR-0021) does the job of "how are the files arranged" better than a UML-like class diagram would.

## Why Mermaid (not PlantUML, not drawio)

- **Mermaid** renders natively in GitHub. Source is markdown, reviewable in diff.
- **PlantUML** has stronger C4 shape support (`!include <C4/C4_Context>`) but needs a render step; PRs harder to review.
- **drawio / Lucidchart** are binary artefacts; no diff review; lock us to a tool.

C4 shapes via Mermaid flowchart primitives are adequate, not pixel-perfect; the cost-to-benefit favours Mermaid.

## Diagrams are not the architecture

A common failure: the architecture *is* the diagram, and the code drifts under it. C4 diagrams in our repo are living; each one is cross-linked from the explanation essay that tells its story; a change to the code that invalidates the diagram should be a PR that updates both.

If that discipline slips, the diagram is a liability. Accept it: remove the diagram rather than lie.

## When C4 doesn't help

- For sequences (ordered interactions over time), sequence diagrams are better. C4 is structural.
- For data models, ER/Crow's Foot or domain diagrams are better.
- For decisions, ADRs. Not diagrams.

## Related

- [ADR-0019](../adr/0019-c4-levels-1-2-3-mermaid.md)
- [`../diagrams/c4/`](../diagrams/c4/) (B8)
- Brown, S. *The C4 model for visualising software architecture*. https://c4model.com
