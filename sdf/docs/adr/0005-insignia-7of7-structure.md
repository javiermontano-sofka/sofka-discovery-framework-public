# ADR-0005: INSIGNIA 7/7 skill structure

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Anthropic's skills framework requires only a `SKILL.md`. The minimum is fine for trivial skills, but SDF skills routinely encode multi-page procedures with domain knowledge, quantitative grading, and runnable scripts. A minimal skill can't be evaluated, improved, or audited — it's a black box.

Prior art: Anthropic's skill-creator evals pattern + SAP plugin's v4 structure + scientific reproducibility (methods + code + data). INSIGNIA = "Integrated Skill Indexing, Grading, Notation, Instructions, Artefacts" — internal mnemonic for the 7-file contract.

## Decision

Every MOAT skill in SDF ships **all 7** of these directories/files:

```
skills/<skill-name>/
├── SKILL.md                     (1) required by Anthropic — frontmatter + body
├── agents/grader.md             (2) grader persona + rubric for evals
├── evals/evals.json             (3) test prompts + assertions
├── references/                  (4) domain knowledge loaded on demand
├── examples/                    (5) concrete input/output pairs
├── scripts/                     (6) runnable helpers (deterministic logic)
└── prompts/                     (7) NL-HP composable prompt fragments
```

The `audit-compliance.sh` script classifies each skill as 7/7 (INSIGNIA) or less and surfaces drift.

## Consequences

### Positive
- Every skill is evaluable (evals + grader) → improvable.
- Every skill teaches (references + examples + prompts) → discoverable by other agents.
- Every skill is composable (scripts + prompts) → reusable across agents.
- Clear authoring contract for contributors.

### Negative
- 7/7 is heavy for a trivial skill. Trade-off accepted: SDF values depth over breadth; trivial skills should either graduate to 7/7 or live in a lighter-weight plugin.
- Keeping evals current is ongoing work. Mitigated by `heuristic-evals.py` auto-generator (ai-generated tier until human-reviewed).

### Neutral
- Counting: SDF has 214 skills; compliance score is a moving number tracked in `lessons-learned.md`.

## Alternatives considered

- **Minimum SKILL.md only** — dismissed: loses evaluability and composability.
- **5-file structure without prompts/examples** — dismissed: NL-HP prompts are a first-class asset; examples are what make a skill learnable by humans.
- **Add an 8th — changelog per skill** — dismissed: git log already provides this; 8/8 is bikeshedding.

## References

- `scripts/audit-compliance.sh` — 7/7 classifier
- ADR-0022 (validator stack)
- `docs/explanation/why-insignia-7of7.md` (B5)
