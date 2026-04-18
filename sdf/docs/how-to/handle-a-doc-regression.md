# How to handle a doc regression (the antifragile loop)

**When you need this**: A doc error was found — by a reviewer, user, CI, or you.

**Prerequisites**: The error is reproducible.

**Time**: 15 min (simple fix) to 2 h (fix + ADR + validator).

## The loop (5 steps)

### 1. Fix the error

Smallest PR that addresses the specific mistake. Don't expand scope.

```bash
git checkout -b fix/<scope>-<slug>
# edit files
git commit -m "fix(<scope>): <one-line>"
```

### 2. Record the lesson

Append to `references/ontology/lessons-learned.md`:

```bash
bash sdf/scripts/ecosystem/record-lesson.sh <topic>
```

Fill: date, mistake description, root cause, fix, validator-added (yes/no/NA).

### 3. Add a validator (if possible)

Ask: what programmatic check would have caught this?

- Count drift → extend `count-parity.py` manifest.
- Missing file reference → `cross-refs.py` covers this already; confirm the claim was in-scope.
- Undefined acronym → add to `GLOSSARY.md`.
- ADR mutation → `adr-integrity.py` covers this; investigate why it didn't fire.
- Novel class → new validator under `scripts/validators/`.

### 4. Missing concept → new ADR or essay

If the lesson reveals a conceptual gap:

- Decision missing → new ADR ([write-new-adr.md](write-new-adr.md)).
- Understanding missing → new essay in `docs/explanation/`.

### 5. Changelog

Update `sdf/CHANGELOG.md` with a bullet for this cycle:

```markdown
### Fixed
- <what> — via <validator|ADR> (lessons-learned-2026-MM-DD)
```

## Verification

- Fix commit lands.
- `lessons-learned.md` has a new entry.
- `run-all.sh` exits 0 (including any new validator).
- CHANGELOG reflects the cycle.

## Common pitfalls

- Skipping step 2 = the class of bug recurs.
- Skipping step 3 when possible = trust depends on future human memory.
- Over-reacting with a new ADR for every lesson — ADRs are for decisions, not learnings.

## See also

- [ADR-0020](../adr/0020-antifragile-corrections-loop.md)
- [`../explanation/antifragile-docs.md`](../explanation/antifragile-docs.md)
- `scripts/ecosystem/record-lesson.sh`
