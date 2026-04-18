# Skill Robustness Template — Canonical Scaffold

> Inspired by `skill-creator` (Anthropic). Use this when promoting any SAP plugin skill to "robusta".

## How to Use

```bash
# Copy template into your skill
SKILL=sap-discovery
cp -r references/skill-robustness-template/* skills/$SKILL/

# Customize each file with domain-specific content (don't leave placeholders)
# Then audit:
bash scripts/audit-skill-robustness.sh $SKILL
```

## Contents

| File | Purpose |
|------|---------|
| `agents/grader.md` | QA grader template — replace with domain assertions |
| `agents/reviewer.md` | Domain reviewer — replace with specific expertise |
| `assets/output-template.md` | Deterministic output format |
| `assets/sample-output.md` | Canonical example filled |
| `references/schemas.md` | Output schemas (JSON/Markdown structure) |
| `scripts/validate.sh.template` | Skill-specific validator (rename and customize) |
| `evals/evals.json` | Test cases with assertions |
| `prompts/metaprompts.md` | Meta-instructions for invoking the skill |
| `prompts/use-case-prompts.md` | Realistic user phrasings |
| `examples/README.md` | Index to examples |

## Fill-in Checklist

- [ ] Replace every `{DOMAIN}`, `{SKILL_NAME}`, `{FOCUS}` placeholder
- [ ] `grader.md`: write 3+ domain-specific assertions
- [ ] `reviewer.md`: specialize voice to the skill
- [ ] `assets/output-template.md`: real sections, not generic
- [ ] `sample-output.md`: realistic filled content (not lorem ipsum)
- [ ] `schemas.md`: actual JSON/MD shape expected
- [ ] `scripts/validate.sh`: rename to `validate-<skill>.sh` + real checks
- [ ] `evals.json`: 3+ test prompts + matching assertions
- [ ] `examples/`: add 1-2 rendered examples

## Audit Target

`scripts/audit-skill-robustness.sh <skill>` → ≥ 5/7 (ROBUSTA mínimo viable)

Author: Javier Montaño
