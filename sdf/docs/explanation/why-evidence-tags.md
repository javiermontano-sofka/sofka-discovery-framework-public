# Why evidence tags

Every factual claim in every SDF deliverable carries one of 8 evidence tags ([ADR-0002](../adr/0002-evidence-tag-priority-chain.md)). This essay explains why that discipline, why 8, and why priority order matters.

## What problem this solves

Pre-sales deliverables accumulate claims. "The client has 47 custom transactions." "Their SLA is 99.5 %." "Migration will take 6 months." A client who reads these and trusts them is making business decisions from them.

Without a tagging system, every claim is epistemically flat: the reader can't distinguish "observed in source code" from "inferred from a stakeholder's passing comment" from "made up to fill the section". The wrong claim acted upon is a lost deal — or worse, an active commercial liability.

Hedge words ("likely", "probably") don't solve it; readers gloss over them. Footnotes don't solve it; they disrupt skim-reading. What does solve it is **tag-at-point-of-claim**: every fact carries its provenance visibly, at the moment it's stated.

## Why 8 tags

```
[CÓDIGO] [ADJUNTO] [CONFIG] [DOC] [NOTEBOOKLM] [STAKEHOLDER] [INFERENCIA] [SUPUESTO]
```

Covers the real provenance surface:

- **Observable ground truth** — code, client-supplied artefacts, config.
- **Written authoritative** — official docs, NLM synthesis, stakeholder quotes.
- **Derived** — inference from the above.
- **Unsupported** — assumption, flagged so it can be upgraded or removed.

7 would merge `[ADJUNTO]` and `[DOC]` (losing the "user-supplied" distinction, which matters for traceability). 9 adds granularity without much benefit. 8 is the least that covers the surface.

## Why priority order

The tags are ordered by strength of evidence:

```
[CÓDIGO] > [ADJUNTO] > [CONFIG] > [DOC] > [NOTEBOOKLM] > [STAKEHOLDER] > [INFERENCIA] > [SUPUESTO]
```

This matters for two reasons:

1. **Reviewer triage.** A reviewer scanning a deliverable can grep for `[SUPUESTO]` to find everything the agent wasn't sure about. They can grep for `[CÓDIGO]` to find the hard-tied-to-reality claims.
2. **Gate enforcement.** Gates check tag density (e.g. ≥ 60% at priority 1-4 by G1). Without priority, "evidence density" would be meaningless — all tags would count equally, defeating the discipline.

## `[SUPUESTO]` as a feature

The counter-intuitive design choice: `[SUPUESTO]` is **allowed**. An agent can state an assumption, but it must be visible.

Why allow it: pre-sales artefacts are drafts in motion. Some claims cannot yet be grounded (client hasn't confirmed volumes; technical spec isn't public). Forcing the agent to invent a grounding — or to drop the claim — produces worse deliverables than asking it to flag the assumption honestly.

Why visible: an invisible assumption is a lie. A visible one is an open question. Open questions are resolvable; lies compound.

## Density thresholds

- **> 30 % `[SUPUESTO]`** → banner warning. The deliverable is more hypothesis than evidence.
- **`[SUPUESTO:severity=CRÍTICO]` unresolved** → blocks gate promotion. The claim is load-bearing; if it's wrong, every downstream deliverable drifts.

## Costs

- **Visual noise.** Tags clutter dense prose. Mitigated by brand HTML renderer styling tags terse + colour-coded.
- **Agent discipline.** Agents must choose a tag every time. Mitigated by prompt engineering + `evidence-tagging` skill as a shared reference.
- **Over-tagging `[INFERENCIA]`.** Agents sometimes flag as inference what is really observable. Counter-measure: reviewer habit + evidence-upgrade passes.

## Alternatives considered

- **Calibration scores (confidence 0-100).** Pseudo-precision; readers have no basis to interpret "72 %".
- **Footnotes.** Disrupt skim-reading; don't convey priority; harder to grade.
- **Prose hedging.** Ignored by readers.

## Related

- [ADR-0002](../adr/0002-evidence-tag-priority-chain.md)
- [ADR-0014](../adr/0014-zero-hallucination-protocol.md)
- `references/ontology/protocol-zero-hallucination.md`
- [`../reference/evidence-tags/`](../reference/evidence-tags/README.md)
