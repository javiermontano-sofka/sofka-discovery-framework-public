# SDF Documentation Hub

This tree is the **pedagogical layer** of SDF (SAGE v13.4). It complements `references/ontology/` (the operational layer the orchestrator consults mid-session). Same facts, different audiences.

## The 4 quadrants (Diátaxis)

| Quadrant | Purpose | Audience mode | Index |
|----------|---------|---------------|-------|
| [tutorials/](tutorials/README.md) | Learning by doing — step-by-step walkthroughs | "I'm new, teach me" | 7 hands-on tutorials |
| [how-to/](how-to/README.md) | Goal-oriented recipes | "I know what I want, tell me how" | ~20 recipes |
| [reference/](reference/README.md) | Information lookup — specs, tables, counts | "What's the exact contract for X?" | evidence tags · gates · service types · error catalog · auto-generated per-agent/command/skill |
| [explanation/](explanation/README.md) | Understanding — essays, rationale, history | "Why is it this way?" | ~14 essays incl. arc42-lite + manifesto |

Cross-cutting:

- [adr/](adr/README.md) — 25 Architecture Decision Records (immutable once accepted)
- [diagrams/](diagrams/README.md) — C4 levels 1-3 + sequence diagrams (Mermaid)

## When to read what

- **First time with SDF** → `tutorials/01-first-discovery.md` + `explanation/architecture-overview.md`
- **Stuck on a specific task** → `how-to/` (recipe style)
- **Writing or reviewing a deliverable** → `reference/evidence-tags/` + `reference/gates/`
- **Challenging a design choice** → `adr/` (find the ADR that decided it)
- **Contributing a change** → `../CONTRIBUTING.md` + `reference/naming-conventions.md` + relevant ADR

## Pedagogical vs operational — why two layers

`references/ontology/` is **read by the agents** at runtime (routing, gate enforcement, service-type lookups). It is dense, authoritative, minimal prose.

`docs/` is **read by humans** before or outside a session (onboarding, decision review, audit). It can afford prose, examples, diagrams, trade-off discussions.

Both layers cite the same primary sources (plugin.json, frontmatter, validator manifest). If they drift, validators (`scripts/validators/count-parity.py`, `cross-refs.py`) fail CI.

## Navigation heuristics

- Use `ls docs/<quadrant>/` — filenames are descriptive by design (Zettelkasten-style `NNNN-slug.md`).
- Every README.md at any level is an **index**, not a tutorial. Readers should be able to find what they need in ≤3 clicks.
- Broken links = bug. Report via `docs/how-to/handle-a-doc-regression.md`.

---

**Author**: Javier Montaño · **Contributors**: Jean Ruiz Granda, Catherine Rodrigo · **Co-authored with**: Claude Code · **Copyright**: © 2026 Sofka Technologies. All Rights Reserved.
