# Diagrams

Mermaid source, rendered inline by GitHub. Keep source in markdown so diffs are readable and validators can lint them.

## Contents (B8)

### C4 model (Simon Brown)

| Level | File | What it shows |
|-------|------|---------------|
| L1 — System Context | `c4/L1-system-context.md` | SAGE as a black box in the user's ecosystem (Claude Code, MCP servers, Git, NotebookLM, filesystem) |
| L2 — Containers | `c4/L2-containers.md` | Plugin components: agents · skills · commands · hooks · validators · generators · MCP glue |
| L3 — Components | `c4/L3-components.md` | Inside the orchestrator: discovery-conductor + attachment-processor + gate enforcement |

L4 (code-level) deliberately omitted — the code is small enough to read directly; a diagram would rot faster than it informs.

### Sequence diagrams

| File | Flow |
|------|------|
| `sequences/01-fase-0-attachment-ingestion.md` | User drops files → extractor dispatch → priming-rag emission |
| `sequences/02-gate-g1-5-think-tank.md` | 7 Sabios deliberation + feasibility verdict |
| `sequences/03-tot-scenario-branching.md` | 4 ToT phases across candidate scenarios |
| `sequences/04-hitl-modes.md` | --auto vs --hitos vs --paso-a-paso control flow |
| `sequences/05-brand-html-render.md` | Markdown → jinja2 template → DS v5 HTML |
| `sequences/06-antifragile-correction-loop.md` | User reports doc error → lesson + validator emitted |

## Rules for diagrams

- **One concept per diagram** — resist combining. If you need both context and sequence, make two diagrams and link them.
- **No colors beyond brand** — default Mermaid theme is fine; if styling, use `#FF7E08` / `#000` / `#FFD700`. Never green.
- **Label every arrow** — unlabelled arrows rot into "somehow X talks to Y".
- **Co-locate with explanation** — every diagram is linked from at least one explanation essay that tells its story.

---

**Status**: scaffolded in B2. Content ships in B8.
