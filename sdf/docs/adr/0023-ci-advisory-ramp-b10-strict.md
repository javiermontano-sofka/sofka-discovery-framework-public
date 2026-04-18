# ADR-0023: Validators ship advisory first, flip blocking after baseline converges

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

The six validators (ADR-0022) are useful only if they are trusted. A validator that blocks merges on day 1 — when the existing codebase has pre-existing failures the validator has never seen — destroys trust: contributors learn to "just silence the red badge" and the tool becomes theatre.

Kent Beck's shift-left testing wisdom: the validator needs a period of time where it surfaces drift without blocking, so both code and validator converge on a trustworthy baseline.

## Decision

Validators ship with `continue-on-error: true` in their CI jobs (advisory mode). Once the baseline converges in B10 of the v13.4.1 cycle, B10's commit flips the flag to `false` (strict mode), at which point CI failures block PR merge.

Criteria for flip (checked in B10):
- Every elevated doc passes all six validators locally.
- Any findings classified as "acceptable / documented exception" are added to validator allowlists.
- `run-all.sh` exits 0 on the main branch.

Advisory period ends when the flip commit lands. Post-flip, new failures block. Legacy findings, if any remain, become ADR-0024-style documented exceptions.

## Consequences

### Positive
- Trust is earned, not demanded. Contributors see validators as a useful signal, not a nagging gate.
- Baseline is visible, auditable, and stabilized before enforcement.

### Negative
- Brief window (B9-B10) where a bug can slip through CI. Mitigated by every batch's human review.

### Neutral
- Flip is a one-line YAML change; easily auditable in the commit that performs it.

## Alternatives considered

- **Block from day 1** — dismissed: see context.
- **Permanent advisory mode** — dismissed: advisory-only mode atrophies; validators need teeth eventually.
- **Per-validator flip** — considered; rejected as unnecessary complexity. A single flip keeps the commit message clean.

## References

- `sdf/.github/workflows/docs-quality.yml`
- ADR-0022 (validator stack)
