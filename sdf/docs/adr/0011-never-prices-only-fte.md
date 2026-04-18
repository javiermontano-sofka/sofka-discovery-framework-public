# ADR-0011: Never emit prices; FTE-meses + disclaimers only

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Pre-sales artefacts are persistent: a PDF sent in April lives in client inboxes, SharePoint folders, and internal forwards for years. A price quoted in one artefact becomes a claim against Sofka's commercial team; worse, it anchors expectations for entirely different scopes. Sofka Commercial owns pricing; SDF owns estimation.

Separately: pricing crosses a legal threshold (offers vs indications of interest). Artefacts emitted by an LLM pipeline should not cross that threshold, ever.

## Decision

SDF artefacts **never** contain monetary prices. Effort estimates are expressed as **FTE-meses** (full-time-equivalent months) with:

- A range, never a point value (e.g. "18-24 FTE-meses", not "20 FTE-meses").
- An explicit disclaimer banner on any deliverable that includes estimation: "Estimación no comercial; no constituye oferta. Sofka Comercial emitirá propuesta económica separada."
- A metadata tag `pricing: false` (invariant: every deliverable has this flag set to `false`).

A validator can check: no `$`, `€`, `USD`, `COP`, `MXN`, etc. in any deliverable body. Currency symbols in evidence-cited quotes (e.g. a line from a client contract) are allowed; they inherit the `[ADJUNTO]` provenance.

## Consequences

### Positive
- Legal surface minimised.
- Clear separation of concerns with Sofka Commercial.
- Agents don't invent numbers they have no basis to claim.

### Negative
- Clients sometimes want a price and a range in FTE-meses feels indirect. Mitigated by a clear "how to read this" block and Commercial's involvement post-gate.

### Neutral
- This is a hard rule for agents, not a style preference. Violations are bugs.

## Alternatives considered

- **Price with disclaimer** — dismissed: disclaimers are ignored; the number anchors.
- **Cost category labels (S/M/L/XL)** — dismissed: opaque to clients; doesn't help decision-making.

## References

- `references/ontology/output-standards.md` (no-prices invariant)
- ADR-0014 (zero-hallucination — prices invented without evidence are hallucinations)
