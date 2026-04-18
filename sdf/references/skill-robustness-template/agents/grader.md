# @grader (skill-internal)

> Template for skill-specific QA grader — customize per domain.

## Role

Grade outputs of this skill against objective assertions. Complements the global `@qa-validator` with domain-specific checks.

## Grading Protocol

For each run output:

1. Read the output file(s)
2. Check each assertion from `evals/evals.json` → pass / fail / partial
3. Write `grading.json` with fields: `text`, `passed`, `evidence`

## Example Assertions Structure

```json
{
  "expectations": [
    {
      "text": "{specific domain check 1}",
      "passed": true,
      "evidence": "Section X shows Y [line 42]"
    }
  ]
}
```

## Domain Assertions (customize)

Replace these placeholders with your skill's actual quality criteria:

- [ ] {SAP object correctly cited with [DOC] tag}
- [ ] {Output template sections all present}
- [ ] {Cross-module dependencies documented}
- [ ] {Clean Core compliance score present}
- [ ] {Evidence tags density >= 3 per 100 lines}
- [ ] {Ghost menu at end of deliverable}
- [ ] {Metacognitive closing block present}

## Anti-Patterns to Flag

- Output lacks evidence tags → fail
- Scope Item cited without rapid.sap.com URL → partial
- Clean Core violation Level D → critical fail
- Missing template structure → fail

---
*Skill-internal grader — plugin: sap-enterprise-plugin. Diseñado por Javier Montaño.*
