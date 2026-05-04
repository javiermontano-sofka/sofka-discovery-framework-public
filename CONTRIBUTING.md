# Contributing

How to propose changes to this monorepo without breaking its antifragile guarantees.

## The short path (common case)

```bash
# 1. Create feature branch
git checkout -b feat/<scope>-<topic>            # e.g. feat/sdf-new-evidence-tag

# 2. Make your change

# 3. Run the pre-PR gate (same checks CI runs)
python sdf/scripts/tests/validate_yaml.py && \
  bash sdf/scripts/audit-sdk-compliance.sh && \
  bash sdf/scripts/audit-command-prefixes.sh && \
  bash sdf/scripts/validators/run-all.sh && \
  (cd sdf/scripts/tests && pytest -q)

# 4. Commit with conventional-ish prefix
git commit -m "feat(sdf): <short>" -m "<why + what>"

# 5. Push + open PR
git push -u origin feat/<scope>-<topic>
gh pr create --title "<scope>: <short>" --body-file .github/PULL_REQUEST.md
```

All five checks must exit 0 for the PR to merge. No `--no-verify`, no `continue-on-error` on your own commits.

## What kind of change am I making?

Different change types trigger different requirements. This section tells you which.

### Changing a fact (a number, a name, a path)

1. Change it in the canonical source (filesystem).
2. Update `sdf/scripts/validators/_manifest.yaml` if it's a tracked count.
3. Update every doc that cites it — `count-parity` will list them if you forget.
4. Commit with `fix(docs): <what>`.

### Adding a new agent / skill / command

Route: existing process (frontmatter, INSIGNIA 7/7 for skills, `/sdf:` prefix for commands). Then:
- If the change requires a new concept → glossary entry.
- If the change requires a rule/invariant → new ADR.
- If the change requires a user-facing recipe → new how-to.

### Adding a new evidence tag

This is a protocol change. Workflow:
1. Open an issue or discussion proposing the tag.
2. Draft an ADR (copy `sdf/docs/adr/TEMPLATE.md` to `NNNN-add-tag-X.md`) with Context / Decision / Consequences.
3. Update `sdf/references/ontology/protocol-zero-hallucination.md` with the tag + priority position.
4. Update `sdf/GLOSSARY.md` with the definition.
5. Run all validators — they'll flag any existing docs that assume the old priority order.
6. Commit as one atomic change: ADR + protocol + glossary + validator manifest + any doc edits.

### Adding a new quality gate

Same as evidence-tag change but touches `quality-gates.md` and `pipeline-orchestration.md`. Gates are load-bearing — don't add lightly. If a proposed gate has <5 concrete failure modes documented, reject it.

### Fixing a bug the user just reported (antifragile loop)

Mandatory sequence:
1. **Fix the immediate issue.**
2. **Record the lesson**: `bash sdf/scripts/ecosystem/record-lesson.sh "<topic>"` (will be available after B5 ships). Alternative until then: append a dated entry to `sdf/references/ontology/lessons-learned.md` with `date | mistake | root cause | fix | validator/test added`.
3. **Add a test or validator** that would have caught it. If not possible in automated form, note *why* in the lessons entry.
4. **If the mistake reveals a missing concept**: draft an ADR or explanation essay pointing at it.
5. **Update CHANGELOG** with a short entry crediting the report.

Goal: every stressor becomes permanent improvement. A repeated report is a failure of this loop.

## Doc-writing standards

### Diátaxis purity

Each doc in `sdf/docs/` lives in one of four quadrants. Know which one before you start writing.

| Quadrant | Purpose | Forbidden in this quadrant |
|----------|---------|---------------------------|
| `tutorials/` | Learning. Narrative. Fictional example. Holds the reader's hand. | Tables of spec values. "See reference for details." Exhaustive coverage. |
| `how-to/` | Goal-oriented recipe. Real problem, discrete steps. | Tutorial chatter ("let's explore"). Background theory. |
| `reference/` | Dry spec. Exhaustive. Tables and lists. | "In this tutorial…". Prose essays. Imperatives addressed to the reader. |
| `explanation/` | Essay. Conceptual. Answers "why". | Step-by-step imperatives. Reference tables of values. |

Mixing modes weakens both audiences. The `diataxis-purity` validator flags obvious violations as warnings.

### Evidence tags in docs

Any factual claim in an elevated doc should be verifiable. If you write "X takes ~90 minutes", `count-parity` can't check that, but a reviewer will ask how you measured. Two options:
- Measure it, write "`X` took 87 minutes on commit `<sha>` on <hardware>" → `sdf/docs/reference/metrics.md`.
- Drop the claim. Hedging ("typically", "around", "usually") is not a measurement.

### Acronym discipline

Expand on first use with an inline link to GLOSSARY. Add new acronyms to `sdf/GLOSSARY.md` (not scattered defs). `acronym-gate` validator enforces.

### Counts

Any integer claim about the repo must be in `sdf/scripts/validators/_manifest.yaml` or will drift. If you add a count claim, add it to the manifest. If you change the filesystem such that the count changes, update the manifest in the same commit.

## Commit + PR conventions

- **Branch names**: `feat/<scope>-<topic>`, `fix/<scope>-<topic>`, `docs/<scope>-<topic>`, `chore/<scope>-<topic>`.
- **Commit subject**: under 72 chars, `<type>(<scope>): <what>`.
- **Commit body**: explain the *why*. For ADR-triggering changes, include the ADR number.
- **PR body**: use `.github/PULL_REQUEST.md` as template.
- **Co-authorship**: if AI-assisted, include `Co-Authored-By: Claude …` trailer (current monorepo practice).

## What we refuse

- **`$PLUGIN_DIR` in new code** — use `${CLAUDE_PLUGIN_ROOT}` with fallback.
- **Green colors anywhere** — brand rule. Use `--pos` (`#FFD700`) for success states.
- **Prices** — FTE-meses P50/P80/P95 only.
- **Modifying Accepted ADRs** — supersede with a new ADR. `adr-integrity` enforces.
- **Introducing a new acronym without a GLOSSARY entry** — `acronym-gate` fails.
- **Adding a count claim without a manifest entry** — `count-parity` fails on the next filesystem change.
- **Skipping validator jobs with `continue-on-error`** — use the advisory ramp only for validator bootstrap (already done in B9); feature PRs run strict.

## Scope notes

- This file is the **monorepo-level** CONTRIBUTING. Plugin-specific overrides live at `sdf/CONTRIBUTING.md` and (in a future cycle) `sap-enterprise-plugin/CONTRIBUTING.md`.
- For sibling plugins inside `sdf/` (MAO GPL-3.0, PM, SA, plugin-qa): follow the GPL obligations where relevant; otherwise same process.

## When in doubt

Open an issue, not a PR. "Should we?" questions belong in discussion; "here's how we do this" belongs in a PR.

---

**Author**: Javier Montaño · **Contributors**: Jean Ruiz Granda, Catherine Rodrigo · **Co-authored with**: Claude Code · **Copyright**: © 2026 Sofka Technologies. All Rights Reserved. Tecnología para sofkianos.  
**Tagline**: Tecnología para sofkianos.
