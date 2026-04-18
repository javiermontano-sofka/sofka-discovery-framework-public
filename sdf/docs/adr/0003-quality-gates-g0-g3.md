# ADR-0003: Five quality gates — G0 · G1 · G1.5 · G2 · G3

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Un-gated pipelines drift silently: agents produce content, downstream agents consume it, errors compound. Gates make drift visible at fixed, inspectable checkpoints — they are the equivalent of phase reviews in classical project management, but agent-native and programmatic.

Prior art: PMBOK phase reviews, NASA DRR/PDR/CDR, stage-gate product management (Cooper 1986). The innovation is **G1.5** — a fractional gate dedicated to feasibility before cost modeling, because bad feasibility poisons every downstream artefact.

## Decision

SDF has **5 gates** in fixed order:

| Gate | Scope | Blockers |
|------|-------|----------|
| **G0** | Security + attachment sanity (runs at session start) | Secret leak in priming-rag; path traversal; malformed extractor output |
| **G1** | Discovery completeness (P0–P4 stages) | AS-IS evidence density; stakeholder coverage; scope boundedness |
| **G1.5** | Feasibility verdict by Think Tank (7 Sabios) | Technical feasibility; integration risk; hardware ceiling; economic sanity |
| **G2** | Budget + timeline bounded (P5–P6 stages) | Cost estimate has ranges, not point values; FTE-meses plausible |
| **G3** | Final deliverable review (P7–P9 stages) | Ghost menu present; evidence coverage; brand compliance |

Gates are **hard stops** by default; `--auto` mode can flip them to advisory but records a metacognitive note.

## Consequences

### Positive
- Errors caught early are cheap. An AS-IS evidence gap stops at G1; catching it at G3 would mean rewriting downstream deliverables.
- Gates give humans natural intervention points (HITL --hitos mode).
- Structured governance story for enterprise buyers.

### Negative
- Five gates add friction for simple engagements. Mitigated by `/sdf:run-express` (collapses to G1 + G3 for Go/No-Go).
- G1.5 specifically can feel heavy for small scopes. Kept anyway: the one session where feasibility was skipped cost 3 days of rework (captured as a lesson-learned).

### Neutral
- Gate count is stable. Adding a new gate is a supersede; removing one is unlikely (ADR-0018 excepted, SAP-specific).

## Alternatives considered

- **Three gates (classical stage-gate)** — dismissed: G1.5 feasibility needs a dedicated review, Think Tank can't be squeezed into G1.
- **Continuous CI-style gating** (every artefact gets micro-gated) — dismissed: creates alert fatigue; loses signal.
- **No gates, quality-guardian as sole arbiter** — dismissed: quality-guardian is a reviewer, not a gatekeeper; blocking authority needs to be architectural, not agentic.

## References

- `references/ontology/quality-gates.md`
- `docs/reference/gates/` (per-gate specs, B4)
- ADR-0018 (SAP G0 omission) — supersedes SAP-only
