# Why INSIGNIA 7/7 skill structure

Anthropic's skill framework requires only a `SKILL.md` file with frontmatter. This minimum works for trivial skills. SDF's skills routinely encode multi-page procedures with domain knowledge, runnable scripts, evaluation rubrics, and prompt fragments. A minimum skill can't be evaluated, improved, or audited — it becomes a black box.

INSIGNIA — "Integrated Skill Indexing, Grading, Notation, Instructions, Artefacts" (a mnemonic, not an acronym with deep meaning) — is the 7-file contract SDF adopts for every MOAT skill.

## The 7 files

```
skills/<skill-name>/
├── SKILL.md                 (1) Anthropic-required — frontmatter + body
├── agents/grader.md         (2) Grader persona + rubric for evaluations
├── evals/evals.json         (3) Test prompts + assertions
├── references/              (4) Domain knowledge, loaded as needed
├── examples/                (5) Concrete input/output pairs
├── scripts/                 (6) Runnable helpers (deterministic logic)
└── prompts/                 (7) NL-HP composable prompt fragments
```

## Why each

- **SKILL.md** — Mandatory. Frontmatter (name, description, allowed-tools), body.
- **grader.md + evals.json** — Enables measurement. A skill without evals is a skill we can't improve. Over time, the eval set becomes the skill's regression test suite.
- **references/** — Domain knowledge separated from the SKILL body keeps SKILL.md under 500 lines (Anthropic's soft limit). References load only when relevant (progressive disclosure).
- **examples/** — Concrete I/O pairs. Machines generalise from the SKILL spec; humans learn from examples.
- **scripts/** — When logic is deterministic (parse X, render Y), scripts are faster and more reliable than re-deriving. Each invocation saves agent thinking time.
- **prompts/** — NL-HP (Natural Language Heuristic Prompts) fragments composable across agents. Keeps prompt vocabulary consistent across the ecosystem.

## Why 7/7 as the standard, not "as much as needed"

**Evaluability.** With evals in place, a skill is measurable. Without, it's a hypothesis. 7/7 makes measurement the default.

**Contributor contract.** "Where does X go?" has a canonical answer. Contributors don't guess.

**Composition.** Agents call skills. Skills can call each other's scripts and include each other's references. 7/7 makes those boundaries explicit.

**Auditable drift.** `audit-compliance.sh` classifies each skill as 7/7 or less. The number is public; drift is visible.

## The cost we accept

Not every skill needs all 7. A trivial skill might ship with SKILL.md only and no meaningful evals. We accept the overhead of 6 largely-empty companion files because:

- The cost is authoring time (once), not runtime (ever).
- Trivial skills often evolve; starting at 7/7 makes evolution cheaper.
- The alternative — mixed standards — creates "where do I look?" friction for every reader.

## What INSIGNIA is not

- It's not an acronym with deep meaning. The letters map to themes (Integrated, Skill, Indexing, Grading, Notation, Instructions, Artefacts) but the mnemonic is secondary to the 7-file contract.
- It's not unique to SDF. Other Anthropic plugins have adopted similar structures. INSIGNIA is the name we use for ours; a cross-plugin convergence would be welcome.

## Evidence it works

- Audit pass rate has steadily climbed from ~40% in v12 to ~95% in v13.3 as contributors internalised the contract.
- Skills with evals improve twice as fast as skills without (measured via iteration count to 90%+ pass rate).
- New contributors report (informally) that the structure makes authoring clearer, not harder.

## Related

- [ADR-0005](../adr/0005-insignia-7of7-structure.md)
- `scripts/audit-compliance.sh`
- Anthropic skills documentation (external)
