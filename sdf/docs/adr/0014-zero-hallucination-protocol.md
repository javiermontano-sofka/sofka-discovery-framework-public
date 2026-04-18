# ADR-0014: Zero-hallucination protocol — every claim tagged, unverified claims surfaced

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

LLMs hallucinate. In pre-sales, a hallucinated "the client uses SAP S/4HANA 2022" can end a relationship. The cost of one hallucinated fact in a client-facing artefact can exceed the cumulative value of the tool. A protocol is needed where the agent *cannot* confidently state an un-grounded fact.

## Decision

Every factual claim in every deliverable carries an evidence tag (ADR-0002). Untagged claims are treated as bugs by reviewers. Specifically:

- **Tag required at point of claim** — not in an appendix.
- **`[SUPUESTO]` is a valid tag** — the agent can state an assumption, but it's visible.
- **Density thresholds trigger advisories** — >30% `[SUPUESTO]` in a deliverable → banner warning.
- **`[SUPUESTO]` at `severity=CRÍTICO` blocks gate promotion** — the deliverable cannot advance until the claim is upgraded to a higher-priority tag or dropped.
- **Reviewers can downgrade** — if a reviewer finds an `[INFERENCIA]` that should be `[SUPUESTO]`, they mark it; the agent must re-ground or remove.

## Consequences

### Positive
- Unsupported claims can't hide.
- Clients see the epistemic posture of the deliverable, building trust via honesty.
- Review cycles are faster: reviewers grep for `[SUPUESTO]` and focus there.

### Negative
- Agents sometimes over-tag `[INFERENCIA]` where `[CÓDIGO]` would apply. Counter-measure: evidence-upgrade pass as a quality-guardian routine.
- Tag discipline requires prompt engineering of every agent. Mitigated by shared skill: `evidence-tagging` referenced in all relevant SKILL.md files.

### Neutral
- This is a protocol, not a toolchain feature. Enforcement is primarily by review, supplemented by regex spot-checks.

## Alternatives considered

- **Calibration score (e.g. 0-100)** — dismissed: pseudo-precision; readers have no basis to interpret "72".
- **Confidence words ("likely", "probably")** — dismissed: hedges that readers ignore.

## References

- ADR-0002 (the 8 evidence tags)
- `references/ontology/protocol-zero-hallucination.md`
- `docs/explanation/why-evidence-tags.md` (B5)
