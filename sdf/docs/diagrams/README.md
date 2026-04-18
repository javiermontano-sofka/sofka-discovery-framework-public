# Diagrams

Mermaid source, committed as markdown. GitHub renders inline; PR diffs are text, reviewable.

## Contents

### C4 model

| Level | File | Shows |
|-------|------|-------|
| L1 | [c4/L1-system-context.md](c4/L1-system-context.md) | SAGE as a black box, external systems around it |
| L2 | [c4/L2-containers.md](c4/L2-containers.md) | Plugin components inside SAGE |
| L3 | [c4/L3-components.md](c4/L3-components.md) | Inside discovery-conductor |

L4 (code diagrams) — deliberately omitted ([ADR-0019](../adr/0019-c4-levels-1-2-3-mermaid.md)).

### Sequence diagrams

| File | Flow |
|------|------|
| [sequences/01-fase-0-attachment-ingestion.md](sequences/01-fase-0-attachment-ingestion.md) | User drops files → extractor → priming-rag → `[ADJUNTO]` citations |
| [sequences/02-gate-g1-5-think-tank.md](sequences/02-gate-g1-5-think-tank.md) | 7 Sabios parallel evaluation + feasibility verdict |
| [sequences/03-tot-scenario-branching.md](sequences/03-tot-scenario-branching.md) | 4 ToT meta-phases across candidate scenarios |
| [sequences/04-hitl-modes.md](sequences/04-hitl-modes.md) | Same pipeline, three pause cadences |
| [sequences/05-brand-html-render.md](sequences/05-brand-html-render.md) | Markdown → jinja2 + tokens → DS v5 HTML |
| [sequences/06-antifragile-correction-loop.md](sequences/06-antifragile-correction-loop.md) | Reporter → fix → lesson → validator → (ADR?) → CHANGELOG |

## Rules for diagrams

- **One concept per diagram.** Resist combining.
- **Labels on every arrow.** Unlabelled arrows rot.
- **Brand colors only when styled.** `#FF7E08`, `#000`, `#FFD700`, `#EFEAE4`. Never green.
- **Co-locate with explanation.** Every diagram is linked from at least one explanation essay or tutorial.

## Related

- [ADR-0019](../adr/0019-c4-levels-1-2-3-mermaid.md)
- [`../explanation/why-c4.md`](../explanation/why-c4.md)
