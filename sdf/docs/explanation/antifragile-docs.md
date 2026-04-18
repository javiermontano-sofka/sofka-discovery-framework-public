# Antifragile docs — the corrections loop

> *"Antifragility is beyond resilience or robustness. The resilient resists shocks and stays the same; the antifragile gets better."* — Nassim Taleb, *Antifragile* (2012)

Documentation is fragile by default. A doc written today is wrong tomorrow: code changes, counts drift, links break, new concepts appear, old ones fade. The default response — fix it when spotted, move on — is resilience at best (the same class of bug returns) and quite often regression (the fix creates a new error elsewhere).

This essay describes the **antifragile loop** SDF adopts, where every stressor produces a permanent strengthening. Formalised in [ADR-0020](../adr/0020-antifragile-corrections-loop.md).

## The loop

When a user, reviewer, or CI finds an error:

```
1. Fix the immediate error.
2. Record a lesson in references/ontology/lessons-learned.md.
3. Add a validator that would have caught it, if possible.
4. If the mistake reveals a missing concept, author an ADR or explanation essay.
5. Note it in CHANGELOG.md for the release.
```

Five steps. The first is reflex. The remaining four are what make the difference.

## Worked example — the 215→214 bug

**Context.** v13.3 docs claimed "215 skills" across six elevated documents (root CLAUDE/README, sdf/CLAUDE/README, sap/CLAUDE/README). The actual count was 214. The bug lived for weeks.

**Loop applied:**

1. **Fix** — B0 of this cycle updated all six docs from 215 to 214. One commit.
2. **Record** — `lessons-learned.md` got an entry: date, mistake, root cause ("number propagated across docs manually, no verification"), fix.
3. **Validator** — `count-parity.py` shipped in B9. The manifest declares the claim; the validator runs `find … | wc -l` and fails if they diverge. The next number drift fails CI.
4. **Missing concept** — reading the lesson suggested a validator stack was conceptually underrepresented; ADR-0022 formalised it.
5. **CHANGELOG** — v13.4.1 entry mentions the count fix + new validator.

Result: the specific bug is fixed, and the *class* of bug is now impossible (or at least CI-visible).

## Why this is antifragile, not resilient

A resilient system resists the same shock better next time. An antifragile system is *strengthened* by the shock. The 215→214 story did not just prevent that number from drifting; it produced a validator that prevents *any* number claim from drifting — counts we haven't thought to track yet will become trackable by adding a line to `_manifest.yaml`.

Each applied loop adds to the validator stack. Over time, the stack encodes the team's accumulated suspicion — a living auto-review of every class of mistake that has ever been made.

## Necessary conditions

The loop only works under some conditions:

- **Visibility of errors.** Without adversarial review or CI, the loop never starts. SDF's validator stack + periodic adversarial audits supply the signal.
- **Tooling that makes the loop cheap.** `scripts/ecosystem/record-lesson.sh` templates step 2. Writing a validator is step 3's friction; the lower it is, the more often step 3 happens.
- **Culture that values it.** If the reflex is "fix and close the ticket", steps 2-5 get skipped. SDF's CONTRIBUTING makes the full loop the default.

## Limits

Not every error yields a validator. Sometimes the cause is a human judgment call; no regex can catch it. In those cases steps 3 is best-effort; the lesson + possibly an ADR still ship.

Not every lesson becomes an ADR. ADRs are for decisions; lessons are for mistakes. If the mistake reveals that *no one had ever decided* the thing, an ADR is warranted. If the mistake was "we knew, we forgot", a lesson + validator suffices.

## Connection to Taleb

Taleb's examples are evolutionary (species under selection pressure) and financial (portfolios with long-tail optionality). Docs are a modest application, but the principle transfers: the cost of an error + the learning generated from it > zero. Over enough cycles, the system that internalises learning dominates the system that merely resists.

The alternative — a system that optimises for never being stressed — is fragile in the opposite direction: small stressors become catastrophic because the system was never exposed to them. Our validators are cheap; our stressors are frequent; the strengthening compounds.

## Related

- [ADR-0020](../adr/0020-antifragile-corrections-loop.md) — the decision
- `scripts/ecosystem/record-lesson.sh` — the tool that makes step 2 cheap
- `docs/how-to/handle-a-doc-regression.md` (B6) — the recipe
- Taleb, N.N. (2012). *Antifragile: Things That Gain from Disorder*. Random House.
