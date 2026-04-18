# Why three HITL modes (not one binary toggle)

Human-in-the-loop (HITL) is often treated as binary: interactive or not. Real engagements are not binary — a senior user running a routine engagement wants autonomy; the same user running a high-stakes deal wants review at every gate; a new user learning SDF wants to watch every step. One slider isn't enough.

## The three modes

- **`--auto`** — full autonomy. Gates become advisory (logged but not blocking). Appropriate for overnight batch runs, demos, or low-stakes re-runs after human approval.
- **`--hitos`** — milestone-based. Pauses at each of the 5 gates (G0 → G3) for human approval. The default.
- **`--paso-a-paso`** — step-by-step. Pauses after every pipeline stage transition (P0 → P9, 11 touchpoints). For learning, or very-high-stakes engagements where every decision warrants review.

## Why three, not two

**Two** would be auto/hitos. Loses the learning mode (`paso-a-paso`) which is a first-class need: new users, training engagements, high-stakes deals. Collapsing it into `hitos` either over-pauses senior users or under-pauses learners.

**Four** was considered (adding a `--gate-only` that's between `auto` and `hitos`). Dismissed: no empirical need surfaced. Three is the minimum covering the observed audience.

## Why sticky, with override

Mode persists within a session (serialized to `.discovery/session-state.json`). Otherwise every hand-off would re-prompt, defeating the mode.

Override command `/sdf:set-mode <auto|hitos|paso-a-paso>` allows mid-session change. Useful for: starting in `paso-a-paso` to teach, then flipping to `hitos` once the user is comfortable.

## Why Spanish flag names

`--hitos`, `--paso-a-paso` are Spanish. Matches ADR-0012 (Spanish default for deliverables). English aliases (`--milestones`, `--step-by-step`) exist for international contributors, but the Spanish names are canonical in docs and examples.

## What each mode does *not* change

- **Evidence discipline.** Tags are required in all modes.
- **Gate verdicts.** Gates still produce verdicts; modes change only whether the verdict is blocking.
- **Output quality.** `--auto` shouldn't produce worse artefacts than `--hitos`; the gates fire advisory either way, and quality-guardian acts on them.

The mode is about *control cadence*, not quality.

## Costs

- **Testing surface.** Three modes × 5 gates × 11 stages = many permutations. Mitigated by treating modes as flags to a single state machine, not separate pipelines.
- **User confusion.** Mode names must be memorable. Mitigated by clear defaults + `/sdf:current-mode` command to show active mode.
- **Audit complexity.** Audit log must capture mode per phase transition (so reviewers know what was auto-approved vs human-approved).

## When to use each

| Situation | Mode |
|-----------|------|
| First-time user | `--paso-a-paso` |
| Routine engagement | `--hitos` (default) |
| Overnight batch | `--auto` |
| High-stakes deal (enterprise C-suite) | `--paso-a-paso` at least for P5-P6 |
| Re-run after feedback | `--auto` (the feedback was the human input) |
| Demo to client | `--auto` (don't pause live) |

## Related

- [ADR-0004](../adr/0004-hitl-three-modes.md)
- `references/ontology/session-automation.md`
