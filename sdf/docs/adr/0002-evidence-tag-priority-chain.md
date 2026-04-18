# ADR-0002: Evidence tag priority chain — CÓDIGO > ADJUNTO > CONFIG > DOC > NOTEBOOKLM > STAKEHOLDER > INFERENCIA > SUPUESTO

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Pre-sales deliverables are rejected by clients when claims can't be backed up, and accepted when they can. The difference between "our legacy SAP has 47 custom transactions" and "we think you have many custom transactions" is audit-survivability. A zero-hallucination protocol needs a tagging system that (a) makes evidence visible on every claim, (b) ranks evidence quality so readers can triage, and (c) makes unsupported speculation impossible to hide.

Prior art: Anthropic's internal eval format, scientific citation practice, legal chain-of-custody.

## Decision

Every factual claim in every deliverable carries one of **8 evidence tags**, in strict priority order:

```
[CÓDIGO]      — source code observation (highest: ground truth)
[ADJUNTO]     — user-supplied artefact (CSV, PDF, spreadsheet)
[CONFIG]      — configuration file / env / manifest
[DOC]         — official written documentation
[NOTEBOOKLM]  — NotebookLM-grounded synthesis
[STAKEHOLDER] — quoted from named stakeholder
[INFERENCIA]  — reasoned inference from above
[SUPUESTO]    — unverified assumption (lowest: must be flagged)
```

Tags are rendered as visible spans in HTML, coloured by tier. `[SUPUESTO]` density > 30 % of a deliverable triggers an advisory banner. A `[SUPUESTO]` claim at `severity=CRÍTICO` blocks gate promotion until evidence is upgraded.

## Consequences

### Positive
- Readers see evidence at a glance. Reviewers can challenge weak tags.
- Pipeline gates can enforce evidence density programmatically.
- Agents are forced to choose a tag; no "evidence-free prose" escape hatch.

### Negative
- Mild visual overhead in deliverables. Brand HTML renderer styles tags tersely to minimize distraction.
- Agents sometimes over-tag `[INFERENCIA]` when `[CÓDIGO]` would be more accurate. Mitigated by review rubric + evidence-upgrade pass.

### Neutral
- 8 tags is a fixed cardinality. Adding a 9th is a breaking change; see ADR superseding policy.

## Alternatives considered

- **5 tags** (original SAP v3 scheme, no `[ADJUNTO]`/`[NOTEBOOKLM]`) — dismissed: FASE 0 and NLM integration required named evidence sources, not collapsed into `[DOC]`.
- **Footnote citations** — dismissed: disrupts skim-reading; doesn't convey priority; harder to machine-grade.
- **Pure inline quotes** — dismissed: relies on agent discipline, not tooling.

## References

- `references/ontology/protocol-zero-hallucination.md`
- `docs/reference/evidence-tags/` (per-tag specs, B4)
- ADR-0008 (FASE 0 attachment ingestion) — introduced `[ADJUNTO]`
- ADR-0009 (NotebookLM MCP) — introduced `[NOTEBOOKLM]`
