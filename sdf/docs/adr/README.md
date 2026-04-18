# Architecture Decision Records (ADRs)

Nygard-style records, one per decision, numbered `NNNN-slug.md`. **Immutable once accepted** — change via superseding ADR, never by editing the original.

## Status lifecycle

```
  proposed  ──approve──►  accepted  ──superseded-by──►  (still visible, points to successor)
      │
      └──reject──►  rejected
```

Valid `status` values: `proposed` · `accepted` · `rejected` · `superseded-by NNNN` · `deprecated`.

## Why ADRs

See [`../explanation/why-adrs.md`](../explanation/why-adrs.md). Short version: decisions outlive the people who made them; the rationale is what lets future maintainers either honor or change the call on purpose, not by accident.

## Authoring a new ADR

1. Copy [`TEMPLATE.md`](TEMPLATE.md) → `NNNN-<slug>.md` where `NNNN` is the next free number.
2. Fill required fields: `title` · `date` · `status: proposed` · `deciders` · `context` · `decision` · `consequences`.
3. Optional: `alternatives` (with dismissal reasons), `supersedes NNNN` if relevant.
4. Open PR; reviewers change status to `accepted` on merge.
5. Once accepted, the file MUST NOT be edited except to flip status to `superseded-by NNNN` when a successor ADR lands.

`scripts/validators/adr-integrity.py` enforces immutability via git log.

## Planned ADRs for v13.4.1 cycle (B3 — 25 total)

### Distilled retroactively (16)

From decisions already embedded in the elevated docs (root CLAUDE/README, sdf/CLAUDE/README, sap/*), promoted to versioned ADRs:

| # | Slug | Topic |
|---|------|-------|
| 0001 | agent-committee-composition | 49-agent roster + rotation rules |
| 0002 | evidence-tag-priority-chain | [CÓDIGO] > ... > [SUPUESTO] |
| 0003 | quality-gates-G0-G3 | 5-gate cascade |
| 0004 | hitl-three-modes | --auto / --hitos / --paso-a-paso |
| 0005 | insignia-7of7-structure | SKILL.md + grader + evals + refs + examples + scripts + prompts |
| 0006 | tot-meta-phases | 4 ToT phases vs 11 pipeline stages |
| 0007 | service-type-routing | 10 TIPO_SERVICIO values |
| 0008 | fase-0-attachment-ingestion | 9 extractors + evidence tag [ADJUNTO] |
| 0009 | notebooklm-mcp-embedded | unified CLI + MCP package |
| 0010 | brand-html-deterministic | jinja2 + DS v5 tokens, no JS |
| 0011 | never-prices-only-fte | FTE-meses + disclaimers |
| 0012 | spanish-default-latam-register | idioma por defecto |
| 0013 | markdown-excellence-style | TL;DR + bullets + Mermaid + ghost menu |
| 0014 | zero-hallucination-protocol | every claim tagged |
| 0015 | changelog-discipline | per-session changelog file |
| 0016 | ghost-menu-every-artifact | siguientes pasos block |

### Capturing this cycle's choices (9)

| # | Slug | Topic |
|---|------|-------|
| 0017 | diataxis-four-quadrants | adopt tutorials/how-to/reference/explanation |
| 0018 | arc42-lite-split-files | section-per-file, not monolith |
| 0019 | c4-levels-1-2-3-mermaid | no L4 code diagrams |
| 0020 | antifragile-corrections-loop | stressor → lesson + validator |
| 0021 | filesystem-as-architecture | paths encode meaning |
| 0022 | validator-stack-six-jobs | count/cross-ref/acronym/adr/link/diataxis |
| 0023 | ci-advisory-ramp-b10-strict | continue-on-error until baseline converges |
| 0024 | defer-sap-docs-to-next-cycle | scope guardrail |
| 0025 | no-site-generator-for-now | flat markdown + GitHub suffice |

## Superseding

When a decision changes:

1. Write the new ADR (e.g. `0026-xxx.md`) with `status: accepted`, `supersedes: 0012`.
2. In the old ADR (`0012`), flip status to `superseded-by 0026`. Do NOT edit anything else.
3. The old ADR stays visible forever. History is a feature.

---

**Status**: scaffolded in B2 (this index + TEMPLATE). Content ships in B3.
