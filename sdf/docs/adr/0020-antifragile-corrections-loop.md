# ADR-0020: Antifragile corrections loop — every stressor produces an artefact

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Bugs, doc errors, and mis-renders recur. The default response (fix-and-forget) means the same class of mistake visits twice. Taleb's antifragility frame reframes stressors as inputs: a system that gains from disorder needs a mechanism that turns each stressor into a permanent improvement.

For docs specifically, the adversarial review that preceded this cycle found "215 skills" in 6 places when the true count was 214. One fix across six files doesn't prevent the next count-drift; a count-parity validator does.

## Decision

The **five-step corrections loop** applies whenever a user (or reviewer) finds an error:

1. **Fix** the immediate error (a commit).
2. **Record a lesson** in `references/ontology/lessons-learned.md` with: date, mistake, root cause, fix.
3. **Add a validator** — when possible, a programmatic check that would have caught the bug.
4. **Author a missing doc** — if the mistake reveals a missing concept, write an ADR or an explanation essay.
5. **Changelog entry** — tie it to the release.

Canonical example: "215 skills" bug → 215→214 fix (B0) + count-parity.py validator (B9) + ADR-0022 (validator stack) + CHANGELOG v13.4.1 entry.

Supporting infrastructure: `scripts/ecosystem/record-lesson.sh` templates a lesson-learned entry with required fields; `docs/how-to/handle-a-doc-regression.md` operationalises the loop for contributors.

## Consequences

### Positive
- Each stressor is a permanent improvement, not a one-off firefight.
- The validator set compounds: every documented regression strengthens CI.
- Contributors learn a reflex: fix → lesson → validator.

### Negative
- Overhead per fix. Mitigated: step 3 is best-effort; if no validator is feasible, the lesson + doc still ship.
- Can produce validator sprawl. Mitigated by periodic validator consolidation (ADR when that happens).

### Neutral
- This is a cultural-technical process, not a tool. It requires discipline; the tool (`record-lesson.sh`) makes discipline cheaper.

## Alternatives considered

- **Just fix and move on** — dismissed: same class of bug recurs.
- **Post-mortem template** — dismissed as too heavy for doc bugs; adopted for incident response instead (outside this ADR).

## References

- Taleb, Nassim. *Antifragile: Things That Gain from Disorder*. 2012.
- `docs/explanation/antifragile-docs.md` (B5 — canonical narrative)
- `scripts/ecosystem/record-lesson.sh`
- `references/ontology/lessons-learned.md`
- ADR-0022 (validator stack — step 3's substrate)
