# Evidence tags — reference

The 8 evidence tags used in every SDF deliverable. Governed by [ADR-0002](../../adr/0002-evidence-tag-priority-chain.md); rationale in [`../../explanation/why-evidence-tags.md`](../../explanation/why-evidence-tags.md).

## Priority (high → low)

| # | Tag | Spec | One-line meaning |
|---|-----|------|------------------|
| 1 | `[CÓDIGO]` | [codigo.md](codigo.md) | Source-code observation — ground truth |
| 2 | `[ADJUNTO]` | [adjunto.md](adjunto.md) | User-supplied artefact (CSV/PDF/XLSX/etc.) |
| 3 | `[CONFIG]` | [config.md](config.md) | Configuration file / env / manifest |
| 4 | `[DOC]` | [doc.md](doc.md) | Official written documentation |
| 5 | `[NOTEBOOKLM]` | [notebooklm.md](notebooklm.md) | NotebookLM-grounded synthesis |
| 6 | `[STAKEHOLDER]` | [stakeholder.md](stakeholder.md) | Quoted from named stakeholder |
| 7 | `[INFERENCIA]` | [inferencia.md](inferencia.md) | Reasoned inference from above |
| 8 | `[SUPUESTO]` | [supuesto.md](supuesto.md) | Unverified assumption — must be flagged |

## Usage invariants

- Every factual claim MUST carry exactly one tag.
- Tags appear **at the point of claim**, not in an appendix.
- A tag can include a locator: `[ADJUNTO:foo.xlsx:Sheet1!A3]`, `[CÓDIGO:src/auth/login.py:42]`.
- `[SUPUESTO]` density > 30 % triggers a deliverable-level banner.
- `[SUPUESTO]` at `severity=CRÍTICO` blocks gate promotion.

## Rendering

Brand HTML renderer wraps tags in `<span class="t td|ta|tx|ti|ts">` for semantic colour (see `canonical-tokens.md`). No green, ever.
