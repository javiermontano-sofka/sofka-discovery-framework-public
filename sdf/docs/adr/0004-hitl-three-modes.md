# ADR-0004: Three HITL modes — --auto, --hitos, --paso-a-paso

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Human-in-the-loop (HITL) is not a binary. Sometimes the user wants full autonomy (overnight batch); sometimes they want to review at every key decision (high-stakes deal); sometimes they want to steer every agent hand-off (learning SDF for the first time).

Forcing one mode creates friction at both ends: autonomous mode feels reckless to new users; step-by-step mode wastes the senior user's time.

## Decision

Every pipeline command supports three orthogonal HITL modes, selected by flag:

- **`--auto`** — fully autonomous; gates become advisory (logged but not blocking). Default for `/sdf:run-auto`.
- **`--hitos`** — milestone-based: pauses at each of the 5 gates (G0 → G3) for human approval. Default for most `/sdf:run-*` commands.
- **`--paso-a-paso`** — step-by-step: pauses after every phase transition (P0 → P9, 11 touchpoints). Used for learning or very-high-stakes engagements.

Mode is sticky within a session (state persisted to `.discovery/session-state.json`); user can switch mid-session with `/sdf:set-mode <auto|hitos|paso-a-paso>`.

## Consequences

### Positive
- One mental model, three volume knobs. Users self-select.
- Audit log shows mode per phase transition → reviewable trail.
- Teaching mode (`--paso-a-paso`) is a first-class feature, not an afterthought.

### Negative
- Three modes × gates × phases multiplies test surface. Mitigated by treating modes as flags to a single state machine rather than separate pipelines.
- `--auto` can skip a blocker silently if the user forgets it's engaged. Mitigated by banner at session start.

### Neutral
- Mode names are Spanish by default (`--hitos`, `--paso-a-paso`) matching LatAm audience (ADR-0012). English aliases `--milestones`, `--step-by-step` exist for portability.

## Alternatives considered

- **Boolean `--interactive`** — dismissed: hides the granularity users care about.
- **Per-gate per-phase toggles** — dismissed: user cognitive overload.
- **Auto-detect from context** — dismissed: too clever; surprising behaviour destroys trust.

## References

- `references/ontology/session-automation.md`
- ADR-0003 (gates that --hitos pauses at)
- `docs/explanation/why-hitl-modes.md` (B5)
